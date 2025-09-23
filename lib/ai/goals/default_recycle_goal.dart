import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/craft_schema_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';

class DefaultRecycleGoal extends AIGoal {
  final countToNotRecycle = 5;

  @override
  Future<bool> canRun(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      LoadoutOptimizerService loadoutOptimizerService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) async {
    for (final item in state.character.inventory ?? <InventorySlot>[]) {
      final recipeForItem = worldDataProvider.getRecipeForItem(item.code);
      final canRecycle = recipeForItem?.canRecycle ?? false;
      if (canRecycle) {
        final inventoryCount = state.character.inventory?.count(item.code) ?? 0;
        final bankCount = bankProvider.count(item.code);
        final totalCount = inventoryCount + bankCount;
        if (totalCount > countToNotRecycle) {
          return true;
        }
      }
    }

    for (final item in bankProvider.items) {
      final recipeForItem = worldDataProvider.getRecipeForItem(item.code);
      final canRecycle = recipeForItem?.canRecycle ?? false;
      if (canRecycle) {
        final inventoryCount = state.character.inventory?.count(item.code) ?? 0;
        final bankCount = bankProvider.count(item.code);
        final totalCount = inventoryCount + bankCount;
        if (totalCount > countToNotRecycle) {
          return true;
        }
      }
    }

    return false;
  }

  @override
  Future<void> execute(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    LoadoutOptimizerService loadoutOptimizerService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) async {
    String? itemCodeToRecycle = null;
    for (final item in state.character.inventory ?? <InventorySlot>[]) {
      final recipeForItem = worldDataProvider.getRecipeForItem(item.code);
      final canRecycle = recipeForItem?.canRecycle ?? false;
      if (canRecycle) {
        final inventoryCount = state.character.inventory?.count(item.code) ?? 0;
        final bankCount = bankProvider.count(item.code);
        final totalCount = inventoryCount + bankCount;
        if (totalCount > countToNotRecycle) {
          itemCodeToRecycle = item.code;
          break;
        }
      }
    }

    if (itemCodeToRecycle == null) {
      for (final item in bankProvider.items) {
        final recipeForItem = worldDataProvider.getRecipeForItem(item.code);
        final canRecycle = recipeForItem?.canRecycle ?? false;
        if (canRecycle) {
          final inventoryCount =
              state.character.inventory?.count(item.code) ?? 0;
          final bankCount = bankProvider.count(item.code);
          final totalCount = inventoryCount + bankCount;
          if (totalCount > countToNotRecycle) {
            itemCodeToRecycle = item.code;
            break;
          }
        }
      }
    }

    if (itemCodeToRecycle == null) {
      return;
    }

    final inventoryCount =
        state.character.inventory?.count(itemCodeToRecycle) ?? 0;
    final bankCount = bankProvider.count(itemCodeToRecycle);
    final maxToHaveInInventory =
        ((state.character.inventoryMaxItems - state.character.inventoryCount) /
                2)
            .ceil();
    final amountToRecycle = min(
        maxToHaveInInventory, (inventoryCount + bankCount - countToNotRecycle));

    // We have room to pull some from the bank
    if (inventoryCount < maxToHaveInInventory && bankCount > 0) {
      final amountToPullFromBank = amountToRecycle - inventoryCount;
      if (amountToPullFromBank > 0) {
        teamProvider.queueBankWithdraw(
            state.character,
            BuiltList.of([
              SimpleItemSchemaBuilder()
                  .fromCodeAndQuantity(itemCodeToRecycle, amountToPullFromBank),
            ]));
      }
    }

    // Move to the proper crafting location
    final recipe = worldDataProvider.getRecipeForItem(itemCodeToRecycle);
    final craftLocation = mapProvider.findNearestTile(
        state.character.location,
        (tile) =>
            tile.content?.type == MapContentType.workshop &&
            tile.content?.code == recipe!.skill!.name);
    if (craftLocation == null) {
      LoggerService.instance.log(
        'Failed to find craft location for recycling $itemCodeToRecycle',
        character: state.character,
        level: LogLevel.warning,
      );
      return;
    }
    teamProvider.queueMoveTo(state.character, craftLocation);

    // Do the recycling
    teamProvider.queueAction(
        state.character.name,
        actionFactory.createRecycleAction(
          state.character.name,
          SimpleItemSchemaBuilder()
              .fromCodeAndQuantity(itemCodeToRecycle, amountToRecycle),
        ));
  }

  @override
  Future<GearEvaluationContext?> gearEvaluationContext(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      LoadoutOptimizerService loadoutOptimizerService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) async {
    return null;
  }

  @override
  String get name => 'Default Recycle';

  @override
  int get priority => 12;
}
