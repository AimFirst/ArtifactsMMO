// lib/services/team_ai_service.dart

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/ai/goals/clear_inventory_goal.dart';
import 'package:artifacts_mmo/ai/goals/server_task_accept_new_goal.dart';
import 'package:artifacts_mmo/ai/goals/server_task_complete_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_craft_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_fight_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_gather_goal.dart';
import 'package:artifacts_mmo/ai/goals/default_recycle_goal.dart';
import 'package:artifacts_mmo/ai/goals/fulfill_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/heal_goal.dart';
import 'package:artifacts_mmo/ai/goals/idle_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_craft_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_fight_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_gather_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_npc_buy_team_request_goal.dart';
import 'package:artifacts_mmo/ai/goals/server_task_make_progress_goal.dart';
import 'package:artifacts_mmo/data/database.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
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
  final AppDatabase _appDatabase;
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
    this._teamBrainProvider,
    this._appDatabase,
  ) {
    _actionFactory = ActionFactory(_apiClient);
    _loadoutOptimizerService = LoadoutOptimizerService(
      _combatService,
      _worldDataProvider,
      _appDatabase,
    );

    // Initialize all possible goals.
    _goals.addAll([
      ClearInventoryGoal(),
      DefaultCraftGoal(),
      DefaultFightGoal(),
      DefaultGatherGoal(),
      DefaultRecycleGoal(),
      FulfillTeamRequestGoal(),
      HealGoal(),
      IdleGoal(),
      IntermediateCraftTeamRequestGoal(),
      IntermediateFightTeamRequestGoal(),
      IntermediateGatherTeamRequestGoal(),
      IntermediateNpcBuyTeamRequestGoal(),
      ServerTaskAcceptNewGoal(),
      ServerTaskCompleteGoal(),
      ServerTaskMakeProgressGoal(),
    ]);

    // Sort them once by priority, descending.
    _goals.sort((a, b) => b.priority.compareTo(a.priority));
    LoggerService.instance
        .log("AI Goal engine initialized with ${_goals.length} goals.");
  }

  // This is the main entry point for the AI update cycle.
  Future<void> updateAI(List<CharacterState> characterStates) async {
    if (_teamProvider.isLoading ||
        _worldDataProvider.isLoading ||
        _bankProvider.isLoading ||
        _mapProvider.isLoading) {
      return;
    }

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
        if (await goal.canRun(
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
          await goal.handleBestEquipment(
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
          await goal.executeWrapper(
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

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableCharacterItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      {bool forceCalculate = false}) {
    return _loadoutOptimizerService.bestLoadoutOfAvailableCharacterItems(
      character,
      gearContext,
      worldDataProvider,
      bankProvider,
      forceCalculate: forceCalculate,
    );
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAllItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      {bool forceCalculate = false}) async {
    return await _loadoutOptimizerService.bestLoadoutOfAllItems(
      character,
      gearContext,
      worldDataProvider,
      forceCalculate: forceCalculate,
    );
  }
}
