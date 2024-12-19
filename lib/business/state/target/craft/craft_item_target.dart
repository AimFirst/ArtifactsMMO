import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class CraftItemTarget extends CraftTarget {
  final ItemQuantity itemQuantity;

  CraftItemTarget({required this.itemQuantity});

  @override
  Item getItemCraft(
      {required Character character, required BoardState boardState}) {
    return boardState.items.itemByCode(itemQuantity.code);
  }

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    return Progress(
      current:
          character.inventory.items.count(code: itemQuantity.code).toDouble(),
      target: itemQuantity.quantity.toDouble(),
    );
  }

  @override
  String get name => 'Craft item $itemQuantity';
}
