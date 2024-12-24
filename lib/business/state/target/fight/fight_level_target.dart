import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';

class FightLevelTarget extends FightTarget {
  final int level;

  FightLevelTarget({
    required this.level, required super.parentTarget,
  });

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    return Progress(
        current: character.overall.level.toDouble(), target: level.toDouble());
  }

  @override
  List<Monster> getTargetMonster(
      {required Character character, required BoardState boardState}) {
    return boardState.monsters..sort((a, b) => b.level - a.level);
  }

  @override
  String get name => 'Fight target level $level';
}
