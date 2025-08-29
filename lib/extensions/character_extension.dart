import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';
import 'package:artifacts_mmo/models/skill_level.dart';

extension CharacterExtensions on CharacterSchema {
  DestinationSchema get location => (DestinationSchemaBuilder()..x = x..y = y).build();
  int get inventoryCount => inventory?.fold(0, (sum, item) => ((sum ?? 0) + item.quantity)) ?? 0;

  Map<GatheringSkill, SkillLevel> get gatheringSkills => {
    GatheringSkill.mining: SkillLevel(level: miningLevel, xp: miningXp, maxXp: miningMaxXp),
    GatheringSkill.woodcutting: SkillLevel(level: woodcuttingLevel, xp: woodcuttingXp, maxXp: woodcuttingMaxXp),
    GatheringSkill.fishing: SkillLevel(level: fishingLevel, xp: fishingXp, maxXp: fishingMaxXp),
    GatheringSkill.alchemy: SkillLevel(level: alchemyLevel, xp: alchemyXp, maxXp: alchemyMaxXp),
  };

  Map<CraftSkill, SkillLevel> get craftSkills =>
  {
    CraftSkill.alchemy: SkillLevel(level: alchemyLevel, xp: alchemyXp, maxXp: alchemyMaxXp),
    CraftSkill.jewelrycrafting: SkillLevel(level: jewelrycraftingLevel, xp: jewelrycraftingXp, maxXp: jewelrycraftingMaxXp),
    CraftSkill.gearcrafting: SkillLevel(level: gearcraftingLevel, xp: gearcraftingXp, maxXp: gearcraftingMaxXp),
    CraftSkill.weaponcrafting: SkillLevel(level: weaponcraftingLevel, xp: weaponcraftingXp, maxXp: weaponcraftingMaxXp),
    CraftSkill.cooking: SkillLevel(level: cookingLevel, xp: cookingXp, maxXp: cookingMaxXp),
    CraftSkill.mining: SkillLevel(level: miningLevel, xp: miningXp, maxXp: miningMaxXp),
    CraftSkill.woodcutting: SkillLevel(level: woodcuttingLevel, xp: woodcuttingXp, maxXp: woodcuttingMaxXp),
  };

  Map<ElementEnum, int> get attacks => {
    ElementEnum.fire: attackFire,
    ElementEnum.water: attackWater,
    ElementEnum.earth: attackEarth,
    ElementEnum.air: attackAir,
  };

  Map<ElementEnum, int> get damages => {
    ElementEnum.fire: dmgFire,
    ElementEnum.water: dmgWater,
    ElementEnum.earth: dmgEarth,
    ElementEnum.air: dmgAir,
  };

  Map<ElementEnum, int> get resistances => {
    ElementEnum.fire: resFire,
    ElementEnum.water: resWater,
    ElementEnum.earth: resEarth,
    ElementEnum.air: resAir,
  };

  Map<String, SkillLevel> get skills => {'overall': SkillLevel(level: level, xp: xp, maxXp: maxXp)}..addAll(craftSkills.map((key, value) => MapEntry(key.name, value)))..addAll(gatheringSkills.map((key, value) => MapEntry(key.name, value)));
}