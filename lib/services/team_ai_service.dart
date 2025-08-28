// lib/services/team_ai_service.dart

import 'package:artifacts_mmo/ai/ai_strategy.dart';
import 'package:artifacts_mmo/ai/crafter_strategy.dart';
import 'package:artifacts_mmo/ai/fighter_strategy.dart';
import 'package:artifacts_mmo/ai/gatherer_strategy.dart';
import 'package:artifacts_mmo/ai/hauler_strategy.dart';
import 'package:artifacts_mmo/ai/idle_strategy.dart';
import 'package:artifacts_mmo/ai/tasking_strategy.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_role.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/character_task.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/combat_service.dart';

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
  late ActionFactory _actionFactory;

  // A map to hold our strategy objects.
  final Map<CharacterRole, AIStrategy> _roleStrategies = {
    CharacterRole.gatherer: GathererStrategy(),
    CharacterRole.hauler: HaulerStrategy(),
    CharacterRole.crafter: CrafterStrategy(),
    CharacterRole.fighter: FighterStrategy(),
  };
  final AIStrategy _taskingStrategy = TaskingStrategy();
  final AIStrategy _idleStrategy =
      IdleStrategy(); // A strategy that does nothing.

  TeamAIService(
      this._apiClient,
      this._teamProvider,
      this._worldDataProvider,
      this._bankProvider,
      this._mapProvider,
      this._combatService,
      this._teamBrainProvider) {
    _actionFactory = ActionFactory(_apiClient);
  }

  // This is the main entry point for the AI update cycle.
  void updateAI(List<CharacterState> characterStates) {
    for (final state in characterStates) {
      final character = state.character;
      final bool isReady = !state.isPerformingAction && !state.isOnCooldown;
      final queue = _teamProvider.getQueueFor(character.name);

      if (!isReady || queue.isNotEmpty) continue;

      _getStrategyFor(state).update(
          state,
          this,
          _combatService,
          _worldDataProvider,
          _actionFactory,
          _mapProvider,
          _teamProvider,
          _bankProvider,
          _teamBrainProvider,
          characterStates);
    }
  }

  AIStrategy _getStrategyFor(CharacterState state) {
    // Meta-tasks take top priority.
    if (state.currentTask == CharacterTask.completeServerTask) {
      return _taskingStrategy;
    }
    // Otherwise, use the strategy for the character's role.
    return _roleStrategies[state.role] ?? _idleStrategy;
  }
}
