import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
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

class CompleteServerTaskGoal extends AIGoal {
  @override
  int get priority => 80;

  @override
  String get name => 'Server Task';

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
    // no task yet, can accept a new one
    if (state.character.task.isEmpty) {
      return true;
    }

    // task is complete, can turn it in
    if (_taskDone(state, bankProvider)) {
      return true;
    }

    // Combat task, see if we can make progress.
    if (state.character.taskType == TaskType.monsters.name) {
      final monster = worldDataProvider.getMonsterByCode(state.character.task);
      if (monster != null) {
        return combatService.canWinFight(state.character, monster);
      }
    }

    // Item task, see if we've requested the items.
    if (state.character.taskType == TaskType.items.name) {
      if (!teamBrainProvider.hasRequest(
          null,
          _buildBrainRequestKeyPrefix(state.character),
          state.character.task,
          state.character.name)) {
        return true;
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
    final character = state.character;

    // --- State 1: NO TASK ---
    // If we don't have a server task, our goal is to get one.
    if (character.task.isEmpty) {
      _getNewTask(state, aiService, mapProvider, teamProvider, actionFactory);
      return;
    }

    // --- State 2: TASK COMPLETE ---
    // If progress is done, our goal is to turn it in.
    if (_taskDone(state, bankProvider, checkBank: false)) {
      _turnInTask(state, mapProvider, aiService, actionFactory, teamProvider,
          teamBrainProvider);
      return;
    }

    // --- State 3: TASK IN PROGRESS ---
    // Otherwise, our goal is to work on the current task.
    _workOnTask(state, actionFactory, mapProvider, teamProvider,
        teamBrainProvider, bankProvider, aiService);
  }

  void _getNewTask(
      CharacterState state,
      TeamAIService aiService,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      ActionFactory actionFactory) {
    final character = state.character;

    teamProvider.queueMoveToTaskMaster(state);

    LoggerService.instance.log(
        "AI: at/on way to Task Master, accepting new task.",
        character: character);
    final acceptAction = actionFactory.createAcceptTaskAction(character.name);
    teamProvider.queueAction(character.name, acceptAction);
  }

  void _turnInTask(
    CharacterState state,
    MapProvider mapProvider,
    TeamAIService aiService,
    ActionFactory actionFactory,
    TeamProvider teamProvider,
    TeamBrainProvider teamBrainProvider,
  ) {
    final character = state.character;
    teamProvider.queueMoveToTaskMaster(state);

    LoggerService.instance.log(
        "AI: turning in completed task: ${character.task}.",
        character: character);
    teamBrainProvider.completeRequest(null,
        _buildBrainRequestKeyPrefix(character), character.task, character.name);

    teamProvider.queueTaskDeposit(state);

    final completeAction =
        actionFactory.createCompleteTaskAction(character.name);
    teamProvider.queueAction(character.name, completeAction);
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

    switch (character.taskType) {
      case 'monsters':
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
      case 'items':
        final targetItemName = character.task;
        final targetQuantity = character.taskTotal - character.taskProgress;

        // How many items do we have
        final currentQuantity = character.inventory?.count(targetItemName) ?? 0;
        final remainingQuantity = targetQuantity - currentQuantity;

        // If we have the right amount in the bank, go fetch it.
        final inBank = bankProvider.count(targetItemName);
        if (inBank >= remainingQuantity) {
          final maxFreeSpaceInInventory =
              character.inventoryMaxItems - character.inventoryCount;
          final remainingItemSchema = (SimpleItemSchemaBuilder()
                ..code = targetItemName
                ..quantity = min(remainingQuantity, maxFreeSpaceInInventory))
              .build();
          teamProvider.queueBankWithdraw(
              character, BuiltList.of([remainingItemSchema]));
          return;
        }

        // We don't have the items. Post a request to the Team Brain.
        teamBrainProvider.postRequest(ItemRequest(
          keyPrefix: _buildBrainRequestKeyPrefix(character),
          requestedItem: SimpleItemSchemaBuilder()
              .fromCodeAndQuantity(targetItemName, remainingQuantity - inBank),
          requestedBy: character.name,
          childrenRequests: [],
        ));
        LoggerService.instance.log(
            "AI: Need '$targetItemName', posted request to team.",
            character: state.character);

        break;
    }
  }

  String _buildBrainRequestKeyPrefix(CharacterSchema character) {
    return 'task-${character.task}';
  }

  bool _taskDone(CharacterState state, BankProvider bankProvider,
      {bool checkBank = true}) {
    bool hasItems = false;
    if (state.character.taskType == TaskType.items.name) {
      final character = state.character;
      final targetItemName = character.task;
      int targetQuantity = character.taskTotal - character.taskProgress;

      // Check if we have enough items already
      targetQuantity -= character.inventory?.count(targetItemName) ?? 0;
      hasItems = targetQuantity <= 0;

      // Check if we have enough in the bank
      if (!hasItems && checkBank) {
        targetQuantity -= bankProvider.count(targetItemName);
        hasItems = targetQuantity <= 0;
      }
    }
    return state.character.taskProgress >= state.character.taskTotal ||
        hasItems;
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
    // no task yet, can accept a new one
    if (state.character.task.isEmpty || _taskDone(state, bankProvider)) {
      return null;
    }

    // Combat task, see if we can make progress.
    if (state.character.taskType == TaskType.monsters.name) {
      final monster = worldDataProvider.getMonsterByCode(state.character.task);
      if (monster != null) {
        return GearEvaluationContext(
            taskType: 'overall', targetMonster: monster);
      }
    }

    return null;
  }
}
