import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';

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
      if (request.fulfilledBy == null) {
        final missingItems = _missingItemsNeededToCraft(
            state.character,
            (SimpleItemSchemaBuilder()
                  ..code = request.itemName
                  ..quantity = request.quantity)
                .build(),
            worldDataProvider,
            bankProvider);
        // Can we craft something?
        if (_hasSkillToCraft(
            state.character, request.itemName, worldDataProvider)) {
          // We have all the items we need, craft it.
          if (missingItems.isEmpty) {
            LoggerService.instance.log(
                'Has all items for ${request.key}, can craft.',
                character: state.character);
            return true;
          } else {
            // If we haven't requested missing sub items, request it.
            for (final item in missingItems) {
              if (!teamBrainProvider
                  .hasRequest(_keyForSubRequest(request, item.code))) {
                LoggerService.instance.log(
                    'Need $item for ${request.key}, hasn\'t been requested before... requesting',
                    character: state.character);
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
      if (request.fulfilledBy != null) {
        continue;
      }

      // Do we have the skill to craft it?
      if (_hasSkillToCraft(
          state.character, request.itemName, worldDataProvider)) {
        // Find what we're missing, if any
        final missingItems = _missingItemsNeededToCraft(
            state.character,
            (SimpleItemSchemaBuilder()
                  ..code = request.itemName
                  ..quantity = request.quantity)
                .build(),
            worldDataProvider,
            bankProvider);
        // We have all the items we need, craft it.
        if (missingItems.isEmpty) {
          _craftItem(state, request, teamProvider, mapProvider,
              worldDataProvider, actionFactory, teamBrainProvider);
          return;
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

  void _craftItem(
    CharacterState state,
    ItemRequest request,
    TeamProvider teamProvider,
    MapProvider mapProvider,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    TeamBrainProvider teamBrainProvider,
  ) {
    final recipe = worldDataProvider.getRecipeForItem(request.itemName);

    // See if we need to pull any items from the bank
    List<SimpleItemSchema> itemsToPullFromBank = [];
    for (final subItem in recipe?.items ?? <SimpleItemSchema>[]) {
      final itemCode = subItem.code;
      int neededCount = subItem.quantity;

      final inventoryCount = state.character.inventory?.count(itemCode) ?? 0;
      neededCount = max(neededCount - inventoryCount, 0);

      if (neededCount > 0) {
        itemsToPullFromBank.add((SimpleItemSchemaBuilder()
              ..code = subItem.code
              ..quantity = subItem.quantity)
            .build());
      }
    }

    if (itemsToPullFromBank.isNotEmpty) {
      LoggerService.instance
          .log('Need items from bank, fetching', character: state.character);
      teamProvider.queueBankWithdraw(
          state.character, BuiltList.of(itemsToPullFromBank));
      for (final item in itemsToPullFromBank) {
        teamBrainProvider
            .completeRequestKey(_keyForSubRequest(request, item.code));
      }
    }

    // Find and move to our craft workbench location.
    final craftLocation = mapProvider.findNearestTile(
        state.character.location,
        (tile) =>
            tile.content?.type == MapContentType.workshop &&
            tile.content?.code == recipe?.skill?.name);
    if (craftLocation == null) {
      LoggerService.instance.log(
          'Can\'t find craft workbench for ${recipe?.skill}',
          character: state.character,
          level: LogLevel.warning);
      return;
    }
    teamProvider.queueMoveTo(state.character, craftLocation);

    // Craft the item
    teamProvider.queueAction(
        state.character.name,
        actionFactory.createCraftAction(
            state.character.name,
            (SimpleItemSchemaBuilder()
                  ..code = request.itemName
                  ..quantity = 1)
                .build()));
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
      SimpleItemSchema item,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider) {
    final List<SimpleItemSchema> itemsMissing = [];

    final schema = worldDataProvider.getRecipeForItem(item.code);
    if (schema == null) {
      LoggerService.instance.log('Can\'t find recipe for ${item.code}',
          character: character, level: LogLevel.warning);
      return itemsMissing;
    }

    List<SimpleItemSchema> itemsLeft =
        schema.items?.toList() ?? <SimpleItemSchema>[];

    // How many items do we have
    for (final subItem in itemsLeft) {
      final neededItemCode = subItem.code;
      int neededItemCount = subItem.quantity;

      final inventoryCount = character.inventory?.count(neededItemCode) ?? 0;
      neededItemCount = max(neededItemCount - inventoryCount, 0);

      final bankCount = bankProvider.count(neededItemCode);
      neededItemCount = max(neededItemCount - bankCount, 0);

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
