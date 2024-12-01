import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart' as dto;
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_reward.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/item.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/skill.dart';

extension TaskConversion on TaskFullSchema {
  dto.TaskFull convert() {
    return dto.TaskFull(
      code: code,
      level: level,
      type: type.convert(),
      total: 1,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      skill: skillTypeFromStringNullable(skill),
      rewards: rewards.convert(),
    );
  }
}

extension TaskRewardConversion on TaskRewardsSchema {
  TaskReward convert() {
    return TaskReward(
      items: items.map((i) => i.convert()).toList(),
      gold: gold,
    );
  }
}

extension TaskTypeConversion on TaskType {
  dto.TaskType convert() {
    switch (this) {
      case TaskType.monsters:
        return dto.TaskType.monsters;
      case TaskType.items:
        return dto.TaskType.items;
    }

    throw ArtifactsException(errorMessage: 'Failed to convert: $this');
  }
}
