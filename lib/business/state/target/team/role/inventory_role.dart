import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class InventoryRole extends Role {
  @override
  List<UniqueItemQuantityRequest> bestEquipment({
    required BoardState boardState,
    required Character character,
  }) {
    return [];
  }

  @override
  ProvideResult canProvideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) {
    final inventoryCount =
        character.inventory.items.count(code: itemQuantity.code);
    if (inventoryCount < itemQuantity.quantity) {
      return ProvideResult(
          providable: Providable.cannotProvide,
          neededDependencies: [],
          provideMethod: ProvideMethod.inventory,
          countNeeded: itemQuantity.quantity - inventoryCount);
    }

    return ProvideResult(
        providable: Providable.canProvideImmediately,
        neededDependencies: [],
        provideMethod: ProvideMethod.inventory,
        countNeeded: 0);
  }

  @override
  TargetProcessResult provideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    return TargetProcessResult.noAction();
  }

  @override
  TargetProcessResult defaultIdle({
    required BoardState boardState,
    required Character character,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    return TargetProcessResult.noAction();
  }

  @override
  List<InventoryItemConstraints> desiredConsumables(
      {required BoardState boardState, required Character character}) {
    return [];
  }

  @override
  RoleType get roleType => RoleType.inventory;
}
