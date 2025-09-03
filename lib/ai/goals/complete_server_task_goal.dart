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

class CompleteServerTaskGoal extends AIGoal {
  static const taskTypeItems = 'items';
  static const taskTypeMonsters = 'monsters';

  final _random = Random();

  @override
  int get priority => 80;

  @override
  String get name => 'Server Task';

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
    // no task yet, can accept a new one
    if (state.character.task.isEmpty) {
      return true;
    }

    // task is complete, can turn it in
    if (_taskDone(state)) {
      return true;
    }

    // Combat task, see if we can make progress.
    if (state.character.taskType == taskTypeMonsters) {
      final monster = worldDataProvider.getMonsterByCode(state.character.task);
      if (monster != null) {
        return combatService.canWinFight(state.character, monster);
      }
    }

    // Item task, see if we've requested the items.
    if (state.character.taskType == taskTypeItems) {
      if (!teamBrainProvider.openRequests.any(
          (request) => request.key == _buildBrainRequestKey(state.character))) {
        return true;
      }
    }

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
    final character = state.character;

    // --- State 1: NO TASK ---
    // If we don't have a server task, our goal is to get one.
    if (character.task.isEmpty) {
      _getNewTask(state, aiService, mapProvider, teamProvider, actionFactory);
      return;
    }

    // --- State 2: TASK COMPLETE ---
    // If progress is done, our goal is to turn it in.
    if (_taskDone(state)) {
      _turnInTask(state, mapProvider, aiService, actionFactory, teamProvider, teamBrainProvider);
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
    // Find the nearest task master
    final taskMaster = _findTaskMaster(state, mapProvider);

    if (taskMaster == null) {
      LoggerService.instance.log(
          "AI: Can't find a task master.",
          level: LogLevel.warning, character: character);
      return;
    }

    teamProvider.queueMoveTo(character, taskMaster);

    LoggerService.instance.log(
        "AI: at/on way to Task Master, accepting new task.", character: character);
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
    final turnInLocation = _findTaskMaster(state, mapProvider);
    if (turnInLocation == null) {
      LoggerService.instance.log(
          "AI: Completed a task but doesn't know where the task master is!",
          level: LogLevel.error, character: character);
      return;
    }

    teamProvider.queueMoveTo(character, turnInLocation);

    LoggerService.instance.log(
        "AI: turning in completed task: ${character.task}.", character: character);
    teamBrainProvider.completeRequestKey(_buildBrainRequestKey(character));

    // If the task is an item task, you have to deposit the items with the trader before you can complete the task
    if (character.taskType == taskTypeItems) {
      final amountNeededToTurnIn = character.taskTotal - character.taskProgress;
      final amountInInventory = character.inventory?.count(character.task) ?? 0;
      final depositItemsAction = actionFactory.createTaskDepositAction(character.name, (SimpleItemSchemaBuilder()..quantity = min(amountInInventory, amountNeededToTurnIn)..code = character.task).build());
      teamProvider.queueAction(character.name, depositItemsAction);

      // If we didn't deposit all of them, we need to try again.
      if (amountInInventory < amountNeededToTurnIn) {
        return;
      }
    }
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
          LoggerService.instance.log(
              "AI: Can't find a monster to fight!",
              level: LogLevel.error, character: character);
          return;
        }

        // Move to him and fight!
        teamProvider.queueMoveTo(character, monsterLocation);
        teamProvider.queueAction(
            character.name, actionFactory.createFightAction(character.name));
        break;
      case 'items':
        final targetItemName = character.task;
        final targetQuantity = character.taskTotal;

        // How many items do we have
        final currentQuantity = character.inventory?.count(targetItemName) ?? 0;
        final remainingQuantity = targetQuantity - currentQuantity;

        // If we have the right amount in the bank, go fetch it.
        final inBank = bankProvider.count(targetItemName);
        if (inBank >= remainingQuantity) {
          final maxFreeSpaceInInventory = character.inventoryMaxItems - character.inventoryCount;
          final remainingItemSchema = (SimpleItemSchemaBuilder()
                ..code = targetItemName
                ..quantity = min(remainingQuantity, maxFreeSpaceInInventory))
              .build();
          teamProvider.queueBankWithdraw(
              character, BuiltList.of([remainingItemSchema]));
          _turnInTask(
              state, mapProvider, aiService, actionFactory, teamProvider, teamBrainProvider);
          return;
        }

        // We don't have the items. Post a request to the Team Brain.
        teamBrainProvider.postRequest(ItemRequest(_buildBrainRequestKey(character),
            targetItemName, remainingQuantity - inBank, character.name));
        LoggerService.instance.log(
            "AI: Need '$targetItemName', posted request to team.", character: state.character);

        break;
    }
  }

  String _buildBrainRequestKey(CharacterSchema character) {
    return '${character.name}:task:${character.task}';
  }

  DestinationSchema? _findTaskMaster(
      CharacterState state, MapProvider mapProvider) {
    final code = state.character.taskType.isEmpty
        ? (_random.nextBool() ? taskTypeMonsters : taskTypeItems)
        : state.character.taskType;
    return mapProvider.findNearestTile(
        state.character.location,
        (t) =>
            t.content?.type == MapContentType.tasksMaster &&
            t.content?.code == code);
  }

  bool _taskDone(CharacterState state) {
    bool hasItems = false;
    if (state.character.taskType == taskTypeItems) {
      final character = state.character;
      final targetItemName = character.task;
      final targetQuantity = character.taskTotal;

      // Check if we have enough items already
      final countInInventory = character.inventory?.count(targetItemName) ?? 0;
      hasItems = countInInventory >= targetQuantity;
    }
    return state.character.taskProgress >= state.character.taskTotal ||
        hasItems;
  }
}
