import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:equatable/equatable.dart';

class TaskProgress with EquatableMixin {
  final String taskCode;
  final TaskType taskType;
  final int progress;
  final int total;

  TaskProgress({
    required this.taskCode,
    required this.taskType,
    required this.progress,
    required this.total,
  });

  @override
  List<Object?> get props => [
        taskCode,
        taskType,
        progress,
        total,
      ];
}
