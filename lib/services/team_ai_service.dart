// lib/services/team_ai_service.dart

import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/ai/goals/clear_inventory_goal.dart';
import 'package:artifacts_mmo/ai/goals/complete_server_task_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_craft_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_fight_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_gather_goal.dart';
import 'package:artifacts_mmo/ai/goals/fulfill_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/heal_goal.dart';
import 'package:artifacts_mmo/ai/goals/idle_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_craft_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_fight_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_gather_team_request_goal.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';

// This is our "Brain". It's not a provider and has no UI logic.
class TeamAIService {
  // This service holds references to the providers it needs to make decisions.
  final ApiClient _apiClient;
  final TeamProvider _teamProvider;
  final WorldDataProvider _worldDataProvider;
  final BankProvider _bankProvider;
  final MapProvider _mapProvider;
  final CombatService _combatService;
  final TeamBrainProvider _teamBrainProvider;
  final List<AIGoal> _goals = [];
  late ActionFactory _actionFactory;
  late LoadoutOptimizerService _loadoutOptimizerService;

  TeamAIService(
      this._apiClient,
      this._teamProvider,
      this._worldDataProvider,
      this._bankProvider,
      this._mapProvider,
      this._combatService,
      this._teamBrainProvider) {
    _actionFactory = ActionFactory(_apiClient);
    _loadoutOptimizerService =
        LoadoutOptimizerService(_combatService, _worldDataProvider);

    // Initialize all possible goals.
    _goals.addAll([
      ClearInventoryGoal(),
      CompleteServerTaskGoal(),
      DefaultCraftGoal(),
      DefaultFightGoal(),
      DefaultGatherGoal(),
      FulfillTeamRequestGoal(),
      HealGoal(),
      IdleGoal(),
      IntermediateCraftTeamRequestGoal(),
      IntermediateFightTeamRequestGoal(),
      IntermediateGatherTeamRequestGoal(),
    ]);

    // Sort them once by priority, descending.
    _goals.sort((a, b) => b.priority.compareTo(a.priority));
    LoggerService.instance
        .log("AI Goal engine initialized with ${_goals.length} goals.");
  }

  // This is the main entry point for the AI update cycle.
  void updateAI(List<CharacterState> characterStates) {
    for (final state in characterStates) {
      // Ignore characters who are currently active.
      if (state.isPerformingAction ||
          state.isOnCooldown ||
          state.isPaused ||
          !_teamProvider.getQueueFor(state.character.name).isEmpty) {
        continue;
      }

      // Find the highest-priority goal that can be run.
      for (final goal in _goals) {
        if (goal.canRun(
          state,
          this,
          _combatService,
          _loadoutOptimizerService,
          _worldDataProvider,
          _actionFactory,
          _mapProvider,
          _teamProvider,
          _bankProvider,
          _teamBrainProvider,
          characterStates,
        )) {
          // Check equipment for it.
          goal.handleBestEquipment(
            state,
            this,
            _combatService,
            _loadoutOptimizerService,
            _worldDataProvider,
            _actionFactory,
            _mapProvider,
            _teamProvider,
            _bankProvider,
            _teamBrainProvider,
            characterStates,
          );

          // Execute it and immediately stop processing for this character.
          goal.executeWrapper(
            state,
            this,
            _combatService,
            _loadoutOptimizerService,
            _worldDataProvider,
            _actionFactory,
            _mapProvider,
            _teamProvider,
            _bankProvider,
            _teamBrainProvider,
            characterStates,
          );
          break;
        }
      }
      // If no goals can be run, the character will implicitly remain idle.
    }
  }
}
