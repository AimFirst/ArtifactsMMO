import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_delete_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_recycling.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class ManageInventoryTarget extends Target {
  final Map<String, InventoryItemConstraints> itemConstraints = {
    'ash_wood': InventoryItemConstraints(code: 'ash_wood', min: 20, max: 30),
    'sap': InventoryItemConstraints(code: 'sap', min: 20, max: 30),
  };

  ManageInventoryTarget({ItemQuantity? maxItemQuantity}) {
    if (maxItemQuantity != null) {
      itemConstraints[maxItemQuantity.code] = InventoryItemConstraints(
          code: maxItemQuantity.code,
          min: maxItemQuantity.quantity,
          max: maxItemQuantity.quantity);
    }
  }

  @override
  String get name => 'Manage Inventory';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final filteredItems = character.inventoryItems
        .where((e) => itemConstraints.keys.contains(e.itemQuantity.code));
    for (final inventoryItem in filteredItems) {
      final constraint = itemConstraints[inventoryItem.itemQuantity.code];
      if (constraint == null) {
        continue;
      }

      final item = boardState.items
          .where((i) => i.code == inventoryItem.itemQuantity.code)
          .first;

      if (inventoryItem.itemQuantity.quantity > constraint.max) {
        return TargetProcessResult(
            progress: Progress.empty(),
            action: item.craft != null
                ? artifactsClient.recycle(
                    action: ActionRecycling(
                        itemQuantity: ItemQuantity(
                            code: inventoryItem.itemQuantity.code,
                            quantity: inventoryItem.itemQuantity.quantity -
                                constraint.min)))
                : artifactsClient.deleteItem(
                    action: ActionDeleteItem(
                        itemQuantity: ItemQuantity(
                            code: inventoryItem.itemQuantity.code,
                            quantity: inventoryItem.itemQuantity.quantity -
                                constraint.min))),
            description: 'Dumping extra ${inventoryItem.itemQuantity.code}',
            imageUrl:
                'https://artifactsmmo.com/images/items/${inventoryItem.itemQuantity.code}.png');
      }
    }

    return TargetProcessResult(
        progress: Progress(current: 1, target: 1),
        action: null,
        description: 'Inventory ok',
        imageUrl: null);
  }
}

class InventoryItemConstraints with EquatableMixin {
  final String code;
  final int min;
  final int max;

  InventoryItemConstraints({
    required this.code,
    required this.min,
    required this.max,
  });

  @override
  List<Object?> get props => [
        code,
        min,
        max,
      ];
}
