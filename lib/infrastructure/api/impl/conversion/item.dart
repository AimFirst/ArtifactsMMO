import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/inventory_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/craft.dart';

extension ItemQuantityConversion on SimpleItemSchema {
  ItemQuantity convert() {
    return ItemQuantity(code: code, quantity: quantity);
  }
}

extension ItemConversion on ItemSchema {
  Item convert() {
    return Item(
      name: name,
      code: code,
      level: level,
      type: type,
      subType: subtype,
      description: description,
      effects: effects?.map((e) => e.convert()).toList() ?? [],
      craft: craft?.convert(),
      tradeable: tradeable,
    );
  }
}

extension EffectConversion on ItemEffectSchema {
  Effect convert() {
    return Effect(
      name: name,
      value: value,
    );
  }
}

extension InventorySlotConversion on InventorySlot {
  InventoryItem convert() {
    return InventoryItem(
      slot: slot,
      itemQuantity: ItemQuantity(code: code, quantity: quantity),
    );
  }
}
