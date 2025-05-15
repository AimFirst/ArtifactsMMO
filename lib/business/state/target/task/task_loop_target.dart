import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';

class TaskLoopTarget extends Target {
  TaskLoopTarget({required super.parentTarget, required super.characterLog});

  @override
  String get name => 'Task Loop';

  @override
  TargetProcessResult update({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    // Make sure our inventory has room
    final inventoryUpdate =
        ManageInventoryTarget(parentTarget: this, characterLog: characterLog)
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
    if (!inventoryUpdate.progress.finished) {
      return inventoryUpdate;
    }

    // Make sure we have a task accepted.
    final acceptTaskUpdate =
        AcceptTaskTarget(parentTarget: parentTarget, characterLog: characterLog)
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
    if (!acceptTaskUpdate.progress.finished) {
      return acceptTaskUpdate;
    }

    // Try to perform the task.
    final performTaskUpdate = PerformTaskTarget(
            parentTarget: parentTarget, characterLog: characterLog)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
    if (!performTaskUpdate.progress.finished) {
      return performTaskUpdate;
    }

    // Complete the task.
    final completeTaskUpdate = CompleteTaskTarget(
            parentTarget: parentTarget, characterLog: characterLog)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
    return completeTaskUpdate;
  }
}
