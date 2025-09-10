import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/item_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/item_schema_mapper.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'equipment_loadout.mapper.dart';

// note to self: HP starts at 120 and increased by 5 for every combat level
@MappableClass(includeCustomMappers: [ItemSchemaMapper()])
class EquipmentLoadout with EquipmentLoadoutMappable {
  final ItemSchema? weapon;
  final ItemSchema? helmet;
  final ItemSchema? shield;
  final ItemSchema? bodyArmor;
  final ItemSchema? legArmor;
  final ItemSchema? boots;
  final ItemSchema? amulet;
  final ItemSchema? ring1;
  final ItemSchema? ring2;
  final QuantityItemSchema? utility1;
  final QuantityItemSchema? utility2;
  final ItemSchema? artifact1;
  final ItemSchema? artifact2;
  final ItemSchema? artifact3;
  final ItemSchema? rune;
  final ItemSchema? bag;

  EquipmentLoadout({
    this.weapon,
    this.helmet,
    this.shield,
    this.bodyArmor,
    this.legArmor,
    this.boots,
    this.amulet,
    this.ring1,
    this.ring2,
    this.utility1,
    this.utility2,
    this.artifact1,
    this.artifact2,
    this.artifact3,
    this.rune,
    this.bag,
  });

  factory EquipmentLoadout.fromCharacter(
      CharacterSchema character, WorldDataProvider worldDataProvider) {
    final utilitySlot1Item =
        worldDataProvider.getItemByCode(character.utility1Slot);
    final utilitySlot2Item =
        worldDataProvider.getItemByCode(character.utility2Slot);
    return EquipmentLoadout(
      weapon: worldDataProvider.getItemByCode(character.weaponSlot),
      helmet: worldDataProvider.getItemByCode(character.helmetSlot),
      shield: worldDataProvider.getItemByCode(character.shieldSlot),
      bodyArmor: worldDataProvider.getItemByCode(character.bodyArmorSlot),
      legArmor: worldDataProvider.getItemByCode(character.legArmorSlot),
      boots: worldDataProvider.getItemByCode(character.bootsSlot),
      amulet: worldDataProvider.getItemByCode(character.amuletSlot),
      ring1: worldDataProvider.getItemByCode(character.ring1Slot),
      ring2: worldDataProvider.getItemByCode(character.ring2Slot),
      utility1: utilitySlot1Item == null
          ? null
          : QuantityItemSchema(
              utilitySlot1Item, character.utility1SlotQuantity),
      utility2: utilitySlot2Item == null
          ? null
          : QuantityItemSchema(
              utilitySlot2Item, character.utility2SlotQuantity),
      artifact1: worldDataProvider.getItemByCode(character.artifact1Slot),
      artifact2: worldDataProvider.getItemByCode(character.artifact2Slot),
      artifact3: worldDataProvider.getItemByCode(character.artifact3Slot),
      rune: worldDataProvider.getItemByCode(character.runeSlot),
      bag: worldDataProvider.getItemByCode(character.bagSlot),
    );
  }

  factory EquipmentLoadout.fromItems(List<QuantityItemSchema?> items) {
    EquipmentLoadout loadout = EquipmentLoadout();
    for (final item in items) {
      if (item == null) {
        continue;
      }

      final slot = item.item.itemSlot;
      if (slot != null) {
        loadout = loadout.copyWithItem(slot, item);
      }
    }
    return loadout;
  }

  Map<ItemSlot, QuantityItemSchema?> get itemsBySlot {
    return {
      ItemSlot.weapon: weapon?.quantityItem,
      ItemSlot.helmet: helmet?.quantityItem,
      ItemSlot.shield: shield?.quantityItem,
      ItemSlot.bodyArmor: bodyArmor?.quantityItem,
      ItemSlot.legArmor: legArmor?.quantityItem,
      ItemSlot.boots: boots?.quantityItem,
      ItemSlot.amulet: amulet?.quantityItem,
      ItemSlot.ring1: ring1?.quantityItem,
      ItemSlot.ring2: ring2?.quantityItem,
      ItemSlot.utility1: utility1,
      ItemSlot.utility2: utility2,
      ItemSlot.artifact1: artifact1?.quantityItem,
      ItemSlot.artifact2: artifact2?.quantityItem,
      ItemSlot.artifact3: artifact3?.quantityItem,
      ItemSlot.rune: rune?.quantityItem,
      ItemSlot.bag: bag?.quantityItem,
    };
  }

  List<QuantityItemSchema?> get items {
    return [
      weapon?.quantityItem,
      helmet?.quantityItem,
      shield?.quantityItem,
      bodyArmor?.quantityItem,
      legArmor?.quantityItem,
      boots?.quantityItem,
      amulet?.quantityItem,
      ring1?.quantityItem,
      ring2?.quantityItem,
      utility1,
      utility2,
      artifact1?.quantityItem,
      artifact2?.quantityItem,
      artifact3?.quantityItem,
      rune?.quantityItem,
      bag?.quantityItem,
    ];
  }

  int effectValue(EffectEnum effectEnum) {
    return items.fold(
        0,
        (prevItemSum, item) =>
            prevItemSum +
            (item?.item.effects?.fold(
                        0,
                        (prevEffectSum, effect) =>
                            prevEffectSum +
                            (effect.code == effectEnum.name
                                ? effect.value
                                : 0)) ??
                    0) *
                (item?.quantity ?? 0));
  }

  EquipmentLoadout copyWithItem(ItemSlot itemSlot, QuantityItemSchema? item) {
    return EquipmentLoadout(
      weapon: itemSlot == ItemSlot.weapon ? item?.item : weapon,
      helmet: itemSlot == ItemSlot.helmet ? item?.item : helmet,
      shield: itemSlot == ItemSlot.shield ? item?.item : shield,
      bodyArmor: itemSlot == ItemSlot.bodyArmor ? item?.item : bodyArmor,
      legArmor: itemSlot == ItemSlot.legArmor ? item?.item : legArmor,
      boots: itemSlot == ItemSlot.boots ? item?.item : boots,
      amulet: itemSlot == ItemSlot.amulet ? item?.item : amulet,
      ring1: itemSlot == ItemSlot.ring1 ? item?.item : ring1,
      ring2: itemSlot == ItemSlot.ring2 ? item?.item : ring2,
      utility1: itemSlot == ItemSlot.utility1 ? item : utility1,
      utility2: itemSlot == ItemSlot.utility2 ? item : utility2,
      artifact1: itemSlot == ItemSlot.artifact1 ? item?.item : artifact1,
      artifact2: itemSlot == ItemSlot.artifact2 ? item?.item : artifact2,
      artifact3: itemSlot == ItemSlot.artifact3 ? item?.item : artifact3,
      rune: itemSlot == ItemSlot.rune ? item?.item : rune,
      bag: itemSlot == ItemSlot.bag ? item?.item : bag,
    );
  }
}
