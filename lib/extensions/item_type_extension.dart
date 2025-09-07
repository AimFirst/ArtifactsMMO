import 'package:artifacts_api/artifacts_api.dart';

extension ItemSlotExtension on ItemSlot {
  String get type {
    switch (this) {
      case ItemSlot.bodyArmor:
        return 'body_armor';
      case ItemSlot.legArmor:
        return 'leg_armor';
      case ItemSlot.artifact1:
      case ItemSlot.artifact2:
      case ItemSlot.artifact3:
        return 'artifact';
      case ItemSlot.ring1:
      case ItemSlot.ring2:
        return 'ring';
      default:
        return this.name;
    }
  }
}

extension ItemSchemaExtension on ItemSchema {
  ItemSlot? get itemSlot {
    switch (this.type) {
      case 'weapon':
        return ItemSlot.weapon;
      case 'helmet':
        return ItemSlot.helmet;
      case 'shield':
        return ItemSlot.shield;
      case 'body_armor':
        return ItemSlot.bodyArmor;
      case 'leg_armor':
        return ItemSlot.legArmor;
      case 'boots':
        return ItemSlot.boots;
      case 'amulet':
        return ItemSlot.amulet;
      case 'ring':
        return ItemSlot.ring1;
      case 'artifact':
        return ItemSlot.artifact1;
      case 'rune':
        return ItemSlot.rune;
      case 'bag':
        return ItemSlot.bag;
      default:
        return null;
    }
  }
}
