import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/deposit_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/recycle_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/withdraw_item_target.dart';
import 'package:artifacts_mmo/business/state/target/no_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/alchemy_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/cooking_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/fishing_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/gear_crafting_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/jewelry_crafting_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/mining_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/weapon_crafting_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/woodcutting_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/fighting_role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamTarget extends Target {
  final TeamManager teamManager;
  final List<Role> roles = [];
  var hasCheckedEquipment = false;

  TeamTarget(
      {required this.teamManager,
      required List<RoleType> desiredRoleTypes,
      required super.parentTarget}) {
    roles.addAll(_rolesFromTypes(desiredRoleTypes));
  }

  List<Role> _rolesFromTypes(List<RoleType> roleTypes) {
    return roleTypes
        .map((type) => switch (type) {
              RoleType.woodcutting => WoodcuttingRole(),
              RoleType.alchemy => AlchemyRole(),
              RoleType.cooking => CookingRole(),
              RoleType.fishing => FishingRole(),
              RoleType.gearCrafting => GearCraftingRole(),
              RoleType.jewelryCrafting => JewelryCraftingRole(),
              RoleType.mining => MiningRole(),
              RoleType.weaponCrafting => WeaponCraftingRole(),
              RoleType.fighting => FightingRole(),
            })
        .toList();
  }

  @override
  String get name =>
      'TeamTarget: ${roles.fold('', (o, r) => '$o,${r.roleType}')}';

  @override
  TargetProcessResult update({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {

    if (!hasCheckedEquipment) {
      hasCheckedEquipment = true;
      final desiredEquipment = getDesiredEquipment(character: character, boardState: boardState);
      for (final equip in desiredEquipment) {
        teamManager.addRequestedItem(PrioritizedElement(itemPriority: ItemPriority.medium, element: equip));
      }
    }

    // Do we now have our desired item?
    removeAcquiredWantedItems(character: character);

    // Do we have desired item in the bank?
    final pickUpFromBank = _pickUpDesiredFromBank(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!pickUpFromBank.progress.finished) {
      return pickUpFromBank;
    }

    // Check if we have any of the global wanted items in our inventory ready to give.
    final provideItemsIfPossible = _provideItemsIfPossible(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!provideItemsIfPossible.progress.finished) {
      return provideItemsIfPossible;
    }

    final checkConsumables = _checkConsumables(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
    if (!checkConsumables.progress.finished) {
      return checkConsumables;
    }

    // Do we need to manage our inventory?
    final inventoryTask = _performInventoryCleanup(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
    if (!inventoryTask.progress.finished) {
      return inventoryTask;
    }

    // Perform default idle action.
    return _performIdleAction(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
  }

  void removeAcquiredWantedItems({required Character character}) {
    teamManager.neededItems.list.removeWhere((i) =>
        i.element.requestingCharacter == character.name &&
        _hasDesiredItem(character, i.element));
  }

  TargetProcessResult _performTaskUpdate(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    if (character.taskProgress == null) {
      return AcceptTaskTarget(parentTarget: this).update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);
    }

    final progressTask = PerformTaskTarget(parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!progressTask.progress.finished) {
      return progressTask;
    }

    return CompleteTaskTarget(parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
  }

  TargetProcessResult _pickUpDesiredFromBank(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    for (final desiredItem in teamManager.neededItems.list) {
      if (desiredItem.element.requestingCharacter == character.name) {
        if (boardState.bank.items.count(code: desiredItem.element.item.code) >=
            desiredItem.element.quantity) {
          return WithdrawItemTarget(
                  quantityToMaintain: ItemQuantity(
                      code: desiredItem.element.item.code,
                      quantity: desiredItem.element.quantity),
                  parentTarget: this)
              .update(
                  character: character,
                  boardState: boardState,
                  artifactsClient: artifactsClient);
        }
      }
    }
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to withdraw',
      imageUrl: null,
    );
  }

  TargetProcessResult _provideItemsIfPossible(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    for (final desiredItem in teamManager.neededItems.list) {
      // How many do we want that aren't in the bank?
      final countNotInBank = desiredItem.element.quantity -
          boardState.bank.items.count(code: desiredItem.element.item.code);

      // Everything we need is already in the bank.
      if (countNotInBank <= 0) {
        continue;
      }

      // How many do we have in our inventory?
      final countInInventory = character.inventory.items.count(
        code: desiredItem.element.item.code,
      );

      for (final role in roles) {
        final providability = role.canProvideItem(
          boardState: boardState,
          character: character,
          itemQuantity: ItemQuantity(
            code: desiredItem.element.item.code,
            quantity: desiredItem.element.quantity,
          ),
          allowBank: false,
        );

        switch (providability) {
          case Providable.canProvideImmediately:
            return DepositItemTarget(
                    quantityToRemain: ItemQuantity(
                        code: desiredItem.element.item.code,
                        quantity: countInInventory - countNotInBank),
                    parentTarget: this)
                .update(
              character: character,
              boardState: boardState,
              artifactsClient: artifactsClient,
            );
          case Providable.canProvideSoon:
            return role.provideItem(
              boardState: boardState,
              character: character,
              itemQuantity: ItemQuantity(
                code: desiredItem.element.item.code,
                quantity: desiredItem.element.quantity,
              ),
              artifactsClient: artifactsClient,
              parentTarget: parentTarget,
              allowBank: false,
            );
          default:
          // No action
        }
      }
    }
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to deposit',
      imageUrl: null,
    );
  }

  TargetProcessResult _checkConsumables({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    for (final role in roles) {
      final roleCheck = role.checkConsumables(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
          parentTarget: this,
          teamManager: teamManager);
      if (!roleCheck.progress.finished) {
        return roleCheck;
      }
    }

    return TargetProcessResult.noAction();
  }

  TargetProcessResult _performInventoryCleanup(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final itemCount = character.inventory.items.count();
    // More than 80% full? try to clean up.
    if (itemCount / character.inventory.maxCount.toDouble() > .8) {
      // Do we have any items to recycle?
      for (final itemQuantity in character.inventory.items) {
        final item = boardState.items.itemByCode(itemQuantity.code);
        if (itemQuantity.quantity > 1 &&
            item.craft != null &&
            [
              SkillType.jewelryCrafting,
              SkillType.weaponCrafting,
              SkillType.gearCrafting
            ].contains(item.craft?.skill)) {
          return RecycleItemTarget(
                  quantityToMaintain:
                      ItemQuantity(code: itemQuantity.code, quantity: 1),
                  parentTarget: this)
              .update(
                  character: character,
                  boardState: boardState,
                  artifactsClient: artifactsClient);
        }
      }

      // Do we have any items to deposit?
      final List<ItemQuantity> resources = [];
      for (final itemQuantity in character.inventory.items) {
        final item = boardState.items.itemByCode(itemQuantity.code);
        if (item.type == ItemType.resource ||
            item.type == ItemType.consumable) {
          resources.add(itemQuantity);
        }
      }
      resources.sort((a, b) => b.quantity - a.quantity);
      final itemQuantity = resources.firstOrNull;
      if (itemQuantity != null) {
        return DepositItemTarget(
                quantityToRemain:
                    ItemQuantity(code: itemQuantity.code, quantity: 0),
                parentTarget: this)
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
      }
    }

    return TargetProcessResult(
        progress: Progress.done(),
        action: null,
        description: 'No action to manage inventory size.',
        imageUrl: null);
  }

  // TargetProcessResult optimizeEquipment(
  //     {required Character character,
  //     required BoardState boardState,
  //     required ArtifactsClient artifactsClient}) {
  //   final currentBonus = skillBonusForItemCode(
  //       itemCode: character.equipmentLoadout.weapon.itemCode,
  //       boardState: boardState,
  //       skillType: skillType);
  //   final potentialOptions = character.inventory.items
  //       .where((i) =>
  //           skillBonusForItemCode(
  //               itemCode: i.code,
  //               boardState: boardState,
  //               skillType: skillType) !=
  //           0)
  //       .toList();
  //   if (potentialOptions.isNotEmpty) {
  //     potentialOptions.sort((a, b) =>
  //         skillBonusForItemCode(
  //             itemCode: a.code, boardState: boardState, skillType: skillType) -
  //         skillBonusForItemCode(
  //             itemCode: b.code, boardState: boardState, skillType: skillType));
  //
  //     // If we have a better option, equip it.
  //     if (skillBonusForItemCode(
  //             itemCode: potentialOptions.first.code,
  //             boardState: boardState,
  //             skillType: skillType) <
  //         currentBonus) {
  //       // Equip this item.
  //       final equipmentTarget = EquipItemTarget(
  //               equipmentSlot: QuantityEquipmentSlot(
  //                   equipmentType: EquipmentType.weapon,
  //                   equipmentSlot: EquipmentSlot.weapon,
  //                   itemCode: potentialOptions.first.code,
  //                   quantity: 1),
  //               parentTarget: this)
  //           .update(
  //               character: character,
  //               boardState: boardState,
  //               artifactsClient: artifactsClient);
  //       if (!equipmentTarget.progress.finished) {
  //         return equipmentTarget;
  //       }
  //     }
  //   }
  //
  //   return TargetProcessResult(
  //     progress: Progress.done(),
  //     action: null,
  //     description: 'No items to optimize',
  //     imageUrl: null,
  //   );
  // }

  List<UniqueItemQuantityRequest> getDesiredEquipment(
      {required Character character, required BoardState boardState}) {
    List<UniqueItemQuantityRequest> desiredItems = roles.fold(
        [],
        (o, r) => o
          ..addAll(r.bestEquipment(
            boardState: boardState,
            character: character,
          )));

    desiredItems.removeWhere((i) => _hasDesiredItem(character, i));

    return desiredItems;
  }

  bool _hasDesiredItem(Character character, UniqueItemQuantityRequest request) {
    return character.equipmentLoadout.count(code: request.item.code) +
            character.inventory.items.count(code: request.item.code) >=
        request.quantity;
  }

  TargetProcessResult _performIdleAction(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    return roles.firstOrNull?.defaultIdle(
          boardState: boardState,
          character: character,
          artifactsClient: artifactsClient,
          parentTarget: this,
        ) ??
        NoTarget(parentTarget: this).update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
  }
}
