import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';

// note to self: HP starts at 120 and increased by 5 for every combat level
class EquipmentLoadout {
  final ItemSchema? weapon;
  final ItemSchema? helmet;
  final ItemSchema? shield;
  final ItemSchema? bodyArmor;
  final ItemSchema? legArmor;
  final ItemSchema? boots;
  final ItemSchema? amulet;
  final ItemSchema? ring1;
  final ItemSchema? ring2;
  final ItemSchema? utility1;
  final ItemSchema? utility2;
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
      utility1: worldDataProvider.getItemByCode(character.utility1Slot),
      utility2: worldDataProvider.getItemByCode(character.utility2Slot),
      artifact1: worldDataProvider.getItemByCode(character.artifact1Slot),
      artifact2: worldDataProvider.getItemByCode(character.artifact2Slot),
      artifact3: worldDataProvider.getItemByCode(character.artifact3Slot),
      rune: worldDataProvider.getItemByCode(character.runeSlot),
      bag: worldDataProvider.getItemByCode(character.bagSlot),
    );
  }

  Map<ItemSlot, ItemSchema?> get itemsBySlot {
    return {
      ItemSlot.weapon: weapon,
      ItemSlot.helmet: helmet,
      ItemSlot.shield: shield,
      ItemSlot.bodyArmor: bodyArmor,
      ItemSlot.legArmor: legArmor,
      ItemSlot.boots: boots,
      ItemSlot.amulet: amulet,
      ItemSlot.ring1: ring1,
      ItemSlot.ring2: ring2,
      ItemSlot.utility1: utility1,
      ItemSlot.utility2: utility2,
      ItemSlot.artifact1: artifact1,
      ItemSlot.artifact2: artifact2,
      ItemSlot.artifact3: artifact3,
      ItemSlot.rune: rune,
      ItemSlot.bag: bag,
    };
  }

  List<ItemSchema?> get items {
    return [
      weapon,
      helmet,
      shield,
      bodyArmor,
      legArmor,
      boots,
      amulet,
      ring1,
      ring2,
      utility1,
      utility2,
      artifact1,
      artifact2,
      artifact3,
      rune,
      bag,
    ];
  }

  double effectValue(EffectEnum effectEnum) {
    return items.fold(
        0,
        (prevItemSum, item) =>
            prevItemSum +
            (item?.effects?.fold(
                    0,
                    (prevEffectSum, effect) =>
                        (prevEffectSum ?? 0) +
                        (effect.code == effectEnum.name ? effect.value : 0)) ??
                0));
  }

  EquipmentLoadout copyWithItem(ItemSlot itemSlot, ItemSchema? item) {
    return EquipmentLoadout(
      weapon: itemSlot == ItemSlot.weapon ? item : weapon,
      helmet: itemSlot == ItemSlot.helmet ? item : helmet,
      shield: itemSlot == ItemSlot.shield ? item : shield,
      bodyArmor: itemSlot == ItemSlot.bodyArmor ? item : bodyArmor,
      legArmor: itemSlot == ItemSlot.legArmor ? item : legArmor,
      boots: itemSlot == ItemSlot.boots ? item : boots,
      amulet: itemSlot == ItemSlot.amulet ? item : amulet,
      ring1: itemSlot == ItemSlot.ring1 ? item : ring1,
      ring2: itemSlot == ItemSlot.ring2 ? item : ring2,
      utility1: itemSlot == ItemSlot.utility1 ? item : utility1,
      utility2: itemSlot == ItemSlot.utility2 ? item : utility2,
      artifact1: itemSlot == ItemSlot.artifact1 ? item : artifact1,
      artifact2: itemSlot == ItemSlot.artifact2 ? item : artifact2,
      artifact3: itemSlot == ItemSlot.artifact3 ? item : artifact3,
      rune: itemSlot == ItemSlot.rune ? item : rune,
      bag: itemSlot == ItemSlot.bag ? item : bag,
    );
  }
}
