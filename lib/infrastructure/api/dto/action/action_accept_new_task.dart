import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';

class ActionAcceptNewTaskResponse extends ActionResponse {
  final Task task;

  ActionAcceptNewTaskResponse({
    required super.cooldown,
    required super.character,
    required this.task,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        task,
      ];
}

class ActionAcceptNewTask extends Action {
  ActionAcceptNewTask({required super.characterName});
}
