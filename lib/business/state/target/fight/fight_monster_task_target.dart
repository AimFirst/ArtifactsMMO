import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';

class FightMonsterTaskTarget extends FightTarget {
  FightMonsterTaskTarget({required super.parentTarget, required super.characterLog});

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    return Progress(
      current: character.taskProgress?.progress.toDouble() ?? 1.0,
      target: character.taskProgress?.total.toDouble() ?? 1.0,
    );
  }

  @override
  List<Monster> getTargetMonster(
      {required Character character, required BoardState boardState}) {
    final monsterCode = character.taskProgress?.taskCode ?? '';
    final monster =
        boardState.monsters.where((m) => m.code == monsterCode).firstOrNull;
    if (monster == null) {
      throw ArtifactsException(
          errorMessage: 'Unable to find monster $monsterCode');
    }

    return [monster];
  }

  @override
  String get name => 'Fight monster for task';
}
