import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';

part 'combat_details.mapper.dart';

@MappableClass()
class CombatDetails with CombatDetailsMappable {
  final double playerAvgDPT;
  final double monsterAvgDPT;
  final int playerStartHp;
  final int monsterStartHp;
  final int haste;

  CombatDetails({required this.playerAvgDPT, required this.monsterAvgDPT, required this.playerStartHp, required this.monsterStartHp, required this.haste,});

  int get turnsForPlayerToWin => playerAvgDPT == 0 ? 100000 : (monsterStartHp / playerAvgDPT).ceil();

  int get turnsForMonsterToWin => monsterAvgDPT == 0 ? 100000 : (playerStartHp / monsterAvgDPT).ceil();

  int get totalTurns => min(turnsForPlayerToWin, turnsForMonsterToWin);

  bool get canWin =>
      turnsForPlayerToWin < turnsForMonsterToWin && turnsForPlayerToWin <= 50;

  double get fightCooldown =>
      totalTurns * 2 - (haste * 0.01) * (totalTurns * 2);

  double get restToHealCooldown => (totalTurns * monsterAvgDPT) / 5;

  double get totalCooldown => fightCooldown + restToHealCooldown;
}