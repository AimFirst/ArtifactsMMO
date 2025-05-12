import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement_reward.dart';
import 'package:equatable/equatable.dart';

class Achievement with EquatableMixin {
  final String name;
  final String code;
  final String description;
  final int points;
  final AchievementType type;
  final String? target;
  final int total;
  final AchievementReward rewards;

  Achievement({
    required this.name,
    required this.code,
    required this.description,
    required this.points,
    required this.type,
    required this.target,
    required this.total,
    required this.rewards,
  });

  @override
  List<Object?> get props =>
      [name, code, description, points, type, target, total, rewards];
}

enum AchievementType {
  combatKill,
  combatDrop,
  combatLevel,
  gathering,
  crafting,
  recycling,
  task,
  other,
  use
}
