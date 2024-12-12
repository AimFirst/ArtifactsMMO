import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/deposit_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/recycle_item_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_delete_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:equatable/equatable.dart';

class ManageInventoryTarget extends Target {
  final Map<String, InventoryItemConstraints> itemConstraints = {
    'ash_wood': InventoryItemConstraints(
        code: 'ash_wood',
        min: 0,
        max: 30,
        overflowSolution: InventoryOverflowSolution.deposit),
    'spruce_wood': InventoryItemConstraints(
        code: 'spruce_wood',
        min: 0,
        max: 30,
        overflowSolution: InventoryOverflowSolution.deposit),
    'sap': InventoryItemConstraints(
        code: 'sap',
        min: 0,
        max: 30,
        overflowSolution: InventoryOverflowSolution.deposit),
    'apple': InventoryItemConstraints(
        code: 'apple',
        min: 0,
        max: 30,
        overflowSolution: InventoryOverflowSolution.deposit),
    'copper_ore': InventoryItemConstraints(
      code: 'copper_ore',
      min: 0,
      max: 30,
      overflowSolution: InventoryOverflowSolution.deposit),
    'iron_ore': InventoryItemConstraints(
        code: 'iron_ore',
        min: 0,
        max: 30,
        overflowSolution: InventoryOverflowSolution.deposit),
    'yellow_slimeball': InventoryItemConstraints(
      code: 'yellow_slimeball',
      min: 0,
      max: 20,
      overflowSolution: InventoryOverflowSolution.deposit
    ),
    'red_slimeball': InventoryItemConstraints(
      code: 'red_slimeball',
      min: 0,
      max: 20,
      overflowSolution: InventoryOverflowSolution.deposit
    ),
    'feather': InventoryItemConstraints(
      code: 'feather',
      min: 0,
      max: 20,
      overflowSolution: InventoryOverflowSolution.deposit
    ),
    'egg': InventoryItemConstraints(
        code: 'egg',
        min: 0,
        max: 20,
        overflowSolution: InventoryOverflowSolution.deposit
    ),
    'raw_chicken': InventoryItemConstraints(
        code: 'raw_chicken',
        min: 0,
        max: 20,
        overflowSolution: InventoryOverflowSolution.deposit
    ),
    'sunflower': InventoryItemConstraints(
        code: 'sunflower',
        min: 0,
        max: 20,
        overflowSolution: InventoryOverflowSolution.deposit
    ),
    'gudgeon': InventoryItemConstraints(
        code: 'gudgeon',
        min: 0,
        max: 20,
        overflowSolution: InventoryOverflowSolution.deposit
    ),
    'algae': InventoryItemConstraints(
        code: 'algae',
        min: 0,
        max: 20,
        overflowSolution: InventoryOverflowSolution.deposit
    ),
    'wooden_staff': InventoryItemConstraints(
        code: 'wooden_staff',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'copper_dagger': InventoryItemConstraints(
        code: 'copper_dagger',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'fire_staff': InventoryItemConstraints(
        code: 'fire_staff',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'sticky_dagger': InventoryItemConstraints(
        code: 'sticky_dagger',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'sticky_sword': InventoryItemConstraints(
        code: 'sticky_sword',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'water_bow': InventoryItemConstraints(
        code: 'water_bow',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'copper_boots': InventoryItemConstraints(
        code: 'copper_boots',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'copper_helmet': InventoryItemConstraints(
        code: 'copper_helmet',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'wooden_shield': InventoryItemConstraints(
        code: 'wooden_shield',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
    'copper_ring': InventoryItemConstraints(
        code: 'copper_ring',
        min: 1,
        max: 1,
        overflowSolution: InventoryOverflowSolution.destroy),
  };
  static const recyclableSkills = [
    SkillType.weaponCrafting,
    SkillType.gearCrafting,
    SkillType.jewelryCrafting
  ];
  final bool onlyRunIfNearFull;

  ManageInventoryTarget({
    ItemQuantity? maxItemQuantity,
    InventoryOverflowSolution overflowSolution =
        InventoryOverflowSolution.deposit,
    this.onlyRunIfNearFull = false,
  }) {
    if (maxItemQuantity != null) {
      itemConstraints[maxItemQuantity.code] = InventoryItemConstraints(
        code: maxItemQuantity.code,
        min: maxItemQuantity.quantity,
        max: maxItemQuantity.quantity,
        overflowSolution: overflowSolution,
      );
    }
  }

  @override
  String get name => 'Manage Inventory';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    // Check to see if our inventory is almost full. If not, we don't need to manage inventory yet.
    if (onlyRunIfNearFull) {
      final totalItems = character.inventoryItems
          .fold(0, (o, i) => o + i.itemQuantity.quantity);
      final percent = totalItems / character.inventoryMaxItems.toDouble();
      if (percent < .8) {
        return TargetProcessResult(
          progress: Progress(current: percent, target: percent),
          action: null,
          description: 'Inventory not nearing full, so no action needed.',
          imageUrl: null,
        );
      }
    }

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
        // Supposed to deposit items or destroy them?
        switch (constraint.overflowSolution) {
          case InventoryOverflowSolution.deposit:
            return DepositItemTarget(
              quantityToRemain: ItemQuantity(
                code: constraint.code,
                quantity: constraint.min,
              ),
            ).update(
              character: character,
              boardState: boardState,
              artifactsClient: artifactsClient,
            );
          case InventoryOverflowSolution.destroy:
            if (item.craft != null &&
                recyclableSkills.contains(item.craft!.skill)) {
              return RecycleItemTarget(
                quantityToMaintain: ItemQuantity(
                  code: constraint.code,
                  quantity: constraint.min,
                ),
              ).update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient,
              );
            }

            return TargetProcessResult(
                progress: Progress.empty(),
                action: artifactsClient.deleteItem(
                    action: ActionDeleteItem(
                      characterName: character.name,
                        itemQuantity: ItemQuantity(
                            code: inventoryItem.itemQuantity.code,
                            quantity: inventoryItem.itemQuantity.quantity -
                                constraint.min))),
                description: 'Dumping extra ${inventoryItem.itemQuantity.code}',
                imageUrl:
                    'https://artifactsmmo.com/images/items/${inventoryItem.itemQuantity.code}.png');
        }
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
  final InventoryOverflowSolution overflowSolution;

  InventoryItemConstraints({
    required this.code,
    required this.min,
    required this.max,
    required this.overflowSolution,
  });

  @override
  List<Object?> get props => [code, min, max, overflowSolution];
}

enum InventoryOverflowSolution {
  deposit,
  destroy,
}
