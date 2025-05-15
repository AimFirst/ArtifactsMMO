import 'dart:math';

import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:equatable/equatable.dart';

const _maxRounds = 100;

class FightPrediction with EquatableMixin {
  final int turns;
  final FightResult result;
  final int startHp;
  final int endHp;
  final int opponentStartHp;
  final int opponentEndHp;
  final List<Item> consumablesUsed;

  FightPrediction({
    required this.turns,
    required this.result,
    required this.startHp,
    required this.endHp,
    required this.opponentStartHp,
    required this.opponentEndHp,
    required this.consumablesUsed,
  });

  FightPrediction.empty() : turns = _maxRounds, result = FightResult.loss, startHp = 0, endHp = 0, opponentStartHp = 10000, opponentEndHp = 10000, consumablesUsed = [];

  @override
  List<Object?> get props => [
        turns,
        result,
        startHp,
        endHp,
        opponentStartHp,
        opponentEndHp,
        consumablesUsed,
      ];

}

enum FightResult {
  loss,
  timeout,
  win,
}

class RoundPrediction with EquatableMixin {
  final int roundNumber;
  final int charStartHp;
  final int charEndHp;
  final int opponentStartHp;
  final int opponentEndHp;
  final bool charTurn;
  final List<Item> consumablesUsed;

  RoundPrediction({
    required this.roundNumber,
    required this.charStartHp,
    required this.charEndHp,
    required this.opponentStartHp,
    required this.opponentEndHp,
    required this.charTurn,
    required this.consumablesUsed,
  });

  @override
  List<Object?> get props => [
        roundNumber,
        charStartHp,
        charEndHp,
        opponentStartHp,
        opponentEndHp,
        charTurn,
        consumablesUsed
      ];
}

class FightCalculator {
  final random = Random();

  FightPrediction predict({
    required FightingStats character,
    required FightingStats opponent,
  }) {
    // try once without potions, then again with any available potions

    return _simulateFight(
        character: character, opponent: opponent, allowConsumables: false);
  }

  FightPrediction _simulateFight({
    required FightingStats character,
    required FightingStats opponent,
    required bool allowConsumables,
  }) {
    var previousRound = RoundPrediction(
        roundNumber: 0,
        charStartHp: character.hp,
        charEndHp: character.hp,
        opponentStartHp: opponent.hp,
        opponentEndHp: opponent.hp,
        charTurn: false,
        consumablesUsed: []);
    var consumablesUsed = <Item>[];
    // go until one side is dead or the max rounds are reached
    while (previousRound.roundNumber <= _maxRounds &&
        previousRound.charEndHp > 0 &&
        previousRound.opponentEndHp > 0) {
      previousRound = predictRound(
          character: character,
          opponent: opponent,
          previousRound: previousRound);
      consumablesUsed.addAll(previousRound.consumablesUsed);
    }

    if (previousRound.opponentEndHp <= 0) {
      // Killed opponent
      return FightPrediction(
        turns: previousRound.roundNumber,
        result: FightResult.win,
        startHp: character.hp,
        endHp: previousRound.charEndHp,
        opponentStartHp: opponent.hp,
        opponentEndHp: previousRound.opponentEndHp,
        consumablesUsed: consumablesUsed,
      );
    } else if (previousRound.charEndHp <= 0) {
      // We ded
      return FightPrediction(
        turns: previousRound.roundNumber,
        result: FightResult.loss,
        startHp: character.hp,
        endHp: previousRound.charEndHp,
        opponentStartHp: opponent.hp,
        opponentEndHp: previousRound.opponentEndHp,
        consumablesUsed: consumablesUsed,
      );
    } else {
      // Ran out of turns, we lose :(
      return FightPrediction(
        turns: previousRound.roundNumber,
        result: FightResult.timeout,
        startHp: character.hp,
        endHp: previousRound.charEndHp,
        opponentStartHp: opponent.hp,
        opponentEndHp: previousRound.opponentEndHp,
        consumablesUsed: consumablesUsed,
      );
    }
  }

  RoundPrediction predictRound({
    required FightingStats character,
    required FightingStats opponent,
    required RoundPrediction previousRound,
    bool ignoreBlocks = true,
  }) {
    // We alternate turns between char and opponent.
    final characterTurn = !previousRound.charTurn;

    var charLostHp = 0;
    var oppLostHp = 0;

    // For each character attack type, calculate damage (if it's character's turn).
    for (final charAttackElement
        in characterTurn ? character.primaryAttackTypes : []) {
      // Calculate char values.
      final charAttack = character.attackForType(charAttackElement);
      final charDmg = character.damageForType(charAttackElement);
      final oppRes = opponent.resistanceForType(charAttackElement);

      oppLostHp += _hpLoss(
        attack: charAttack.value,
        dmg: charDmg.value,
        res: oppRes.value,
        ignoreBlocks: ignoreBlocks,
      );
    }

    // For each opponent attack type, calculate damage (if it's opponent's turn).
    for (final oppAttackElement
        in characterTurn ? [] : opponent.primaryAttackTypes) {
      // Calculate opp values.
      final oppAttack = opponent.attackForType(oppAttackElement);
      final oppDmg = opponent.damageForType(oppAttackElement);
      final charRes = character.resistanceForType(oppAttackElement);

      charLostHp += _hpLoss(
        attack: oppAttack.value,
        dmg: oppDmg.value,
        res: charRes.value,
        ignoreBlocks: ignoreBlocks,
      );
    }

    return RoundPrediction(
      roundNumber: previousRound.roundNumber + 1,
      charStartHp: previousRound.charEndHp,
      charEndHp: previousRound.charEndHp - charLostHp,
      opponentStartHp: previousRound.opponentEndHp,
      opponentEndHp: previousRound.opponentEndHp - oppLostHp,
      charTurn: characterTurn,
      consumablesUsed: [],
    );
  }

  int _hpLoss(
      {required int attack,
      required int dmg,
      required int res,
      required bool ignoreBlocks}) {
    // block?
    if (!ignoreBlocks) {
      final blocked = _predictBlock(res: res);
      if (blocked) {
        return 0;
      }
    }

    // calculate damage
    return _calculateDamage(attack: attack, dmg: dmg, res: res);
  }

  bool _predictBlock({required int res}) {
    // block % is calculated as res / 10. Divide by 100 again to put in range of 0.0 - 1.0 to match the rand function.
    final resPercent = res / 10.0 / 100;
    final rand = random.nextDouble();
    return rand < resPercent;
  }

  int _calculateDamage(
      {required int attack, required int dmg, required int res}) {
    final dmgBonus = attack * (dmg * 0.01);
    final resBonus = attack * (res * 0.01);
    return (attack + dmgBonus - resBonus).round();
  }
}

class FightingStats with EquatableMixin {
  final int hp;
  final int crit;
  final ElementalValue<int> attackFire;
  final ElementalValue<int> attackEarth;
  final ElementalValue<int> attackWater;
  final ElementalValue<int> attackAir;
  final ElementalValue<int> dmgFire;
  final ElementalValue<int> dmgEarth;
  final ElementalValue<int> dmgWater;
  final ElementalValue<int> dmgAir;
  final ElementalValue<int> resFire;
  final ElementalValue<int> resEarth;
  final ElementalValue<int> resWater;
  final ElementalValue<int> resAir;

  FightingStats({
    required this.hp,
    required this.crit,
    required int attackFire,
    required int attackEarth,
    required int attackWater,
    required int attackAir,
    required int dmgFire,
    required int dmgEarth,
    required int dmgWater,
    required int dmgAir,
    required int resFire,
    required int resEarth,
    required int resWater,
    required int resAir,
  })  : attackFire = ElementalValue(element: Element.fire, value: attackFire),
        attackEarth =
            ElementalValue(element: Element.earth, value: attackEarth),
        attackWater =
            ElementalValue(element: Element.water, value: attackWater),
        attackAir = ElementalValue(element: Element.air, value: attackAir),
        dmgFire = ElementalValue(element: Element.fire, value: dmgFire),
        dmgEarth = ElementalValue(element: Element.earth, value: dmgEarth),
        dmgWater = ElementalValue(element: Element.water, value: dmgWater),
        dmgAir = ElementalValue(element: Element.air, value: dmgAir),
        resFire = ElementalValue(element: Element.fire, value: resFire),
        resEarth = ElementalValue(element: Element.earth, value: resEarth),
        resWater = ElementalValue(element: Element.water, value: resWater),
        resAir = ElementalValue(element: Element.air, value: resAir);

  factory FightingStats.fromMonster(Monster monster) {
    return FightingStats(
      hp: monster.hp,
      crit: 0,
      attackFire: monster.fireAttack.attack,
      attackEarth: monster.earthAttack.attack,
      attackWater: monster.waterAttack.attack,
      attackAir: monster.airAttack.attack,
      dmgFire: 0,
      dmgEarth: 0,
      dmgWater: 0,
      dmgAir: 0,
      resFire: monster.fireResistance.percentage,
      resEarth: monster.earthResistance.percentage,
      resWater: monster.waterResistance.percentage,
      resAir: monster.airResistance.percentage,
    );
  }

  factory FightingStats.fromEquipmentLoadout(BoardState boardState,Character character,
      EquipmentLoadout loadout,) {
    var hp = character.maxHp;
    var attackFire = 0;
    var attackEarth = 0;
    var attackWater = 0;
    var attackAir = 0;
    var dmgFire = 0;
    var dmgEarth = 0;
    var dmgWater = 0;
    var dmgAir = 0;
    var resFire = 0;
    var resEarth = 0;
    var resWater = 0;
    var resAir = 0;

    // remove hp added by equipped items to get back to base hp.
    character.equipmentLoadout.equipmentSlots.forEach((key, value) {
      if (value.itemCode != null && value.itemCode!.isNotEmpty) {
        final item = boardState.items.itemByCode(value.itemCode!);
        hp -= item.effects.fold(0, (o, e) => o + (e.effectType == EffectType.hp || e.effectType == EffectType.boostHp ? e.value : 0));
      }
    });

    // add up our stats
    loadout.equipmentSlots.forEach((key, value) {
      if (value.itemCode != null && value.itemCode!.isNotEmpty) {
        final item = boardState.items.itemByCode(value.itemCode!);
        for (final effect in item.effects) {
          switch (effect.effectType) {
            case EffectType.attackAir:
              attackAir += effect.value;
              break;
            case EffectType.boostResAir:
            case EffectType.resAir:
              resAir += effect.value;
              break;
            case EffectType.boostDmgAir:
            case EffectType.dmgAir:
              dmgAir += effect.value;
              break;
            case EffectType.attackEarth:
              attackEarth += effect.value;
              break;
            case EffectType.boostResEarth:
            case EffectType.resEarth:
              resEarth += effect.value;
              break;
            case EffectType.boostDmgEarth:
            case EffectType.dmgEarth:
              dmgEarth += effect.value;
              break;
            case EffectType.attackFire:
              attackFire += effect.value;
              break;
            case EffectType.boostResFire:
            case EffectType.resFire:
              resFire += effect.value;
              break;
            case EffectType.boostDmgFire:
            case EffectType.dmgFire:
              dmgFire += effect.value;
              break;
            case EffectType.attackWater:
              attackWater += effect.value;
              break;
            case EffectType.boostResWater:
            case EffectType.resWater:
              resWater += effect.value;
              break;
            case EffectType.boostDmgWater:
            case EffectType.dmgWater:
              dmgWater += effect.value;
              break;
            case EffectType.boostHp:
            case EffectType.hp:
              hp += effect.value;
              break;
            case EffectType.mining:
            case EffectType.woodcutting:
            case EffectType.fishing:
            case EffectType.alchemy:
            case EffectType.heal:
            case EffectType.haste:
            case EffectType.restore:
            case EffectType.gold:
            case EffectType.teleportX:
            case EffectType.teleportY:
            case EffectType.inventorySpace:
            case EffectType.criticalStrike:
            case EffectType.wisdom:
            case EffectType.dmg:
            case EffectType.prospecting:
            case EffectType.antipoison:
            case EffectType.lifesteal:
            case EffectType.burn:
            case EffectType.healing:
            case EffectType.unknown:
              // Do nothing
              break;
          }
        }
      }
    });

    return FightingStats(
      hp: hp,
      crit: 0,
      attackFire: attackFire,
      attackEarth: attackEarth,
      attackWater: attackWater,
      attackAir: attackAir,
      dmgFire: dmgFire,
      dmgEarth: dmgEarth,
      dmgWater: dmgWater,
      dmgAir: dmgAir,
      resFire: resFire,
      resEarth: resEarth,
      resWater: resWater,
      resAir: resAir,
    );
  }

  List<Element> get primaryAttackTypes {
    final elements = [attackFire, attackEarth, attackWater, attackAir]
        .where((e) => e.value > 0)
        .toList();
    elements.sort((a, b) => b.value - a.value);
    return elements.map((e) => e.element).toList();
  }

  ElementalValue<int> attackForType(Element e) => switch (e) {
        Element.fire => attackFire,
        Element.earth => attackEarth,
        Element.water => attackWater,
        Element.air => attackAir,
      };

  ElementalValue<int> damageForType(Element e) => switch (e) {
        Element.fire => dmgFire,
        Element.earth => dmgEarth,
        Element.water => dmgWater,
        Element.air => dmgAir,
      };

  ElementalValue<int> resistanceForType(Element e) => switch (e) {
        Element.fire => resFire,
        Element.earth => resEarth,
        Element.water => resWater,
        Element.air => resAir,
      };

  @override
  List<Object?> get props => [
        hp,
        crit,
        attackFire,
        attackEarth,
        attackWater,
        attackAir,
        dmgFire,
        dmgEarth,
        dmgWater,
        dmgAir,
        resFire,
        resEarth,
        resWater,
        resAir,
      ];
}

class ElementalValue<T> with EquatableMixin {
  final Element element;
  final T value;

  ElementalValue({required this.element, required this.value});

  @override
  List<Object?> get props => [element, value];
}

enum Element {
  fire,
  earth,
  water,
  air,
}
