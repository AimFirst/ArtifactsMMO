import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_gathering.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_move.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class GatheringSkillTarget extends Target {
  final SkillType skillType;
  final int targetLevel;

  GatheringSkillTarget({
    required this.skillType,
    required this.targetLevel,
  });

  @override
  String get name => 'Skill $skillType';

  @override
  TargetProcessResult update({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    Skill currentSkill = getCurrentSkill(character: character, skillType: skillType);
    final currentProgress = getProgress(character: character, currentSkill: currentSkill);
    
    // If we are already at or above the desired level, we are done.
    if (currentSkill.level >= targetLevel) {
      return TargetProcessResult(progress: currentProgress, action: null, description: 'Reached target level');
    }

    // Get highest item for skill.
    final resources = boardState.resources.where((r) => r.skillType == skillType).toList();
    resources.sort((a, b) => b.skillLevel - a.skillLevel);
    final targetResource = resources.first;

    // Get closest location for targetResource.
    final locations = boardState.contentLocations[Content(type: 'resource', code: targetResource.code)];
    if (locations == null || locations.isEmpty) {
      throw ArtifactsException(errorMessage: 'Unable to progress, could not find target location for $skillType');
    }
    locations.sort((a, b) => a.distance(character.location).round() - b.distance(character.location).round());
    final closest = locations.first;

    // Are we there yet?
    final moveUpdate = MoveToTarget(targetLocation: closest).update(character: character, boardState: boardState, artifactsClient: artifactsClient);
    if (!moveUpdate.progress.finished) {
      return moveUpdate;
    }

    // Start gathering.
    return TargetProcessResult(progress: currentProgress, action: artifactsClient.gather(action: ActionGathering()), description: 'Gathering $targetResource');
  }

  Progress getProgress({required Character character, required Skill currentSkill}) {
   return  Progress(current: currentSkill.level.toDouble() + (currentSkill.xp / currentSkill.nextLevelTargetXp), target: targetLevel.toDouble());
  }

  Skill getCurrentSkill({required Character character, required SkillType skillType}) {
    return character.allSkills.firstWhere((s) => s.skillType == skillType);
  }

}