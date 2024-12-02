import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart' as sk;
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/item.dart';

extension CharacterExtension on CharacterSchema {
  Character convert() {
    return Character(
      name: name,
      skin: skin.name,
      location: Location(x: x, y: y),
      cooldownEnd: DateTime.now().add(Duration(seconds: cooldown)),
      hp: hp,
      maxHp: maxHp,
      overall: sk.Skill(
          skillType: SkillType.overall,
          level: level,
          xp: xp,
          nextLevelTargetXp: maxXp),
      mining: sk.Skill(
          skillType: SkillType.mining,
          level: miningLevel,
          xp: miningXp,
          nextLevelTargetXp: miningMaxXp),
      woodcutting: sk.Skill(
          skillType: SkillType.woodcutting,
          level: woodcuttingLevel,
          xp: woodcuttingXp,
          nextLevelTargetXp: woodcuttingMaxXp),
      fishing: sk.Skill(
          skillType: SkillType.fishing,
          level: fishingLevel,
          xp: fishingXp,
          nextLevelTargetXp: fishingMaxXp),
      weaponCrafting: sk.Skill(
          skillType: SkillType.weaponCrafting,
          level: weaponcraftingLevel,
          xp: weaponcraftingXp,
          nextLevelTargetXp: weaponcraftingMaxXp),
      gearCrafting: sk.Skill(
          skillType: SkillType.gearCrafting,
          level: gearcraftingLevel,
          xp: gearcraftingXp,
          nextLevelTargetXp: gearcraftingMaxXp),
      jewelryCrafting: sk.Skill(
          skillType: SkillType.jewelryCrafting,
          level: jewelrycraftingLevel,
          xp: jewelrycraftingXp,
          nextLevelTargetXp: jewelrycraftingMaxXp),
      cooking: sk.Skill(
          skillType: SkillType.cooking,
          level: cookingLevel,
          xp: cookingXp,
          nextLevelTargetXp: cookingMaxXp),
      alchemy: sk.Skill(
          skillType: SkillType.alchemy,
          level: alchemyLevel,
          xp: alchemyXp,
          nextLevelTargetXp: alchemyMaxXp),
      gold: gold,
      inventoryMaxItems: inventoryMaxItems,
      inventoryItems:
      inventory?.map((i) => i.convert()).toList() ?? [],
    );
  }
}
