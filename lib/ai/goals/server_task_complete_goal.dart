import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/ai/goals/server_task_mixin.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class ServerTaskCompleteGoal extends AIGoal with ServerTaskMixin {
  @override
  int get priority => 89;

  @override
  String get name => 'Turn in Task';

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
    return taskDone(state, bankProvider);
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
    if (taskDone(state, bankProvider)) {
      _turnInTask(state, mapProvider, aiService, actionFactory, teamProvider,
          teamBrainProvider);
    }
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
        buildBrainRequestKeyPrefix(character), character.task, character.name);

    teamProvider.queueTaskDeposit(state);

    final completeAction =
        actionFactory.createCompleteTaskAction(character.name);
    teamProvider.queueAction(character.name, completeAction);
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
}
