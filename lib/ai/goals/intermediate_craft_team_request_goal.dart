import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';

class IntermediateCraftTeamRequestGoal extends AIGoal {
  @override
  String get name => 'Intermediate Craft Team Request';

  @override
  int get priority => 60;

  @override
  bool canRun(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) {
    for (final request in teamBrainProvider.openRequests) {
      // If someone besides us is already fulfilling this request, ignore it.
      if (request.fulfilledBy != null &&
          request.fulfilledBy != state.character.name) {
        final missingItems = _missingItemsNeededToCraft(
            state.character, request.itemName, worldDataProvider, bankProvider);
        // Can we craft something?
        if (_hasSkillToCraft(
            state.character, request.itemName, worldDataProvider)) {
          // We have all the items we need, craft it.
          if (missingItems.isEmpty) {
            return true;
          } else {
            // If we haven't requested missing sub items, request it.
            for (final item in missingItems) {
              if (!teamBrainProvider
                  .hasRequest(_keyForSubRequest(request, item.code))) {
                return true;
              }
            }
          }
        }
      }
    }

    // Nothing we can do with any of the requested items.
    return false;
  }

  @override
  void execute(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) {
    for (final request in teamBrainProvider.openRequests) {
      // If someone besides us is already fulfilling this request, ignore it.
      if (request.fulfilledBy != null &&
          request.fulfilledBy != state.character.name) {
        final missingItems = _missingItemsNeededToCraft(
            state.character, request.itemName, worldDataProvider, bankProvider);
        // Can we craft something?
        if (_hasSkillToCraft(
            state.character, request.itemName, worldDataProvider)) {
          // We have all the items we need, craft it.
          if (missingItems.isEmpty) {
            final item = worldDataProvider.getItemByCode(request.itemName);
            final craftLocation = mapProvider.findNearestTile(
                state.character.location,
                (tile) =>
                    tile.content?.type == MapContentType.workshop &&
                    tile.content?.code == item?.type);
            if (craftLocation != null) {
              teamProvider.queueMoveTo(state.character, craftLocation);
              teamProvider.queueAction(
                  state.character.name,
                  actionFactory.createCraftAction(
                      state.character.name,
                      (SimpleItemSchemaBuilder()
                            ..code = request.itemName
                            ..quantity = request.quantity)
                          .build()));
            }
          } else {
            // If we haven't requested missing sub items, request it.
            for (final item in missingItems) {
              if (!teamBrainProvider
                  .hasRequest(_keyForSubRequest(request, item.code))) {
                teamBrainProvider.postRequest(ItemRequest(
                    _keyForSubRequest(request, item.code),
                    item.code,
                    item.quantity,
                    state.character.name));
              }
            }
          }
        }
      }
    }
  }

  bool _hasSkillToCraft(CharacterSchema character, String item,
      WorldDataProvider worldDataProvider) {
    final schema = worldDataProvider.getRecipeForItem(item);
    if (schema == null) {
      return false;
    }

    if ((character.craftSkills[schema.skill]?.level ?? 1) >=
        (schema.level ?? 1)) {
      return true;
    }

    return false;
  }

  List<SimpleItemSchema> _missingItemsNeededToCraft(
      CharacterSchema character,
      String item,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider) {
    final List<SimpleItemSchema> itemsMissing = [];

    final schema = worldDataProvider.getRecipeForItem(item);
    if (schema == null) {
      return itemsMissing;
    }

    List<SimpleItemSchema> itemsLeft =
        schema.items?.toList() ?? <SimpleItemSchema>[];

    // How many items do we have
    for (final subItem in itemsLeft) {
      final neededItemCode = subItem.code;
      int neededItemCount = subItem.quantity;

      final inventoryCount = character.inventory?.count(neededItemCode) ?? 0;
      if (inventoryCount > 0) {
        neededItemCount = max(neededItemCount - inventoryCount, 0);
      }

      final bankCount = bankProvider.count(neededItemCode);
      if (bankCount > 0) {
        neededItemCount = max(neededItemCount - bankCount, 0);
      }

      // Unable to fulfill this request, so return false
      if (neededItemCount > 0) {
        itemsMissing.add((SimpleItemSchemaBuilder()
              ..code = neededItemCode
              ..quantity = neededItemCount)
            .build());
      }
    }

    // Met all demands, can craft.
    return itemsMissing;
  }

  String _keyForSubRequest(ItemRequest request, String subItem) {
    return '${request.key}:$subItem';
  }
}
