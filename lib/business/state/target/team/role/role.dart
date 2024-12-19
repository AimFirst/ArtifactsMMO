import 'package:artifacts_mmo/business/state/target/team/role/item_full_quantity.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

abstract class Role {
  Providable canProvideItem({
    required Character character,
    required ItemFullQuantity itemQuantity,
  }) {
    if (character.inventory.items.count(code: itemQuantity.item.code) >=
        itemQuantity.quantity) {
      return Providable.canProvideImmediately;
    }

    return Providable.unknown;
  }

  Providable canGetItem({
    required Character character,
    required ItemFullQuantity itemQuantity,
  }) {
    return Providable.unknown;
  }
}
