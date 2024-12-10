import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_reward.dart';

class ActionTaskExchangeResponse extends ActionResponse {
  final TaskReward reward;

  ActionTaskExchangeResponse({
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

class ActionTaskExchange extends Action {
  ActionTaskExchange({required super.characterName});
}
