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

  int get maxItemsForSlotTypeInLoadout {
    switch (this) {
      case ItemSlot.artifact1:
      case ItemSlot.artifact2:
      case ItemSlot.artifact3:
        return 3;
      case ItemSlot.ring1:
      case ItemSlot.ring2:
        return 2;
      case ItemSlot.utility1:
      case ItemSlot.utility2:
        return 100;
      default:
        return 1;
    }
  }
}

extension ItemSchemaExtension on ItemSchema {
  bool canFitInSlot(ItemSlot slot) {
    switch (slot) {
      case ItemSlot.weapon:
        return this.itemSlot == ItemSlot.weapon;
      case ItemSlot.helmet:
        return this.itemSlot == ItemSlot.helmet;
      case ItemSlot.shield:
        return this.itemSlot == ItemSlot.shield;
      case ItemSlot.bodyArmor:
        return this.itemSlot == ItemSlot.bodyArmor;
      case ItemSlot.legArmor:
        return this.itemSlot == ItemSlot.legArmor;
      case ItemSlot.boots:
        return this.itemSlot == ItemSlot.boots;
      case ItemSlot.amulet:
        return this.itemSlot == ItemSlot.amulet;
      case ItemSlot.ring1:
        return this.itemSlot == ItemSlot.ring1;
      case ItemSlot.ring2:
        return this.itemSlot == ItemSlot.ring1;
      case ItemSlot.artifact1:
        return this.itemSlot == ItemSlot.artifact1;
      case ItemSlot.artifact2:
        return this.itemSlot == ItemSlot.artifact1;
      case ItemSlot.artifact3:
        return this.itemSlot == ItemSlot.artifact1;
      case ItemSlot.rune:
        return this.itemSlot == ItemSlot.rune;
      case ItemSlot.bag:
        return this.itemSlot == ItemSlot.bag;
      default:
        return false;
    }
  }

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
