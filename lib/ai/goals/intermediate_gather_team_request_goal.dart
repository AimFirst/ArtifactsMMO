import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/ai/goals/intermediate_request_mixin.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class IntermediateGatherTeamRequestGoal extends AIGoal
    with IntermediateRequestMixin {
  final random = Random();

  @override
  String get name => 'Intermediate Gather Team Request';

  @override
  int get priority => 45;

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
    final neededItemsForRequests =
        remainingNeededItems(teamBrainProvider, bankProvider);
    for (final requestedItem in neededItemsForRequests) {
      if (_canGather(state, requestedItem.code, worldDataProvider)) {
        return true;
      }
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
    final requests = _requestsSortedBySkill(
      state.character,
      teamBrainProvider,
      worldDataProvider,
      bankProvider,
    );
    for (final request in requests) {
      // We can gather this item, so do it.
      if (_canGather(state, request.code, worldDataProvider)) {
        final item = worldDataProvider.getResourceByDropCode(request.code);
        final location = mapProvider.findNearestTile(
            state.character.location,
            (tile) =>
                tile.content?.type == MapContentType.resource &&
                tile.content?.code == item?.code);
        if (location == null) {
          LoggerService.instance.log(
              'No gather location found for ${request.code}',
              level: LogLevel.warning,
              character: state.character);
          continue;
        }
        teamProvider.queueMoveTo(state.character, location);
        teamProvider.queueAction(state.character.name,
            actionFactory.createGatherAction(state.character.name, item?.name ?? 'unknown'));
        return;
      }
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
    final requests = _requestsSortedBySkill(
      state.character,
      teamBrainProvider,
      worldDataProvider,
      bankProvider,
    );
    for (final request in requests) {
      // We can gather this item, so do it.
      if (_canGather(state, request.code, worldDataProvider)) {
        final item = worldDataProvider.getResourceByDropCode(request.code);
        if (item != null) {
          return SkillGearEvaluationContext(skillType: item.skill.name);
        }
      }
    }

    return null;
  }

  List<SimpleItemSchema> _requestsSortedBySkill(
    CharacterSchema character,
    TeamBrainProvider teamBrainProvider,
    WorldDataProvider worldDataProvider,
    BankProvider bankProvider,
  ) {
    // Try to sort by our best skills first.
    return remainingNeededItems(teamBrainProvider, bankProvider)
      ..sort((a, b) {
        final aResource = worldDataProvider.getResourceByDropCode(a.code);
        final bResource = worldDataProvider.getResourceByDropCode(b.code);

        if (aResource != null && bResource != null) {
          final aSkill = aResource.skill;
          final bSkill = bResource.skill;

          final myASkill = character.skills[aSkill.name];
          final myBSkill = character.skills[bSkill.name];

          if (myASkill != null && myBSkill != null) {
            return myBSkill.level.compareTo(myASkill.level);
          }
        }

        return random.nextBool() ? 1 : -1;
      });
  }

  bool _canGather(CharacterState character, String itemCode,
      WorldDataProvider worldDataProvider) {
    final item = worldDataProvider.getResourceByDropCode(itemCode);
    if (item == null) {
      return false;
    }

    return (character.character.gatheringSkills[item.skill]?.level ?? 1) >=
        item.level;
  }
}
