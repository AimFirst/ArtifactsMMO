import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

extension GatheringSkillTypeConversion on GatheringSkill {
  SkillType convert() {
    switch (this) {
      case GatheringSkill.fishing:
        return SkillType.fishing;
      case GatheringSkill.alchemy:
        return SkillType.alchemy;
      case GatheringSkill.mining:
        return SkillType.mining;
      case GatheringSkill.woodcutting:
        return SkillType.woodcutting;
    }

    throw ArtifactsException(errorMessage: 'Failed to convert: $this');
  }
}

extension CraftingSkillTypeConversion on CraftSkill {
  SkillType convert() {
    switch (this) {
      case CraftSkill.weaponcrafting:
        return SkillType.weaponCrafting;
      case CraftSkill.gearcrafting:
        return SkillType.gearCrafting;
      case CraftSkill.jewelrycrafting:
        return SkillType.jewelryCrafting;
      case CraftSkill.cooking:
        return SkillType.cooking;
      case CraftSkill.woodcutting:
        return SkillType.woodcutting;
      case CraftSkill.mining:
        return SkillType.mining;
      case CraftSkill.alchemy:
        return SkillType.alchemy;
    }

    throw ArtifactsException(errorMessage: 'Failed to convert: $this');
  }
}

SkillType skillTypeFromString(String skillType) {
  switch (skillType) {
    case 'weaponcrafting':
      return SkillType.weaponCrafting;
    case 'gearcrafting':
      return SkillType.gearCrafting;
    case 'jewelrycrafting':
      return SkillType.jewelryCrafting;
    case 'cooking':
      return SkillType.cooking;
    case 'woodcutting':
      return SkillType.woodcutting;
    case 'mining':
      return SkillType.mining;
    case 'alchemy':
      return SkillType.alchemy;
    case 'fishing':
      return SkillType.fishing;
  }
  throw ArtifactsException(errorMessage: 'Failed to convert: $skillType');
}

SkillType? skillTypeFromStringNullable(String? skillType) {
  if (skillType == null) {
    return null;
  }

  return skillTypeFromString(skillType);
}

extension SkillTypeConversion on SkillType {
  GatheringSkill convert() {
    switch (this) {
      case SkillType.alchemy:
        return GatheringSkill.alchemy;
      case SkillType.mining:
        return GatheringSkill.mining;
      case SkillType.woodcutting:
        return GatheringSkill.woodcutting;
      case SkillType.fishing:
        return GatheringSkill.fishing;
      default:
        throw ArtifactsException(errorMessage: 'Failed to convert: $this');
    }
  }
}
