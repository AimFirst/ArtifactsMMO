import 'dart:math';

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