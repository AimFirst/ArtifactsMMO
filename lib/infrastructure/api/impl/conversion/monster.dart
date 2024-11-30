import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/combat/attack.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/combat/combat_type.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/combat/resistance.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/drop.dart';

extension MonsterConversion on MonsterSchema {
  Monster convert() {
    return Monster(
      name: name,
      code: code,
      level: level,
      hp: hp,
      fireAttack: Attack(type: CombatType.fire, attack: attackFire),
      earthAttack: Attack(type: CombatType.earth, attack: attackEarth),
      waterAttack: Attack(type: CombatType.water, attack: attackWater),
      airAttack: Attack(type: CombatType.air, attack: attackAir),
      fireResistance: Resistance(type: CombatType.fire, percentage: resFire),
      earthResistance: Resistance(type: CombatType.earth, percentage: resEarth),
      waterResistance: Resistance(type: CombatType.water, percentage: resWater),
      airResistance: Resistance(type: CombatType.air, percentage: resAir),
      minGold: minGold,
      maxGold: maxGold,
      drops: drops.map((d) => d.convert()).toList(),
    );
  }
}
