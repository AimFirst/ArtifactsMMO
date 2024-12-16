import 'package:artifacts_mmo/business/state/target/team/role/item_full_quantity.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

abstract class Role {
  Providable canProvideItem(
      {required Character character, required ItemFullQuantity itemQuantity}) {
    if (countOfItemsInInventoryAndEquipment(
            character: character, item: itemQuantity.item) >=
        itemQuantity.quantity) {
      return Providable.canProvideImmediately;
    }

    return Providable.unknown;
  }

  int countOfItemsInInventoryAndEquipment(
      {required Character character, required Item item}) {
    return character.inventory.items.count(code: item.code);
  }
}
