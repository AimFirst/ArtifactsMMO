import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_monster_task_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';

class PerformTaskTarget extends Target {

  @override
  String get name => 'Performing task';

  @override
  TargetProcessResult update(
      {required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    final progress = getProgress(character: character, boardState: boardState);

    if (progress.finished) {
      return TargetProcessResult(progress: progress, action: null, description: 'Finished task ${character.taskProgress?.taskCode}', imageUrl: 'https://artifactsmmo.com/images/items/forest_whip.png');
    }

    // We are working on a task, try to complete it.
    if (character.taskProgress?.taskCode != null) {
      switch (character.taskProgress!.taskType) {
        case TaskType.items:
          throw ArtifactsException(errorMessage: 'Task type ${character.taskProgress!.taskType} not handled yet.');
        case TaskType.monsters:
          return FightMonsterTaskTarget().update(character: character, boardState: boardState, artifactsClient: artifactsClient);
      }
    }


      // We are not currently work on a task, can't completely it
      throw ArtifactsException(errorMessage: 'No active task to complete');
  }

  Progress getProgress(
      {required Character character, required BoardState boardState,}) {
    return Progress(current: character.taskProgress?.progress.toDouble() ?? 0,
      target: character.taskProgress?.total.toDouble() ?? 1,);
  }

}