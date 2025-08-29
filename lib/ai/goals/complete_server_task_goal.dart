import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/fighter_strategy.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/location_schema.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:collection/collection.dart';

class CompleteServerTaskGoal extends AIGoal {
  static const taskTypeItems = 'items';
  static const taskTypeMonsters = 'monsters';

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
    return
        // no task yet, can accept new one
        state.character.task.isEmpty
            // task is complete, can turn it in
            ||
            _taskDone(state);
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
      _turnInTask(state, mapProvider, aiService, actionFactory, teamProvider);
      return;
    }

    // --- State 3: TASK IN PROGRESS ---
    // Otherwise, our goal is to work on the current task.
    _workOnTask(state, actionFactory, mapProvider, teamProvider, teamBrainProvider);
  }

  void _getNewTask(
      CharacterState state,
      TeamAIService aiService,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      ActionFactory actionFactory) {
    final character = state.character;
    // Find the nearest task master
    final taskMaster = mapProvider.findNearestTile(
        character.location, (t) => t.content?.type == 'tasks_master');
    if (taskMaster == null) {
      LoggerService.instance.log(
          "AI: ${character.name} can't find a task master.",
          level: LogLevel.warning);
      return;
    }

    final taskMasterLocation = LocationSchema(x: taskMaster.x, y: taskMaster.y);
    if (character.location.x != taskMasterLocation.x ||
        character.location.y != taskMasterLocation.y) {
      LoggerService.instance.log(
          "AI: ${character.name} moving to Task Master at $taskMasterLocation.");
      teamProvider.queueAction(
          character.name,
          actionFactory.createMoveAction(
              character.name, taskMasterLocation.x, taskMasterLocation.y));
    }
    LoggerService.instance.log(
        "AI: ${character.name} is at/on way to Task Master, accepting new task.");
    final acceptAction = actionFactory.createAcceptTaskAction(character.name);
    teamProvider.queueAction(character.name, acceptAction);
    state.taskGiverLocation = taskMasterLocation;
  }

  void _turnInTask(
    CharacterState state,
    MapProvider mapProvider,
    TeamAIService aiService,
    ActionFactory actionFactory,
    TeamProvider teamProvider,
  ) {
    final character = state.character;
    final turnInLocation = _findTaskMaster(state, mapProvider);
    if (turnInLocation == null) {
      LoggerService.instance.log(
          "AI: ${character.name} completed a task but doesn't know where the task master is!",
          level: LogLevel.error);
      return;
    }

    if (character.location.x != turnInLocation.x ||
        character.location.y != turnInLocation.y) {
      LoggerService.instance.log(
          "AI: ${character.name} moving to turn in task at $turnInLocation.");
      teamProvider.queueAction(
          character.name,
          actionFactory.createMoveAction(
              character.name, turnInLocation.x, turnInLocation.y));
    }
    LoggerService.instance.log(
        "AI: ${character.name} turning in completed task: ${character.task}.");
    final completeAction =
        actionFactory.createCompleteTaskAction(character.name);
    teamProvider.queueAction(character.name, completeAction);
  }

  void _workOnTask(
      CharacterState state,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      TeamBrainProvider teamBrainProvider) {
    final character = state.character;

    switch (character.taskType) {
      case 'monsters':
        // Find and fight the specific monster required by the task
        final targetMonsterCode = character.task;
        FighterStrategy().updateFighterAi(
          state,
          actionFactory,
          mapProvider,
          teamProvider,
          (character, tile) => tile.content?.code == targetMonsterCode,
        );
        break;
      case 'items':
        final targetItemName = character.task;
        final targetQuantity = character.taskTotal;

        // How many items do we have
        final itemInInventory = character.inventory
            ?.firstWhereOrNull((item) => item.code == targetItemName);

        final currentQuantity = itemInInventory?.quantity ?? 0;

        // We don't have the items. Post a request to the Team Brain.
        teamBrainProvider.postRequest(
            ItemRequest('Task: ${character.task}', targetItemName, targetQuantity-currentQuantity, character.name));
        LoggerService.instance.log(
            "AI: ${character.name} needs '$targetItemName', posted request to team.");

        break;
    }
  }

  DestinationSchema? _findTaskMaster(
      CharacterState state, MapProvider mapProvider) {
    return mapProvider.findNearestTile(
        state.character.location,
        (t) =>
            t.content?.type == MapContentType.tasksMaster &&
            t.content?.code == state.character.taskType);
  }

  bool _taskDone(CharacterState state) {
    bool hasItems = false;
    if (state.character.taskType == taskTypeItems) {
      final character = state.character;
      final targetItemName = character.task;
      final targetQuantity = character.taskTotal;

      // Check if we have enough items already
      final itemInInventory = character.inventory
          ?.firstWhereOrNull((item) => item.code == targetItemName);
      if (itemInInventory != null &&
          itemInInventory.quantity >= targetQuantity) {
        hasItems = true;
      }
    }
    return state.character.taskProgress >= state.character.taskTotal ||
        hasItems;
  }

  @override
  int get priority => 90;

  @override
  String get name => 'Server Task';
}
