import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class IntermediateGatherTeamRequestGoal extends AIGoal {
  @override
  String get name => 'Intermediate Gather Team Request';

  @override
  int get priority => 50;

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
    throw UnimplementedError();
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
    // TODO: implement execute
  }
}
