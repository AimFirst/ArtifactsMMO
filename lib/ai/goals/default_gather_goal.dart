import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
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
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';

class DefaultGatherGoal extends AIGoal {
  @override
  String get name => 'Default Gather';

  @override
  int get priority => 11;

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
    // Find any crafting skills that we are the "expert" on and see if we can craft anything.
    return _expertGatherer(
        state, worldDataProvider, bankProvider, characterStates) !=
        null;
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
    final skill = _expertGatherer(state, worldDataProvider, bankProvider, characterStates);
    if (skill == null) {
      LoggerService.instance.log('No gather skill found.', character: state.character);
      return;
    }

    // Find the hardest thing in this skill we can gather.
    final resourceToGather = (mapProvider.worldMap?.tiles.map((tile) {
      // Not a resource node, ignore it.
      if (tile.content?.type != MapContentType.resource || tile.content?.code == null) {
        return null;
      }

      final resource = worldDataProvider.getResourceByCode(tile.content!.code);
      if (resource == null) {
        LoggerService.instance.log('No resource found for ${tile.content?.code}', character: state.character);
        return null;
      }

      // Only want resources for this skill.
      if (resource.skill != skill) {
        return null;
      }

      // We can't gather it, we are too weak :(
      if (resource.level > state.character.gatheringSkills[skill]!.level) {
        return null;
      }

      return resource;
    }).toList()?..sort((a,b) => (b?.level ?? 1) - (a?.level ?? 1)))?.first;

    if (resourceToGather == null) {
      LoggerService.instance.log('No gatherable resources found.', character: state.character);
      return;
    }

    final location = mapProvider.findNearestTile(state.character.location, (tile) => tile.content?.type == MapContentType.resource && tile.content?.code == resourceToGather.code);
    if (location == null) {
      LoggerService.instance.log('No gatherable resources found for skill: ${skill.name}.', character: state.character);
      return;
    }

    teamProvider.queueMoveTo(state.character, location);
    teamProvider.queueAction(state.character.name, actionFactory.createGatherAction(state.character.name));
  }

  GatheringSkill? _expertGatherer(
      CharacterState state,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      List<CharacterState> characters) {
    for (final skill in GatheringSkill.values) {
      final myLevel = state.character.gatheringSkills[skill]?.level ?? 1;
      bool best = true;
      for (final char in characters) {
        // Someone else is better, leave it up to them
        if ((char.character.gatheringSkills[skill]?.level ?? 1) > myLevel) {
          best = false;
          break;
        }
      }

      // We are the best, let's keep working on it.
      if (best) {
        return skill;
      }
    }
    return null;
  }
}
