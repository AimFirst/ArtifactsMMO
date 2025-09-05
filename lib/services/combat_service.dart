// lib/services/combat_service.dart

import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/monster_extension.dart';

class CombatDetails {
  final double playerAvgDPT;
  final double monsterAvgDPT;
  final int playerStartHp;
  final int monsterStartHp;
  final int haste;

  int get turnsForPlayerToWin => (monsterStartHp / playerAvgDPT).ceil();

  int get turnsForMonsterToWin => (playerStartHp / monsterAvgDPT).ceil();

  int get totalTurns => min(turnsForPlayerToWin, turnsForMonsterToWin);

  bool get canWin =>
      turnsForPlayerToWin < turnsForMonsterToWin && turnsForPlayerToWin <= 50;

  double get fightCooldown =>
      totalTurns * 2 - (haste * 0.01) * (totalTurns * 2);

  double get restToHealCooldown => (totalTurns * monsterAvgDPT) / 5;

  double get totalCooldown => fightCooldown + restToHealCooldown;

  CombatDetails({
    required this.playerAvgDPT,
    required this.monsterAvgDPT,
    required this.playerStartHp,
    required this.monsterStartHp,
    required this.haste,
  });
}

class CombatService {
  // Simulates a fight and predicts if the character will win.
  bool canWinFight(CharacterSchema character, MonsterSchema monster) {
    // Calculate the average damage per turn for both combatants.
    final combatDetails = getCombatDetails(character, monster);

    return combatDetails.canWin;
  }

  CombatDetails getCombatDetails(
      CharacterSchema character, MonsterSchema monster) {
    // Calculate the average damage per turn for both combatants.
    final playerAvgDPT = _calculateAverageDamagerPerTurnCharacter(
      attacker: character,
      defender: monster,
    );
    final monsterAvgDPT = _calculateAverageDamagerPerTurnMonster(
      attacker: monster,
      defender: character,
    );

    return CombatDetails(
      playerAvgDPT: playerAvgDPT,
      monsterAvgDPT: monsterAvgDPT,
      playerStartHp: character.maxHp,
      monsterStartHp: monster.hp,
      haste: character.haste,
    );
  }

  /// Calculates the total average damage a character does to a monster in one turn.
  double _calculateAverageDamagerPerTurnCharacter({
    required CharacterSchema attacker,
    required MonsterSchema defender,
  }) {
    return _calculateAverageDamagePerTurn(
      attackerAttacks: attacker.attacks,
      attackerDamages: attacker.damages,
      attackerBaseDamage: attacker.dmg,
      attackerCriticalStrike: attacker.criticalStrike,
      defenderResistances: defender.resistances,
    );
  }

  /// Calculates the total average damage a monster does to a character in one turn.
  double _calculateAverageDamagerPerTurnMonster({
    required MonsterSchema attacker,
    required CharacterSchema defender,
  }) {
    return _calculateAverageDamagePerTurn(
      attackerAttacks: attacker.attacks,
      attackerDamages: attacker.damages,
      attackerBaseDamage: 0,
      attackerCriticalStrike: attacker.criticalStrike,
      defenderResistances: defender.resistances,
    );
  }

  /// Calculates the total average damage an attacker does to a defender in one turn.
  double _calculateAverageDamagePerTurn({
    required Map<ElementEnum, int> attackerAttacks,
    required Map<ElementEnum, int> attackerDamages,
    required int attackerBaseDamage,
    required int attackerCriticalStrike,
    required Map<ElementEnum, int> defenderResistances,
  }) {
    double totalAverageDamage = 0;

    // Damage is calculated independently for each element.
    for (final element in ElementEnum.values) {
      final int baseAttack = attackerAttacks[element] ?? 0;
      if (baseAttack == 0) continue;

      // 1. Apply damage buffs to the base attack.
      // 1 damage buff = 1% extra damage.
      final damageBuff = attackerBaseDamage + (attackerDamages[element] ?? 0);
      final totalAttack = baseAttack * (1 + (damageBuff / 100));

      // 2. Apply defender's resistance.
      // 1 resistance = 1% damage reduction.
      final resistanceBuff = defenderResistances[element] ?? 0;
      final damageBlocked = totalAttack * (resistanceBuff / 100);
      final damageAfterResistance = max(0, totalAttack - damageBlocked);

      // 3. Factor in critical strike chance for an average result.
      // Crit deals 1.5x damage. Avg Dmg = NormalDmg * (1 + 0.5 * CritChance)
      final critChance = (attackerCriticalStrike) / 100.0;
      final averageElementalDamage =
          damageAfterResistance * (1 + 0.5 * critChance);

      totalAverageDamage += averageElementalDamage;
    }

    // Use the game's specific rounding rule (.5 rounds up).
    return _customRound(totalAverageDamage);
  }

  // Implements the rounding rule: .5 rounds up.
  double _customRound(double value) {
    // A small epsilon is added to handle floating point inaccuracies around .5
    return (value + 0.00001).round().toDouble();
  }
}
