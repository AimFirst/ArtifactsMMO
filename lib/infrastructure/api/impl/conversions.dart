import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart' as sk;
import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';

class Conversions {
  const Conversions();

  Character characterSchemaToCharacter(CharacterSchema schema) {
    return Character(
      name: schema.name,
      location: Location(x: schema.x, y: schema.y),
      cooldownEnd: DateTime.now().add(Duration(seconds: schema.cooldown)),
      hp: schema.hp,
      maxHp: schema.maxHp,
      overall: sk.Skill(
          skillType: SkillType.overall,
          level: schema.level,
          xp: schema.xp,
          nextLevelTargetXp: schema.maxXp),
      mining: sk.Skill(
          skillType: SkillType.mining,
          level: schema.miningLevel,
          xp: schema.miningXp,
          nextLevelTargetXp: schema.miningMaxXp),
      woodcutting: sk.Skill(
          skillType: SkillType.woodcutting,
          level: schema.woodcuttingLevel,
          xp: schema.woodcuttingXp,
          nextLevelTargetXp: schema.woodcuttingMaxXp),
      fishing: sk.Skill(
          skillType: SkillType.fishing,
          level: schema.fishingLevel,
          xp: schema.fishingXp,
          nextLevelTargetXp: schema.fishingMaxXp),
      weaponCrafting: sk.Skill(
          skillType: SkillType.weaponCrafting,
          level: schema.weaponcraftingLevel,
          xp: schema.weaponcraftingXp,
          nextLevelTargetXp: schema.weaponcraftingMaxXp),
      gearCrafting: sk.Skill(
          skillType: SkillType.gearCrafting,
          level: schema.gearcraftingLevel,
          xp: schema.gearcraftingXp,
          nextLevelTargetXp: schema.gearcraftingMaxXp),
      jewelryCrafting: sk.Skill(
          skillType: SkillType.jewelryCrafting,
          level: schema.jewelrycraftingLevel,
          xp: schema.jewelrycraftingXp,
          nextLevelTargetXp: schema.jewelrycraftingMaxXp),
      cooking: sk.Skill(
          skillType: SkillType.overall,
          level: schema.cookingLevel,
          xp: schema.cookingXp,
          nextLevelTargetXp: schema.cookingMaxXp),
      alchemy: sk.Skill(
          skillType: SkillType.overall,
          level: schema.alchemyLevel,
          xp: schema.alchemyXp,
          nextLevelTargetXp: schema.alchemyMaxXp),
      gold: schema.gold,
    );
  }

  Character movementResponseToCharacter(CharacterMovementDataSchema schema) {
    return characterSchemaToCharacter(schema.character);
  }
}
