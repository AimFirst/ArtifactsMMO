import 'package:artifacts_mmo/infrastructure/api/dto/task/task_reward.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:equatable/equatable.dart';

class Task with EquatableMixin {
  final String code;
  final int level;
  final TaskType type;
  final int minQuantity;
  final int maxQuantity;
  final SkillType? skill;
  final TaskReward rewards;

  Task(
      {required this.code,
      required this.level,
      required this.type,
      required this.minQuantity,
      required this.maxQuantity,
      required this.skill,
      required this.rewards});

  @override
  List<Object?> get props => [
        code,
        level,
        type,
        minQuantity,
        maxQuantity,
        skill,
        rewards,
      ];
}

enum TaskType {
  monsters,
  items
}
