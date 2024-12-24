import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_skill_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_gathering.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

abstract class GatheringTarget extends Target {
  GatheringTarget({required super.parentTarget});

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    // See if we're already done.
    final progress = getProgress(character: character, boardState: boardState);
    if (progress.finished) {
      return TargetProcessResult(
          progress: progress,
          action: null,
          description: 'Gathering task done.',
          imageUrl: SkillType.woodcutting.image);
    }

    // Check our inventory to make sure we have room/etc.
    final inventoryUpdate = ManageInventoryTarget(parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!inventoryUpdate.progress.finished) {
      return inventoryUpdate;
    }

    // Decide on our target resource.
    final targetResources = getTargetResource(
      character: character,
      boardState: boardState,
    );

    Resource? resourceToTarget;

    // See if any of the desired resources are within our skill range.
    for (var i = 0; i < targetResources.length; i++) {
      final targetResource = targetResources[i];
      if (targetResource.skillLevel <=
          character.allSkills
              .firstWhere((r) => r.skillType == targetResource.skillType)
              .level) {
        resourceToTarget = targetResource;
        break;
      } else if (i == targetResources.length - 1) {
        // Last item in the list and we weren't able to gather any of them.
        return GatheringSkillTarget(
                skillType: targetResource.skillType,
                targetLevel: targetResource.skillLevel, parentTarget: this)
            .update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
      }
    }

    if (resourceToTarget == null) {
      throw ArtifactsException(errorMessage: 'Unable to pick resource.');
    }

    // Get closest location for targetResource.
    final locations = boardState.contentLocations[
        Content(type: ContentType.resource, code: resourceToTarget.code)];
    if (locations == null || locations.isEmpty) {
      throw ArtifactsException(
          errorMessage:
              'Unable to progress, could not find target location for $resourceToTarget');
    }

    locations.sort((a, b) =>
        a.distance(character.location).round() -
        b.distance(character.location).round());
    final closest = locations.first;

    // Are we there yet?
    final moveUpdate = MoveToTarget(targetLocation: closest, parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!moveUpdate.progress.finished) {
      return moveUpdate;
    }

    // Start gathering.
    return TargetProcessResult(
      progress: progress,
      action: artifactsClient.gather(
          action: ActionGathering(characterName: character.name)),
      description: 'Gathering $resourceToTarget',
      imageUrl: resourceToTarget.imageUrl,
    );
  }

  List<Resource> getTargetResource({
    required Character character,
    required BoardState boardState,
  });

  Progress getProgress({
    required Character character,
    required BoardState boardState,
  });
}
