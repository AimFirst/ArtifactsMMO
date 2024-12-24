import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_complete_task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';

class CompleteTaskTarget extends Target {
  CompleteTaskTarget({required super.parentTarget});

  @override
  String get name => 'Complete Task';

  @override
  TargetProcessResult update({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    if (character.taskProgress == null) {
      return TargetProcessResult(
          progress: Progress(current: 1, target: 1),
          action: null,
          description: 'No longer has active task',
          imageUrl: 'https://artifactsmmo.com/images/items/forest_whip.png');
    }

    // Find taskmaster location
    final locations = boardState.contentLocations[
        Content(type: ContentType.tasksMaster, code: 'monsters')];
    if (locations == null || locations.isEmpty) {
      throw ArtifactsException(
          errorMessage: 'Failed to get task master location');
    }

    // Move to it.
    final moveAction = MoveToTarget(targetLocation: locations.first, parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!moveAction.progress.finished) {
      return moveAction;
    }

    return TargetProcessResult(
      progress: Progress(current: 0, target: 1),
      action: artifactsClient.completeTask(
          action: ActionCompleteTask(characterName: character.name)),
      description: 'Completing task',
      imageUrl: 'https://artifactsmmo.com/images/items/forest_whip.png',
    );
  }
}
