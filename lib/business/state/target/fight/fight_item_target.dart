import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/util/math.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';

class FightItemTarget extends FightTarget {
  final ItemQuantity itemQuantity;

  FightItemTarget({
    required this.itemQuantity, required super.parentTarget, required super.characterLog,
  });

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    return Progress(
      current:
          character.inventory.items.count(code: itemQuantity.code).toDouble(),
      target: itemQuantity.quantity.toDouble(),
    );
  }

  @override
  List<Monster> getTargetMonster({
    required Character character,
    required BoardState boardState,
  }) {
    final options = boardState.monsters
        .where(
            (m) => m.drops.where((d) => d.code == itemQuantity.code).isNotEmpty)
        .toList();
    options.sort((a, b) => MathUtil.doubleToCompare(b.drops
            .where((d) => d.code == itemQuantity.code)
            .first
            .averageQuantity -
        a.drops
            .where((d) => d.code == itemQuantity.code)
            .first
            .averageQuantity));
    return options;
  }

  @override
  String get name => 'Target item fighting $itemQuantity';
}
