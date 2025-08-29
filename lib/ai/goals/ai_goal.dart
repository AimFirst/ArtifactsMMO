import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

abstract class AIGoal {
  // Higher number means higher priority
  int get priority;

  String get name;

  // Can this goal be pursued by the character right now?
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
  );

  // Execute the logic for this goal (queueing actions, etc.)
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
  );

  void executeWrapper(
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
    state.setCurrentGoal(name);
    LoggerService.instance
        .log("GOAL: ${state.character.name} is executing $name");
    execute(
        state,
        aiService,
        combatService,
        worldDataProvider,
        actionFactory,
        mapProvider,
        teamProvider,
        bankProvider,
        teamBrainProvider,
        characterStates);
  }
}
