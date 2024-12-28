import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/deposit_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/recycle_item_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/alchemy_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/bank_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/cooking_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/fishing_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/gear_crafting_role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/inventory_role.dart';
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
  late final InventoryRole inventoryRole;
  late final BankRole bankRole;
  var hasCheckedEquipment = false;

  TeamTarget({
    required this.teamManager,
    required List<RoleType> desiredRoleTypes,
    required super.parentTarget,
    required super.characterLog,
  }) {
    inventoryRole = InventoryRole(characterLog: characterLog);
    bankRole = BankRole(characterLog: characterLog);
    roles.addAll(_rolesFromTypes(desiredRoleTypes));
  }

  List<Role> _rolesFromTypes(List<RoleType> roleTypes) {
    return roleTypes
        .map((type) => switch (type) {
              RoleType.woodcutting =>
                WoodcuttingRole(characterLog: characterLog),
              RoleType.alchemy => AlchemyRole(characterLog: characterLog),
              RoleType.cooking => CookingRole(characterLog: characterLog),
              RoleType.fishing => FishingRole(characterLog: characterLog),
              RoleType.gearCrafting =>
                GearCraftingRole(characterLog: characterLog),
              RoleType.jewelryCrafting =>
                JewelryCraftingRole(characterLog: characterLog),
              RoleType.mining => MiningRole(characterLog: characterLog),
              RoleType.weaponCrafting =>
                WeaponCraftingRole(characterLog: characterLog),
              RoleType.fighting => FightingRole(characterLog: characterLog),
              RoleType.inventory => InventoryRole(characterLog: characterLog),
              RoleType.bank => BankRole(characterLog: characterLog),
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
      final desiredEquipment =
          getDesiredEquipment(character: character, boardState: boardState);
      for (final equip in desiredEquipment) {
        characterLog.addLog('requesting equipment ${equip.item.name}');
        teamManager.addRequestedItem(PrioritizedElement(
            itemPriority: ItemPriority.medium, element: equip));
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
      characterLog.addLog('Picking up from bank');
      return pickUpFromBank;
    }

    // Make sure we have all the consumables we want.
    final checkConsumables = _checkConsumables(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
    if (!checkConsumables.progress.finished) {
      characterLog.addLog('Checking consumables');
      return checkConsumables;
    }

    // Do we need to manage our inventory?
    final inventoryTask = _performInventoryCleanup(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
    if (!inventoryTask.progress.finished) {
      characterLog.addLog('Performing inventory task');
      return inventoryTask;
    }

    // Check if we have any of the global wanted items.
    final provideItemsIfPossible = _provideItemsIfPossible(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
    if (!provideItemsIfPossible.progress.finished) {
      characterLog.addLog('Providing items');
      return provideItemsIfPossible;
    }

    // Perform default idle action.
    return _performIdleAction(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
      teamManager: teamManager,
    );
  }

  void removeAcquiredWantedItems({required Character character}) {
    int count = teamManager.neededItems.list.length;
    teamManager.neededItems.list.removeWhere((i) =>
        i.element.requestingCharacter == character.name &&
        _hasDesiredItem(character, i.element));
    characterLog.addLog(
        'Removed ${teamManager.neededItems.list.length - count} acquired items.');
  }

  TargetProcessResult _performTaskUpdate(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    if (character.taskProgress == null) {
      return AcceptTaskTarget(parentTarget: this, characterLog: characterLog)
          .update(
              character: character,
              boardState: boardState,
              artifactsClient: artifactsClient);
    }

    final progressTask =
        PerformTaskTarget(parentTarget: this, characterLog: characterLog)
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
    if (!progressTask.progress.finished) {
      return progressTask;
    }

    return CompleteTaskTarget(parentTarget: this, characterLog: characterLog)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
  }

  TargetProcessResult _pickUpDesiredFromBank({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    // Check if we can pull anything from the bank.
    for (final desiredItem in teamManager.neededItems.list) {
      if (desiredItem.element.requestingCharacter == character.name) {
        final acquireTarget = bankRole.acquireItem(
          boardState: boardState,
          character: character,
          itemQuantity: desiredItem.element.toItemQuantity(),
          artifactsClient: artifactsClient,
          parentTarget: parentTarget,
        );

        // We have a valid task, pull it from the bank.
        if (!acquireTarget.progress.finished) {
          characterLog
              .addLog('Attempting to acquire ${desiredItem.element.item.name}');
          return acquireTarget;
        }

        characterLog
            .addLog('No need to acquire ${desiredItem.element.item.name}');
      }
    }

    // Wasn't able to get anything from the bank.
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to withdraw',
      imageUrl: null,
    );
  }

  TargetProcessResult _provideItemsIfPossible({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    for (final desiredItem in [...teamManager.neededItems.list]) {
      // If we already have this item in the bank, no action needed. The other player will grab it eventually.
      final bankProvide = bankRole.canAcquireItem(
          boardState: boardState,
          character: character,
          itemQuantity: desiredItem.element.toItemQuantity());
      if (bankProvide.providable != Providable.cannotProvide) {
        characterLog.addLog(
            '${desiredItem.element.item.name}x${desiredItem.element.quantityRemaining} already in bank, not providing more.');
        continue;
      }

      // See if any of our roles can provide it.
      var countNeeded = bankProvide.countNeeded;
      for (final role in [bankRole, ...roles]) {
        final canProvide = role.canProvideItem(
          boardState: boardState,
          character: character,
          itemQuantity: ItemQuantity(
            code: desiredItem.element.item.code,
            quantity: countNeeded,
          ),
        );

        // We can provide?
        if (canProvide.providable != Providable.cannotProvide) {
          // We can provide, but do we have all dependencies?
          final remainingDependencies = canProvide.neededDependencies.map((d) {
            final providability = inventoryRole.canProvideItem(
                boardState: boardState, character: character, itemQuantity: d);
            return ItemQuantity(
                code: d.code, quantity: providability.countNeeded);
          }).where((d) => d.quantity > 0);

          // We can provide but there's dependencies we need first.
          if (remainingDependencies.isNotEmpty) {
            for (final dependency in remainingDependencies) {
              characterLog
                  .addLog('Requesting $dependency as a dependency.');
              teamManager.addRequestedItem(
                PrioritizedElement(
                  itemPriority: desiredItem.itemPriority,
                  element: UniqueItemQuantityRequest(
                    key: '${desiredItem.element.key}:${dependency.code}',
                    item: boardState.items.itemByCode(dependency.code),
                    quantityRemaining: dependency.quantity,
                    totalQuantity: character.inventory.items.count(code: dependency.code) + dependency.quantity,
                    requestingCharacter: character.name,
                  ),
                ),
              );
            }
          } else if (canProvide.providable <= Providable.canProvideSoon) {
            characterLog.addLog(
                'Can provide ${desiredItem.element.item.name} soon via ${role.roleType}, start working on it.');
            // We can provide it soon, let's go ahead and work on it.
            return role.provideItem(
              boardState: boardState,
              character: character,
              itemQuantity: ItemQuantity(
                code: desiredItem.element.item.code,
                quantity: countNeeded,
              ),
              artifactsClient: artifactsClient,
              parentTarget: parentTarget,
            );
          }
        }
      }
    }

    // No items to provide.
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to provide',
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
        characterLog.addLog('Consumable action needed for $roleCheck');
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
          characterLog.addLog('Inventory near full, recycling ${item.name}');
          return RecycleItemTarget(
            quantityToMaintain:
                ItemQuantity(code: itemQuantity.code, quantity: 1),
            parentTarget: this,
            characterLog: characterLog,
          ).update(
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
        characterLog.addLog('Deposit ${itemQuantity.code}');
        return DepositItemTarget(
          quantityToRemain: ItemQuantity(code: itemQuantity.code, quantity: 0),
          parentTarget: this,
          characterLog: characterLog,
        ).update(
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
        request.totalQuantity;
  }

  TargetProcessResult _performIdleAction({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
    required TeamManager teamManager,
  }) {
    for (final role in roles) {
      final idleTarget = role.defaultIdle(
        boardState: boardState,
        character: character,
        artifactsClient: artifactsClient,
        parentTarget: parentTarget,
      );
      if (!idleTarget.progress.finished) {
        characterLog.addLog('Performing idle for $role');
        return idleTarget;
      }
    }

    return TargetProcessResult.noAction();
  }
}
