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

class ServerTaskAcceptNewGoal extends AIGoal with ServerTaskMixin {
  @override
  String get name => 'Accept New Task';

  @override
  int get priority => 87;

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
    // If we don't have a server task, our goal is to get one.
    if (!hasTask(state)) {
      return true;
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
    // If we don't have a server task, our goal is to get one.
    if (!hasTask(state)) {
      _getNewTask(state, aiService, mapProvider, teamProvider, actionFactory);
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
    return null;
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
}
