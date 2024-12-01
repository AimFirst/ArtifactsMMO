import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class Fight with EquatableMixin {
  final int xp;
  final int gold;
  final List<ItemQuantity> drops;
  final int turns;
  final BlockedHits monsterBlockedHits;
  final BlockedHits playerBlockedHits;
  final List<String> logs;
  final FightResult result;

  Fight({
    required this.xp,
    required this.gold,
    required this.drops,
    required this.turns,
    required this.monsterBlockedHits,
    required this.playerBlockedHits,
    required this.logs,
    required this.result,
  });

  @override
  List<Object?> get props => [
        xp,
        gold,
        drops,
        turns,
        monsterBlockedHits,
        playerBlockedHits,
        logs,
        result,
      ];
}

class BlockedHits with EquatableMixin {
  final int fire;
  final int earth;
  final int water;
  final int air;
  final int total;

  BlockedHits({
    required this.fire,
    required this.earth,
    required this.water,
    required this.air,
    required this.total,
  });

  @override
  List<Object?> get props => [
        fire,
        earth,
        water,
        air,
        total,
      ];
}

enum FightResult {
  win,
  loss,
}
