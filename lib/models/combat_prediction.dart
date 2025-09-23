import 'package:dart_mappable/dart_mappable.dart';

part 'combat_prediction.mapper.dart';

@MappableClass()
class CombatPrediction with CombatPredictionMappable {
  final double winPercentage;
  final double averageTurnsToWin;
  final double averageHpRemaining;
  final int haste;
  final int startHp;

  bool get canWin => winPercentage > 0.9;

  double get fightCooldown =>
      averageTurnsToWin * 2 - (haste * 0.01) * (averageTurnsToWin * 2);

  double get restToHealCooldown => (startHp - averageHpRemaining) / 5;

  double get totalCooldown => fightCooldown + restToHealCooldown;

  CombatPrediction({
    required this.winPercentage,
    required this.averageTurnsToWin,
    required this.averageHpRemaining,
    required this.haste,
    required this.startHp,
  });
}
