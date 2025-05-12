import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart'
    as dto;
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement_reward.dart';

extension AchievementConversion on AchievementSchema {
  dto.Achievement convert() {
    return dto.Achievement(
      name: name,
      code: code,
      description: description,
      points: points,
      type: type.convert(),
      target: target,
      total: total,
      rewards: rewards.convert(),
    );
  }
}

extension AchievementRewardConversion on AchievementRewardsSchema {
  AchievementReward convert() {
    return AchievementReward(gold: gold);
  }
}

extension AchievementTypConversion on AchievementType {
  dto.AchievementType convert() {
    switch (this) {
      case AchievementType.combatDrop:
        return dto.AchievementType.combatDrop;
      case AchievementType.combatKill:
        return dto.AchievementType.combatKill;
      case AchievementType.combatLevel:
        return dto.AchievementType.combatLevel;
      case AchievementType.crafting:
        return dto.AchievementType.crafting;
      case AchievementType.gathering:
        return dto.AchievementType.gathering;
      case AchievementType.recycling:
        return dto.AchievementType.recycling;
      case AchievementType.task:
        return dto.AchievementType.task;
      case AchievementType.other:
        return dto.AchievementType.other;
      case AchievementType.use:
        return dto.AchievementType.use;
    }

    throw ArtifactsException(errorMessage: 'Unable to convert: $this');
  }
}
