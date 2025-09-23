import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:artifacts_mmo/models/skill_level.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';

extension CharacterExtensions on CharacterSchema {
  static String overallLevelSkillName = 'overall';
  static String healSkillName = 'heal';

  DestinationSchema get location => (DestinationSchemaBuilder()
        ..x = x
        ..y = y)
      .build();

  bool canUseItem(ItemSchema item) {
    for (final itemRequirement in item.conditions ?? <ConditionSchema>[]) {
      String skillName = 'overall';
      switch (itemRequirement.code) {
        case 'level':
          skillName = 'overall';
          break;
        default:
          skillName = itemRequirement.code
              .substring(0, itemRequirement.code.lastIndexOf('_'));
          break;
      }

      final skillLevel = skills[skillName]?.level;
      if (skillLevel == null) {
        LoggerService.instance.log('Skill $skillName not found',
            level: LogLevel.warning, character: this);
        return false;
      }

      switch (itemRequirement.operator_) {
        case ConditionOperator.eq:
          if (skillLevel != itemRequirement.value) return false;
        case ConditionOperator.gt:
          if (skillLevel <= itemRequirement.value) return false;
        case ConditionOperator.lt:
          if (skillLevel >= itemRequirement.value) return false;
        case ConditionOperator.ne:
          if (skillLevel == itemRequirement.value) return false;
      }
    }

    return true;
  }

  String itemInSlot(ItemSlot slot) {
    switch (slot) {
      case ItemSlot.amulet:
        return amuletSlot;
      case ItemSlot.artifact1:
        return artifact1Slot;
      case ItemSlot.artifact2:
        return artifact2Slot;
      case ItemSlot.artifact3:
        return artifact3Slot;
      case ItemSlot.bag:
        return bagSlot;
      case ItemSlot.bodyArmor:
        return bodyArmorSlot;
      case ItemSlot.boots:
        return bootsSlot;
      case ItemSlot.helmet:
        return helmetSlot;
      case ItemSlot.legArmor:
        return legArmorSlot;
      case ItemSlot.ring1:
        return ring1Slot;
      case ItemSlot.ring2:
        return ring2Slot;
      case ItemSlot.rune:
        return runeSlot;
      case ItemSlot.weapon:
        return weaponSlot;
      case ItemSlot.utility1:
        return utility1Slot;
      case ItemSlot.utility2:
        return utility2Slot;
      case ItemSlot.shield:
        return shieldSlot;
      default:
        LoggerService.instance.log('Unknown item slot: $slot', character: this);
        return '';
    }
  }

  CharacterSchema copyWithEquippedItem(
    ItemSlot itemSlot,
    QuantityItemSchema item,
    WorldDataProvider worldDataProvider,
  ) {
    return copyWithEquippedItems({itemSlot: item}, worldDataProvider);
  }

  CharacterSchema copyWithEquippedItems(
    Map<ItemSlot, QuantityItemSchema?> items,
    WorldDataProvider worldDataProvider,
  ) {
    String? previousItemCode;
    final builder = toBuilder();
    for (final itemEntry in items.entries) {
      final itemSlot = itemEntry.key;
      final newItem = itemEntry.value;
      final newItemCode = newItem?.item.code ?? '';
      int previousItemCount = 1;

      switch (itemSlot) {
        case ItemSlot.amulet:
          previousItemCode = amuletSlot;
          builder.amuletSlot = newItemCode;
          break;
        case ItemSlot.artifact1:
          previousItemCode = artifact1Slot;
          builder.artifact1Slot = newItemCode;
          break;
        case ItemSlot.artifact2:
          previousItemCode = artifact2Slot;
          builder.artifact2Slot = newItemCode;
          break;
        case ItemSlot.artifact3:
          previousItemCode = artifact3Slot;
          builder.artifact3Slot = newItemCode;
          break;
        case ItemSlot.bag:
          previousItemCode = bagSlot;
          builder.bagSlot = newItemCode;
          break;
        case ItemSlot.bodyArmor:
          previousItemCode = bodyArmorSlot;
          builder.bodyArmorSlot = newItemCode;
          break;
        case ItemSlot.boots:
          previousItemCode = bootsSlot;
          builder.bootsSlot = newItemCode;
          break;
        case ItemSlot.helmet:
          previousItemCode = helmetSlot;
          builder.helmetSlot = newItemCode;
          break;
        case ItemSlot.legArmor:
          previousItemCode = legArmorSlot;
          builder.legArmorSlot = newItemCode;
          break;
        case ItemSlot.ring1:
          previousItemCode = ring1Slot;
          builder.ring1Slot = newItemCode;
          break;
        case ItemSlot.ring2:
          previousItemCode = ring2Slot;
          builder.ring2Slot = newItemCode;
          break;
        case ItemSlot.rune:
          previousItemCode = runeSlot;
          builder.runeSlot = newItemCode;
          break;
        case ItemSlot.weapon:
          previousItemCode = weaponSlot;
          builder.weaponSlot = newItemCode;
          break;
        case ItemSlot.utility1:
          previousItemCode = utility1Slot;
          builder.utility1Slot = newItemCode;
          builder.utility1SlotQuantity = newItem?.quantity ?? 0;
          previousItemCount = utility1SlotQuantity;
          break;
        case ItemSlot.utility2:
          previousItemCode = utility2Slot;
          builder.utility2Slot = newItemCode;
          builder.utility2SlotQuantity = newItem?.quantity ?? 0;
          previousItemCount = utility2SlotQuantity;
          break;
        case ItemSlot.shield:
          previousItemCode = shieldSlot;
          builder.shieldSlot = newItemCode;
          break;
        default:
          LoggerService.instance
              .log('Unknown item slot: $itemSlot', character: this);
          break;
      }

      final previousItemSchema = previousItemCode == null
          ? null
          : worldDataProvider.getItemByCode(previousItemCode);
      QuantityItemSchema? oldItem = previousItemSchema == null
          ? null
          : QuantityItemSchema(previousItemSchema, previousItemCount);

      if (oldItem != null) {
        _updateStats(builder, oldItem, true);
      }
      if (newItem != null) {
        _updateStats(builder, newItem, false);
      }
    }

    return builder.build();
  }

  void _updateStats(
      CharacterSchemaBuilder builder, QuantityItemSchema item, bool subtract) {
    for (final effect in item.item.effects ?? <SimpleEffectSchema>[]) {
      try {
        final effectEnum =
            EffectEnum.values.firstWhere((e) => e.name == effect.code);
        switch (effectEnum) {
          case EffectEnum.attack_air:
            builder.attackAir = ((builder.attackAir ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.attack_earth:
            builder.attackEarth = ((builder.attackEarth ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.attack_fire:
            builder.attackFire = ((builder.attackFire ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.attack_water:
            builder.attackWater = ((builder.attackWater ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.dmg:
            builder.dmg = ((builder.dmg ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.dmg_air:
            builder.dmgAir = ((builder.dmgAir ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.dmg_earth:
            builder.dmgEarth = ((builder.dmgEarth ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.dmg_fire:
            builder.dmgFire = ((builder.dmgFire ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.dmg_water:
            builder.dmgWater = ((builder.dmgWater ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.res_air:
            builder.resAir = ((builder.resAir ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.res_earth:
            builder.resEarth = ((builder.resEarth ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.res_fire:
            builder.resFire = ((builder.resFire ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.res_water:
            builder.resWater = ((builder.resWater ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.hp:
            builder.hp = ((builder.hp ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            builder.maxHp = ((builder.maxHp ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.critical_strike:
            builder.criticalStrike = ((builder.criticalStrike ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.wisdom:
            builder.wisdom = ((builder.wisdom ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.inventory_space:
            builder.inventoryMaxItems = ((builder.inventoryMaxItems ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.haste:
            builder.haste = ((builder.haste ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.prospecting:
            builder.prospecting = ((builder.prospecting ?? 0) +
                    ((subtract ? -1 : 1) * effect.value) * item.quantity)
                .round();
            break;
          case EffectEnum.alchemy:
          case EffectEnum.antipoison:
          case EffectEnum.boost_dmg_air:
          case EffectEnum.boost_dmg_earth:
          case EffectEnum.boost_dmg_fire:
          case EffectEnum.boost_dmg_water:
          case EffectEnum.boost_hp:
          case EffectEnum.boost_res_air:
          case EffectEnum.boost_res_earth:
          case EffectEnum.boost_res_fire:
          case EffectEnum.boost_res_water:
          case EffectEnum.burn:
          case EffectEnum.corrupted:
          case EffectEnum.fishing:
          case EffectEnum.gold:
          case EffectEnum.heal:
          case EffectEnum.healing:
          case EffectEnum.lifesteal:
          case EffectEnum.mining:
          case EffectEnum.poison:
          case EffectEnum.reconstitution:
          case EffectEnum.restore:
          case EffectEnum.woodcutting:
            break;
        }
      } catch (e) {
        LoggerService.instance.log(
          'Error mapping effect ${effect.code} for ${item.item.code}: $e',
          character: this,
          level: LogLevel.warning,
        );
      }
    }
  }

  int get inventoryCount =>
      inventory?.fold(0, (sum, item) => ((sum ?? 0) + item.quantity)) ?? 0;

  int get remainingInventorySpace => inventoryMaxItems - inventoryCount;

  bool get isInventoryFull => remainingInventorySpace <= 0;

  Map<GatheringSkill, SkillLevel> get gatheringSkills => {
        GatheringSkill.mining:
            SkillLevel(level: miningLevel, xp: miningXp, maxXp: miningMaxXp),
        GatheringSkill.woodcutting: SkillLevel(
            level: woodcuttingLevel,
            xp: woodcuttingXp,
            maxXp: woodcuttingMaxXp),
        GatheringSkill.fishing:
            SkillLevel(level: fishingLevel, xp: fishingXp, maxXp: fishingMaxXp),
        GatheringSkill.alchemy:
            SkillLevel(level: alchemyLevel, xp: alchemyXp, maxXp: alchemyMaxXp),
      };

  Map<CraftSkill, SkillLevel> get craftSkills => {
        CraftSkill.alchemy:
            SkillLevel(level: alchemyLevel, xp: alchemyXp, maxXp: alchemyMaxXp),
        CraftSkill.jewelrycrafting: SkillLevel(
            level: jewelrycraftingLevel,
            xp: jewelrycraftingXp,
            maxXp: jewelrycraftingMaxXp),
        CraftSkill.gearcrafting: SkillLevel(
            level: gearcraftingLevel,
            xp: gearcraftingXp,
            maxXp: gearcraftingMaxXp),
        CraftSkill.weaponcrafting: SkillLevel(
            level: weaponcraftingLevel,
            xp: weaponcraftingXp,
            maxXp: weaponcraftingMaxXp),
        CraftSkill.cooking:
            SkillLevel(level: cookingLevel, xp: cookingXp, maxXp: cookingMaxXp),
        CraftSkill.mining:
            SkillLevel(level: miningLevel, xp: miningXp, maxXp: miningMaxXp),
        CraftSkill.woodcutting: SkillLevel(
            level: woodcuttingLevel,
            xp: woodcuttingXp,
            maxXp: woodcuttingMaxXp),
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

  Map<String, SkillLevel> get skills =>
      {overallLevelSkillName: SkillLevel(level: level, xp: xp, maxXp: maxXp)}
        ..addAll(craftSkills.map((key, value) => MapEntry(key.name, value)))
        ..addAll(
            gatheringSkills.map((key, value) => MapEntry(key.name, value)));
}
