import 'dart:math';
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/monster_extension.dart';
import 'package:artifacts_mmo/models/combat_prediction.dart';

class CombatService {
  final Random _random = Random();

  // The main public method.
  Future<CombatPrediction> runSimulations({
    required CharacterSchema character,
    required MonsterSchema monster,
    int simulationCount = 1000, // Run 1000 fights for a good statistical sample
  }) async {
    int wins = 0;
    List<int> turnsToWin = [];
    List<double> hpRemaining = [];

    for (int i = 0; i < simulationCount; i++) {
      final result = await _runSingleFightSimulation(character, monster);
      if (result.playerWin) {
        wins++;
        turnsToWin.add(result.turns);
        hpRemaining.add(result.hpRemaining);
      }
    }

    return CombatPrediction(
      winPercentage: wins / simulationCount,
      averageTurnsToWin: turnsToWin.isEmpty
          ? 0
          : turnsToWin.reduce((a, b) => a + b) / turnsToWin.length,
      averageHpRemaining: hpRemaining.isEmpty
          ? 0
          : hpRemaining.reduce((a, b) => a + b) / hpRemaining.length,
      haste: character.haste,
      startHp: character.hp,
    );
  }

  // This simulates a single, complete fight from start to finish.
  Future<_SingleFightResult> _runSingleFightSimulation(
      CharacterSchema character, MonsterSchema monster) async {
    final player = _CombatantState.fromCharacter(character);
    final opponent = _CombatantState.fromMonster(monster);

    // TODO: Apply start-of-fight effects (e.g., 'Boost' utility) here.
    // player.strength += 20;

    for (int i = 1; i <= 100; i++) {
      // Max 100 turns
      // --- Player's Turn (if their turn number is odd) ---
      if (i.isOdd) {
        // TODO: Apply player's start-of-turn effects (Healing, Burn, Poison)
        await _performAttack(attacker: player, defender: opponent);
        if (opponent.currentHp <= 0) {
          return _SingleFightResult(
              playerWin: true,
              turns: (i / 2).ceil(),
              hpRemaining: player.currentHp);
        }
      }
      // --- Monster's Turn (if their turn number is even) ---
      else {
        // TODO: Apply monster's start-of-turn effects
        await _performAttack(attacker: opponent, defender: player);
        if (player.currentHp <= 0) {
          return _SingleFightResult(
              playerWin: false, turns: (i / 2).ceil(), hpRemaining: 0);
        }
      }
    }

    // Player loses after 100 turns
    return _SingleFightResult(playerWin: false, turns: 50, hpRemaining: 0);
  }

  // This performs a single attack, including crit chance.
  Future<void> _performAttack(
      {required _CombatantState attacker, required _CombatantState defender}) async {
    double totalDamage = 0;

    // Check for critical hit (this is the random element)
    final isCrit = _random.nextDouble() < ((attacker.criticalStrike) / 100.0);
    final critMultiplier = isCrit ? 1.5 : 1.0;

    for (final element in ElementEnum.values) {
      final int baseAttack = attacker.attacks[element] ?? 0;
      if (baseAttack == 0) continue;

      // 1. Apply damage buffs to the base attack.
      // 1 damage buff = 1% extra damage.
      final damageBuff = attacker.damage + (attacker.damages[element] ?? 0);
      final totalAttack = baseAttack * (1 + (damageBuff / 100));

      // 2. Apply defender's resistance.
      // 1 resistance = 1% damage reduction.
      final resistanceBuff = defender.resistances[element] ?? 0;
      final damageBlocked = totalAttack * (resistanceBuff / 100);
      final damageAfterResistance = max(0, totalAttack - damageBlocked);

      // 3. Factor in critical strike chance for an average result.
      // Crit deals 1.5x damage. Avg Dmg = NormalDmg * (1 + 0.5 * CritChance)
      final critChance = (attacker.criticalStrike) / 100.0;
      final averageElementalDamage =
          damageAfterResistance * (1 + 0.5 * critChance);

      totalDamage += averageElementalDamage;
    }

    defender.currentHp -= _customRound(totalDamage * critMultiplier);

    // TODO: Apply on-hit effects (e.g., 'Lifesteal' on a critical strike)
    // if (isCrit) { attacker.currentHp += totalDamage * 0.1; }
  }

  double _customRound(double value) => (value + 0.00001).round().toDouble();
}

class _CombatantState {
  String name;
  double currentHp;

  // You would copy all relevant combat stats here from the Character/Monster
  int criticalStrike;
  int damage;
  Map<ElementEnum, int> attacks;
  Map<ElementEnum, int> damages;
  Map<ElementEnum, int> resistances;

  // TODO: Add a list to track active effects like Burn or Poison
  // List<ActiveEffect> effects = [];

  _CombatantState({
    required this.name,
    required this.currentHp,
    required this.criticalStrike,
    required this.damage,
    required this.attacks,
    required this.damages,
    required this.resistances,
  });

  factory _CombatantState.fromCharacter(CharacterSchema character) {
    return _CombatantState(
      name: character.name,
      currentHp: character.hp.toDouble(),
      criticalStrike: character.criticalStrike,
      damage: character.dmg,
      attacks: character.attacks,
      damages: character.damages,
      resistances: character.resistances,
    );
  }

  factory _CombatantState.fromMonster(MonsterSchema monster) {
    return _CombatantState(
      name: monster.name,
      currentHp: monster.hp.toDouble(),
      criticalStrike: monster.criticalStrike,
      damage: 0,
      attacks: monster.attacks,
      damages: monster.damages,
      resistances: monster.resistances,
    );
  }
}

// A private class to hold the results of one simulated fight.
class _SingleFightResult {
  final bool playerWin;
  final int turns;
  final double hpRemaining;

  _SingleFightResult({
    required this.playerWin,
    required this.turns,
    required this.hpRemaining,
  });
}
