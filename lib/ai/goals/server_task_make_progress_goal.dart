import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart'
    show MapContentType, SimpleItemSchemaBuilder;
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/ai/goals/server_task_mixin.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/models/task_type.dart';
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

class ServerTaskMakeProgressGoal extends AIGoal with ServerTaskMixin {
  @override
  String get name => "Work on Task";

  @override
  int get priority => 85;

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
    List<CharacterState> characterStates,
  ) async {
    if (!hasTask(state) || taskDone(state, bankProvider)) {
      return false;
    }

    // Combat task, see if we can make progress.
    switch (taskType(state)) {
      case TaskType.monsters:
        final monster =
            worldDataProvider.getMonsterByCode(state.character.task);
        if (monster != null) {
          CombatGearEvaluationContext gearContext =
              CombatGearEvaluationContext(targetMonster: monster);

          // See if we can win with the stuff we can equip now
          final bestResult = await loadoutOptimizerService
              .bestLoadoutOfAvailableCharacterItems(state.character,
                  gearContext, worldDataProvider, bankProvider);
          if (bestResult is CombatEquipmentLoadoutResult) {
            if (bestResult.canWinFight) {
              return true;
            } else {
              // Request all the best items so our crafters start working towards this.
              await requestAllMissingBestItems(
                  state,
                  gearContext,
                  loadoutOptimizerService,
                  worldDataProvider,
                  bankProvider,
                  teamBrainProvider);
              return false;
            }
          }

          LoggerService.instance.log('Invalid bestResult type: $bestResult',
              character: state.character, level: LogLevel.warning);
          return false;
        }
        break;
      case TaskType.items:
        if (!teamBrainProvider.hasRequest(
            null,
            buildBrainRequestKeyPrefix(state.character),
            state.character.task,
            state.character.name)) {
          return true;
        }

        // Can we deposit any items?
        final remaining =
            state.character.taskTotal - state.character.taskProgress;
        if (remaining > 0) {
          if ((state.character.inventory?.count(state.character.task) ?? 0) +
                  bankProvider.count(state.character.task) >=
              remaining) {
            return true;
          }
        }
        break;
      default:
        return false;
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
    if (hasTask(state) && !taskDone(state, bankProvider)) {
      // Otherwise, our goal is to work on the current task.
      _workOnTask(state, actionFactory, mapProvider, teamProvider,
          teamBrainProvider, bankProvider, aiService);
    }
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
    List<CharacterState> characterStates,
  ) async {
    // Combat task, see if we can make progress.
    if (hasTask(state) &&
        !taskDone(state, bankProvider) &&
        taskType(state) == TaskType.monsters) {
      final monster = worldDataProvider.getMonsterByCode(state.character.task);
      if (monster != null) {
        return CombatGearEvaluationContext(targetMonster: monster);
      }
    }

    return null;
  }

  void _workOnTask(
      CharacterState state,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      TeamBrainProvider teamBrainProvider,
      BankProvider bankProvider,
      TeamAIService aiService) {
    final character = state.character;

    switch (taskType(state)) {
      case TaskType.monsters:
        // Find and fight the specific monster required by the task
        final targetMonsterCode = character.task;

        // Find the closest
        final monsterLocation = mapProvider.findNearestTile(
            character.location,
            (t) =>
                t.content?.type == MapContentType.monster &&
                t.content?.code == targetMonsterCode);
        if (monsterLocation == null) {
          LoggerService.instance.log("AI: Can't find a monster to fight!",
              level: LogLevel.error, character: character);
          return;
        }

        // Move to him and fight!
        teamProvider.queueMoveTo(character, monsterLocation);
        teamProvider.queueAction(character.name,
            actionFactory.createFightAction(character.name, targetMonsterCode));
        break;
      case TaskType.items:
        final targetItemName = character.task;
        var targetQuantityRemaining =
            character.taskTotal - character.taskProgress;

        // No more progress to make... we are ready for turn in.
        if (targetQuantityRemaining <= 0) {
          return;
        }

        // How many items do we have
        final inventoryCount = character.inventory?.count(targetItemName) ?? 0;
        targetQuantityRemaining -= inventoryCount;
        if (targetQuantityRemaining <= 0 || character.isInventoryFull) {
          teamProvider.queueTaskDeposit(state);
          return;
        }

        // If we have the right amount in the bank, go fetch it.
        final inBank = bankProvider.count(targetItemName);
        if (inBank >= targetQuantityRemaining) {
          final maxFreeSpaceInInventory = character.remainingInventorySpace;
          final amountToPull =
              min(targetQuantityRemaining, maxFreeSpaceInInventory);
          final remainingItemSchema = (SimpleItemSchemaBuilder()
              .fromCodeAndQuantity(targetItemName, amountToPull));
          teamProvider.queueBankWithdraw(
              character, BuiltList.of([remainingItemSchema]));
          return;
        }

        // We don't have the items. Post a request to the Team Brain.
        teamBrainProvider.postRequest(ItemRequest(
          keyPrefix: buildBrainRequestKeyPrefix(character),
          requestedItem: SimpleItemSchemaBuilder()
              .fromCodeAndQuantity(targetItemName, targetQuantityRemaining),
          requestedBy: character.name,
          childrenRequests: [],
        ));
        LoggerService.instance.log(
            "AI: Need '$targetItemName', posted request to team.",
            character: state.character);

        break;
      default:
        break;
    }
  }
}
