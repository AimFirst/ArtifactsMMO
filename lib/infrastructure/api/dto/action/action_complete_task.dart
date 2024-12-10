import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_reward.dart';

class ActionCompleteTaskResponse extends ActionResponse {
  final TaskReward reward;

  ActionCompleteTaskResponse({
    required super.cooldown,
    required super.character,
    required this.reward,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        reward,
      ];
}

class ActionCompleteTask extends Action {
  ActionCompleteTask({required super.characterName});
}
