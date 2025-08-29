// lib/services/combat_service.dart

import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/monster_extension.dart';

class CombatService {
  // Simulates a fight and predicts if the character will win.
  bool canWinFight(CharacterSchema character, MonsterSchema monster) {
    // Calculate the average damage per turn for both combatants.
    final playerAvgDPT = _calculateAverageDamagerPerTurnCharacter(
      attacker: character,
      defender: monster,
    );
    final monsterAvgDPT = _calculateAverageDamagerPerTurnMonster(
      attacker: monster,
      defender: character,
    );

    if (playerAvgDPT <= 0) {
      // LoggerService.instance.log(
      //     "SIM: ${character.name} deals no damage to ${monster.name}. Unwinnable.",
      //     level: LogLevel.warning);
      return false; // Can't win if you can't deal damage.
    }

    // Calculate how many turns it takes for each to win.
    // We use ceil() because a partial turn is still a full turn.
    final turnsForPlayerToWin = (monster.hp / playerAvgDPT).ceil();
    final turnsForMonsterToWin = (character.hp / monsterAvgDPT).ceil();

    // The player wins if they win in fewer turns AND within the 50-turn limit.
    final canWin =
        turnsForPlayerToWin < turnsForMonsterToWin && turnsForPlayerToWin <= 50;

    // LoggerService.instance.log(
    //   "SIM: ${character.name} vs ${monster.name}. Player wins in ~$turnsForPlayerToWin turns. Monster wins in ~$turnsForMonsterToWin turns. Winnable: $canWin",
    // );
    return canWin;
  }

  /// Calculates the total average damage a character does to a monster in one turn.
  double _calculateAverageDamagerPerTurnCharacter({
    required CharacterSchema attacker,
    required MonsterSchema defender,
  }) {
    return _calculateAverageDamagePerTurn(
      attackerAttacks: attacker.attacks,
      attackerDamages: attacker.damages,
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
      attackerCriticalStrike: attacker.criticalStrike,
      defenderResistances: defender.resistances,
    );
  }

  /// Calculates the total average damage an attacker does to a defender in one turn.
  double _calculateAverageDamagePerTurn({
    required Map<ElementEnum, int> attackerAttacks,
    required Map<ElementEnum, int> attackerDamages,
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
      final damageBuff = attackerDamages[element] ?? 0;
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
