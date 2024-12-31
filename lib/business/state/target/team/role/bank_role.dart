import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/deposit_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/withdraw_item_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class BankRole extends Role {
  BankRole({required super.characterLog});

  @override
  List<UniqueItemQuantityRequest> bestEquipment(
      {required BoardState boardState, required Character character}) {
    return [];
  }

  /// We can only acquire it if we can get them all from the bank.
  @override
  ProvideResult canAcquireItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) {
    final bankCount = boardState.bank.items.count(code: itemQuantity.code);
    if (bankCount < itemQuantity.quantity) {
      return ProvideResult(
          providable: Providable.cannotProvide,
          neededDependencies: [],
          provideMethod: ProvideMethod.bankWithdraw,
          countNeededAfterThis: itemQuantity.quantity - bankCount);
    }

    return ProvideResult(
        providable: Providable.canProvideSoon,
        neededDependencies: [],
        provideMethod: ProvideMethod.bankWithdraw,
        countNeededAfterThis: 0);
  }

  /// We can only provide it if it's in our inventory. Otherwise, we can't help.
  @override
  ProvideResult canProvideItem(
      {required BoardState boardState,
      required Character character,
      required ItemQuantity itemQuantity}) {
    final inventoryCount =
        character.inventory.items.count(code: itemQuantity.code);
    if (inventoryCount < itemQuantity.quantity) {
      return ProvideResult(
          providable: Providable.cannotProvide,
          neededDependencies: [],
          provideMethod: ProvideMethod.bankWithdraw,
          countNeededAfterThis: itemQuantity.quantity - inventoryCount);
    }

    return ProvideResult(
        providable: Providable.canProvideSoon,
        neededDependencies: [],
        provideMethod: ProvideMethod.bankWithdraw,
        countNeededAfterThis: 0);
  }

  @override
  TargetProcessResult acquireItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    final canAcquireItemResult = canAcquireItem(
      boardState: boardState,
      character: character,
      itemQuantity: itemQuantity,
    );
    final item = boardState.items.itemByCode(itemQuantity.code);

    if (canAcquireItemResult.providable == Providable.cannotProvide) {
      return TargetProcessResult.noAction(
          description: 'No way to acquire ${item.name}');
    }

    final currentAmount =
        character.inventory.items.count(code: itemQuantity.code);
    // Withdraw the item(s) from bank.
    return WithdrawItemTarget(
      quantityToMaintain: ItemQuantity(
          code: itemQuantity.code,
          quantity: itemQuantity.quantity + currentAmount),
      parentTarget: parentTarget,
      characterLog: characterLog,
    ).update(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
  }

  @override
  TargetProcessResult provideItem(
      {required BoardState boardState,
      required Character character,
      required ItemQuantity itemQuantity,
      required ArtifactsClient artifactsClient,
      required Target? parentTarget}) {
    final canProvideItemResult = canProvideItem(
      boardState: boardState,
      character: character,
      itemQuantity: itemQuantity,
    );
    final item = boardState.items.itemByCode(itemQuantity.code);

    if (canProvideItemResult.providable == Providable.cannotProvide) {
      characterLog.addLog('$roleType unable to provide $itemQuantity');
      return TargetProcessResult.noAction(
          description: 'No way to provide ${item.name}');
    }

    final currentAmount =
        character.inventory.items.count(code: itemQuantity.code);
    final targetQuantity = currentAmount - itemQuantity.quantity;
    characterLog
        .addLog('Depositing. Current: $currentAmount, target: $targetQuantity');
    // Deposit the item(s) to bank.
    return DepositItemTarget(
      quantityToRemain: ItemQuantity(
          code: itemQuantity.code,
          quantity: currentAmount - itemQuantity.quantity),
      parentTarget: parentTarget,
      characterLog: characterLog,
    ).update(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
  }

  @override
  TargetProcessResult defaultIdle({
    required BoardState boardState,
    required Character character,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
    required CharacterItemAcquirerSoon characterItemAcquirer,
  }) {
    return TargetProcessResult.noAction();
  }

  @override
  List<InventoryItemConstraints> desiredConsumables(
      {required BoardState boardState, required Character character}) {
    return [];
  }

  @override
  RoleType get roleType => RoleType.bank;
}
