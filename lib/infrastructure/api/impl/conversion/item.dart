import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart' as dto_effect;
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart'
    as dto_item;
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/craft.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/util.dart';

extension ItemQuantityConversion on SimpleItemSchema {
  ItemQuantity convert() {
    return ItemQuantity(code: code, quantity: quantity);
  }
}

extension ItemConversion on ItemSchema {
  dto_item.Item convert() {
    return dto_item.Item(
      name: name,
      code: code,
      level: level,
      type: dto_item.ItemType.values
          .byName(type.toCamelCase().toUnknownIfEmpty()),
      subType: dto_item.ItemSubType.values
          .byName(subtype.toCamelCase().toUnknownIfEmpty()),
      description: description,
      effects: effects?.map((e) => e.convert()).toList() ?? [],
      craft: craft?.convert(),
      tradeable: tradeable,
    );
  }
}

extension EffectConversion on SimpleEffectSchema {
  dto_effect.Effect convert() {
    return dto_effect.Effect(
      effectType: dto_effect.EffectType.values.byName(code.toCamelCase()),
      value: value,
    );
  }
}

extension InventorySlotConversion on InventorySlot {
  ItemQuantity convert() {
    return ItemQuantity(code: code, quantity: quantity);
  }
}
