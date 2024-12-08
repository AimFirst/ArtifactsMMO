import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart' as sk;
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart' as tsk;
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_progress.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/item.dart';

extension CharacterExtension on CharacterSchema {
  Character convert() {
    return Character(
      name: name,
      skin: skin.name,
      location: Location(x: x, y: y),
      cooldownEnd: cooldownExpiration ?? DateTime.now(),
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
      inventoryItems: inventory?.map((i) => i.convert()).toList() ?? [],
      equipmentLoadout: EquipmentLoadout(
        weapon: EquipmentSlot(
            equipmentType: EquipmentType.weapon, itemCode: weaponSlot),
        shield: EquipmentSlot(
            equipmentType: EquipmentType.shield, itemCode: shieldSlot),
        helmet: EquipmentSlot(
            equipmentType: EquipmentType.helmet, itemCode: helmetSlot),
        bodyArmor: EquipmentSlot(
            equipmentType: EquipmentType.bodyArmor, itemCode: bodyArmorSlot),
        legArmor: EquipmentSlot(
            equipmentType: EquipmentType.legArmor, itemCode: legArmorSlot),
        boots: EquipmentSlot(
            equipmentType: EquipmentType.boots, itemCode: bootsSlot),
        rings: [
          EquipmentSlot(equipmentType: EquipmentType.ring, itemCode: ring1Slot),
          EquipmentSlot(equipmentType: EquipmentType.ring, itemCode: ring2Slot)
        ],
        amulet: EquipmentSlot(
            equipmentType: EquipmentType.amulet, itemCode: amuletSlot),
        artifacts: [
          EquipmentSlot(
              equipmentType: EquipmentType.artifact, itemCode: artifact1Slot),
          EquipmentSlot(
              equipmentType: EquipmentType.artifact, itemCode: artifact2Slot),
          EquipmentSlot(
              equipmentType: EquipmentType.artifact, itemCode: artifact3Slot),
        ],
        utilities: [
          QuantityEquipmentSlot(
              equipmentType: EquipmentType.utility,
              itemCode: utility1Slot,
              quantity: utility1SlotQuantity),
          QuantityEquipmentSlot(
              equipmentType: EquipmentType.utility,
              itemCode: utility2Slot,
              quantity: utility2SlotQuantity),
        ],
      ),
      taskProgress: task.isEmpty
          ? null
          : TaskProgress(
              taskCode: task,
              taskType: tsk.TaskType.values.byName(taskType),
              progress: taskProgress,
              total: taskTotal),
    );
  }
}
