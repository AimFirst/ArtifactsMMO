import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_move.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';

class MoveToTarget extends Target {
  final Location targetLocation;

  MoveToTarget({required this.targetLocation, required super.parentTarget});

  @override
  String get name => 'Move to: $targetLocation';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final progress = getProgress(character: character);
    if (progress.finished) {
      return TargetProcessResult(
          progress: progress,
          action: null,
          description: 'At destination $targetLocation',
          imageUrl: null);
    }

    return TargetProcessResult(
        progress: progress,
        action: artifactsClient.moveTo(
            action: ActionMove(
                characterName: character.name, location: targetLocation)),
        description: 'Moving to $targetLocation',
        imageUrl: null);
  }

  Progress getProgress({required Character character}) {
    double distance = character.location.distance(targetLocation);
    return Progress(current: distance == 0.0 ? 1 : 0, target: 1);
  }
}
