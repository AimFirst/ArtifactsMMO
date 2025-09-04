import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
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
import 'package:artifacts_mmo/services/equipment_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class IntermediateGatherTeamRequestGoal extends AIGoal {
  @override
  String get name => 'Intermediate Gather Team Request';

  @override
  int get priority => 40;

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
    for (final request in teamBrainProvider.openRequests) {
      // Someone else is already on it.
      if (request.fulfilledBy != null) {
        continue;
      }

      // We can gather this item, so do it.
      if (_canGather(state, request.itemName, worldDataProvider)) {
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
    for (final request in teamBrainProvider.openRequests) {
      // Someone else is already on it.
      if (request.fulfilledBy != null) {
        continue;
      }

      // We can gather this item, so do it.
      if (_canGather(state, request.itemName, worldDataProvider)) {
        final item = worldDataProvider.getResourceByDropCode(request.itemName);
        final location = mapProvider.findNearestTile(state.character.location, (tile) => tile.content?.type == MapContentType.resource && tile.content?.code == item?.code);
        if (location == null) {
          LoggerService.instance.log('No gather location found for ${request.itemName}', level: LogLevel.warning, character: state.character);
          continue;
        }
        teamProvider.queueMoveTo(state.character, location);
        teamProvider.queueAction(state.character.name, actionFactory.createGatherAction(state.character.name));
        return;
      }
    }
  }

  @override
  GearEvaluationContext? gearEvaluationContext(CharacterState state, TeamAIService aiService, CombatService combatService, WorldDataProvider worldDataProvider, ActionFactory actionFactory, MapProvider mapProvider, TeamProvider teamProvider, BankProvider bankProvider, TeamBrainProvider teamBrainProvider, List<CharacterState> characterStates) {
    for (final request in teamBrainProvider.openRequests) {
      // Someone else is already on it.
      if (request.fulfilledBy != null) {
        continue;
      }

      // We can gather this item, so do it.
      if (_canGather(state, request.itemName, worldDataProvider)) {
        final item = worldDataProvider.getResourceByDropCode(request.itemName);
        if (item != null) {
          return GearEvaluationContext(taskType: item.skill.name);
        }
      }
    }

    return null;
  }

  bool _canGather(CharacterState character, String itemCode, WorldDataProvider worldDataProvider) {
    final item = worldDataProvider.getResourceByDropCode(itemCode);
    if (item == null) {
      return false;
    }

    return (character.character.gatheringSkills[item.skill]?.level ?? 1) >= item.level;
  }
}
