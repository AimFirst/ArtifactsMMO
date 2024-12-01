import 'package:artifacts_mmo/infrastructure/api/dto/task/task_reward.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:equatable/equatable.dart';

class Task with EquatableMixin {
  final String code;
  final TaskType type;
  final int total;
  final TaskReward rewards;

  Task(
      {required this.code, required this.type, required this.total, required this.rewards,});

  @override
  List<Object?> get props => [code, type, total, rewards];
}

class TaskFull extends Task {
  final int level;
  final int minQuantity;
  final int maxQuantity;
  final SkillType? skill;

  TaskFull({required super.code,
    required super.type,
    required super.total,
    required super.rewards,
    required this.level,
    required this.minQuantity,
    required this.maxQuantity,
    required this.skill,});

  @override
  List<Object?> get props =>
      [
        ...super.props,
        level,
        minQuantity,
        maxQuantity,
        skill,
      ];
}

enum TaskType {
  monsters,
  items
}
