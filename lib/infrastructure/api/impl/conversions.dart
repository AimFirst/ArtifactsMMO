import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/drop.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/inventory_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource.dart';
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
      inventoryMaxItems: schema.inventoryMaxItems,
      inventoryItems:
          schema.inventory?.map((i) => inventorySlotToItem(i)).toList() ?? [],
    );
  }

  InventoryItem inventorySlotToItem(InventorySlot slot) {
    return InventoryItem(
        slot: slot.slot, code: slot.code, quantity: slot.quantity);
  }

  Character movementResponseToCharacter(CharacterMovementDataSchema schema) {
    return characterSchemaToCharacter(schema.character);
  }

  Resource resourceSchemaToResource(ResourceSchema schema) {
    return Resource(
      name: schema.name,
      code: schema.code,
      skillType: schema.skill.toSkillType(),
      skillLevel: schema.level,
      drops: schema.drops.map((d) => dropSchemaToDrop(d)).toList(),
    );
  }

  DropRate dropSchemaToDrop(DropRateSchema schema) {
    return DropRate(
        code: schema.code,
        rate: schema.rate,
        minQuantity: schema.minQuantity,
        maxQuantity: schema.maxQuantity);
  }
}

extension SkillTypetoGatheringSkillConversions on sk.SkillType {
  GatheringSkill toGatheringSkill() {
    switch (this) {
      case sk.SkillType.mining:
        return GatheringSkill.mining;
      case sk.SkillType.alchemy:
        return GatheringSkill.alchemy;
      case sk.SkillType.woodcutting:
        return GatheringSkill.woodcutting;
      case sk.SkillType.fishing:
        return GatheringSkill.fishing;
      default:
        throw ArtifactsException(
            errorMessage: 'Cannot convert $this to GatheringSkill.');
    }
  }
}

extension GatheringSkillToSkillTypeConversions on GatheringSkill {
  sk.SkillType toSkillType() {
    switch (this) {
      case GatheringSkill.alchemy:
        return sk.SkillType.alchemy;
      case GatheringSkill.fishing:
        return sk.SkillType.fishing;
      case GatheringSkill.mining:
        return sk.SkillType.mining;
      case GatheringSkill.woodcutting:
        return sk.SkillType.woodcutting;
    }
    throw ArtifactsException(errorMessage: 'Cannot convert $this to SkillType');
  }
}
