import 'dart:math';

import 'package:artifacts_mmo/business/state/character_log.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/deposit_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/withdraw_item_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

typedef CharacterItemAcquirerSoon = TargetProcessResult Function({
  required ArtifactsClient artifactsClient,
  required BoardState boardState,
  required Character character,
  required ItemQuantity itemQuantity,
  required Target? parentTarget,
  required bool canUseStock,
  required bool allowRareIngredients,
});

abstract class Role {
  RoleType get roleType;

  final CharacterLog characterLog;

  Role({
    required this.characterLog,
  });

  // Stubs
  ProvideResult canProvideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  });

  ProvideResult canAcquireItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) =>
      canProvideItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity,
      );

  TargetProcessResult provideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  });

  TargetProcessResult acquireItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) =>
      provideItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity,
        artifactsClient: artifactsClient,
        parentTarget: parentTarget,
      );

  TargetProcessResult defaultIdle({
    required BoardState boardState,
    required Character character,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
    required CharacterItemAcquirerSoon characterItemAcquirer,
  });

  List<UniqueItemQuantityRequest> bestEquipment({
    required BoardState boardState,
    required Character character,
  });

  List<InventoryItemConstraints> desiredConsumables({
    required BoardState boardState,
    required Character character,
  });

  // Helper Methods
  List<Item> bestItems(
      ItemManager itemManager, ItemType itemType, int characterLevel) {
    final List<Item> bestOptions = [];
    final options = itemManager
        .itemsByType(itemType)
        .where((i) => i.level <= characterLevel)
        .toList();
    options.sort((a, b) => b.level - a.level);
    int? maxLevel;
    for (final item in options) {
      maxLevel ??= item.level;

      // Not the highest thing we can use, so ignore it.
      if (item.level < maxLevel) {
        break;
      }

      bestOptions.add(item);
    }
    return bestOptions;
  }

  // Target methods
  TargetProcessResult checkConsumables({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
    required Target parentTarget,
    required TeamManager teamManager,
  }) {
    final consumables = desiredConsumables(
      boardState: boardState,
      character: character,
    );
    for (final constraint in consumables) {
      final item = boardState.items.itemByCode(constraint.code);
      final currentCount =
          character.inventory.items.count(code: constraint.code) +
              character.equipmentLoadout.count(code: constraint.code);
      if (currentCount > constraint.max) {
        return DepositItemTarget(
                quantityToRemain: ItemQuantity(
                    code: constraint.code, quantity: constraint.max),
                parentTarget: parentTarget,
                characterLog: characterLog)
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
      } else if (currentCount < constraint.min) {
        final countInBank = boardState.bank.items.count(code: constraint.code);
        final countNeededNotInBank = constraint.max - countInBank;

        // We don't have enough in the bank, request some more.
        teamManager.addRequestedItem(PrioritizedElement(
          itemPriority: ItemPriority.high,
          element: UniqueItemQuantityRequest(
            key: '${character.name}:consumable:${item.name}',
            item: item,
            quantityRemaining: countNeededNotInBank,
            totalQuantity: constraint.max,
            requestingCharacter: character.name,
          ),
        ));

        // Withdraw as many as we can/need from the bank.
        if (countInBank > 0) {
          return WithdrawItemTarget(
            quantityToMaintain: ItemQuantity(
                code: constraint.code,
                quantity: min(constraint.max - currentCount, countInBank)),
            parentTarget: parentTarget,
            characterLog: characterLog,
          ).update(
              character: character,
              boardState: boardState,
              artifactsClient: artifactsClient,);
        }
      }
    }

    return TargetProcessResult.noAction();
  }
}

enum RoleType {
  alchemy,
  cooking,
  fighting,
  fishing,
  gearCrafting,
  jewelryCrafting,
  mining,
  weaponCrafting,
  woodcutting,
  inventory,
  bank,
}
