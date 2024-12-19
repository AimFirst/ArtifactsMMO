import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_item_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_level_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_item_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_skill_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/deposit_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/equip_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/recycle_item_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/withdraw_item_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_equip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_unequip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

abstract class TeamRoleTarget extends Target {
  final TeamManager teamManager;

  TeamRoleTarget(
      {required this.teamManager,
      required Character character,
      required BoardState boardState}) {
    teamManager.removeItemsForCharacter(character.name);
    final desiredItems =
        getDesiredItems(character: character, boardState: boardState);
    for (final desiredItem in desiredItems) {
      teamManager.addRequestedItem(PrioritizedElement(
          itemPriority: ItemPriority.medium, element: desiredItem));
    }
  }

  SkillType get fightingSkill;

  SkillType get craftingSkill;

  SkillType get gatheringSkill;

  List<SkillType> get skillTypes;

  List<UniqueItemQuantityRequest> getDesiredItems(
      {required Character character, required BoardState boardState}) {
    List<UniqueItemQuantityRequest> desiredItems = [];
    if (gatheringSkill != SkillType.unknown) {
      desiredItems.addAll(boardState.items.itemsByTypeAndSubType(ItemType.weapon, ItemSubType.tool)
          .where((i) =>
              i.effects.fold(
                    0,
                    (o, e) =>
                        o +
                        (e.effectType == gatheringSkill.effectType && e.value < 0 ? 1 : 0),
                  ) >
                  0)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:tool:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
    }

    if (fightingSkill != SkillType.unknown) {
      final fightingLevel = character.overall.level;
      desiredItems.addAll(_bestItems(boardState.items, ItemType.weapon, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:weapon:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
      desiredItems.addAll(_bestItems(boardState.items, ItemType.boots, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:boots:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
      desiredItems.addAll(_bestItems(boardState.items, ItemType.helmet, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:helmet:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
      desiredItems.addAll(_bestItems(boardState.items, ItemType.shield, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:shield:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
      desiredItems.addAll(_bestItems(boardState.items, ItemType.ring, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:ring:${i.code}',
              item: i,
              quantity: 2,
              requestingCharacter: character.name)));
      desiredItems.addAll(
          _bestItems(boardState.items, ItemType.legArmor, fightingLevel).map((i) =>
              UniqueItemQuantityRequest(
                  key: '${character.name}:leg_armor:${i.code}',
                  item: i,
                  quantity: 1,
                  requestingCharacter: character.name)));
      desiredItems.addAll(
          _bestItems(boardState.items, ItemType.bodyArmor, fightingLevel).map((i) =>
              UniqueItemQuantityRequest(
                  key: '${character.name}:body_armor:${i.code}',
                  item: i,
                  quantity: 1,
                  requestingCharacter: character.name)));
      desiredItems.addAll(_bestItems(boardState.items, ItemType.amulet, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:amulet:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
      desiredItems.addAll(_bestItems(boardState.items, ItemType.amulet, fightingLevel)
          .map((i) => UniqueItemQuantityRequest(
              key: '${character.name}:amulet:${i.code}',
              item: i,
              quantity: 1,
              requestingCharacter: character.name)));
    }

    desiredItems.removeWhere((i) => _hasDesiredItem(character, i));

    return desiredItems;
  }

  List<Item> _bestItems(
      ItemManager itemManager, ItemType itemType, int characterLevel) {
    final List<Item> bestOptions = [];
    final options = itemManager.itemsByType(itemType)
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

  int _countOfItemInEquipmentAndInventory(
      Character character, UniqueItemQuantityRequest request) {
    var count = 0;
    count +=
        character.equipmentLoadout.weapon.itemCode == request.item.code ? 1 : 0;
    count +=
        character.equipmentLoadout.amulet.itemCode == request.item.code ? 1 : 0;
    count +=
        character.equipmentLoadout.boots.itemCode == request.item.code ? 1 : 0;
    count += character.equipmentLoadout.legArmor.itemCode == request.item.code
        ? 1
        : 0;
    count += character.equipmentLoadout.bodyArmor.itemCode == request.item.code
        ? 1
        : 0;
    count +=
        character.equipmentLoadout.helmet.itemCode == request.item.code ? 1 : 0;
    count +=
        character.equipmentLoadout.shield.itemCode == request.item.code ? 1 : 0;
    count += character.equipmentLoadout.artifacts
        .fold(0, (o, a) => o + (a.itemCode == request.item.code ? 1 : 0));
    count += character.equipmentLoadout.rings
        .fold(0, (o, r) => o + (r.itemCode == request.item.code ? 1 : 0));
    count += character.equipmentLoadout.utilities.fold(
        0, (o, u) => o + (u.itemCode == request.item.code ? u.quantity : 0));
    count += character.inventory.items.count(code: request.item.code);
    return count;
  }

  bool _hasDesiredItem(Character character, UniqueItemQuantityRequest request) {
    return _countOfItemInEquipmentAndInventory(character, request) >=
        request.quantity;
  }

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    return performDefaultTask(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
  }

  TargetProcessResult performDefaultTask(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    // Do we now have our desired item?
    removeAcquiredWantedItems(character: character);

    // Do we have desired item in the bank?
    final pickUpFromBank = pickUpDesiredFromBank(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!pickUpFromBank.progress.finished) {
      return pickUpFromBank;
    }

    // Check if we have any of the global wanted items in our inventory ready to give.
    final depositGlobalWantedItemsTask = depositGlobalWantedItems(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!depositGlobalWantedItemsTask.progress.finished) {
      return depositGlobalWantedItemsTask;
    }

    // Can we gather any items that are needed?
    final gatherWantedItemsTask = gatherGlobalWantedItems(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!gatherWantedItemsTask.progress.finished) {
      return gatherWantedItemsTask;
    }

    final checkConsumables = _checkConsumables(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!checkConsumables.progress.finished) {
      return checkConsumables;
    }

    // Can we fight for any items that are needed?
    final fightWantedItemsTask = fightGlobalWantedItems(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!fightWantedItemsTask.progress.finished) {
      return fightWantedItemsTask;
    }

    // Can we craft any items that are needed?
    final craftWantedItemsTask = craftGlobalWantedItems(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!craftWantedItemsTask.progress.finished) {
      return craftWantedItemsTask;
    }

    // Do we need to manage our inventory?
    final inventoryTask = _performInventoryCleanup(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!inventoryTask.progress.finished) {
      return inventoryTask;
    }

    // Try to level up our fighting skill.
    if (fightingSkill != SkillType.unknown) {
      final taskTarget = _performTaskUpdate(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);
      if (!taskTarget.progress.finished) {
        return taskTarget;
      }
    }

    // Try to level up our crafting skill.
    if (craftingSkill != SkillType.unknown) {
      final performCraftLeveling = performLevelUpCraft(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);
      if (!performCraftLeveling.progress.finished) {
        return performCraftLeveling;
      }
    }

    // Try to level up our gathering skill.
    if (gatheringSkill != SkillType.unknown) {
      final performGatherLeveling = performLevelUpGather(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);
      if (!performGatherLeveling.progress.finished) {
        return performGatherLeveling;
      }
    }

    return FightLevelTarget(level: character.overall.level + 1).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
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
      return AcceptTaskTarget().update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);
    }

    final progressTask = PerformTaskTarget().update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!progressTask.progress.finished) {
      return progressTask;
    }

    return CompleteTaskTarget().update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
  }

  TargetProcessResult pickUpDesiredFromBank(
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
                      quantity: desiredItem.element.quantity))
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

  TargetProcessResult depositGlobalWantedItems(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    for (final desiredItem in teamManager.neededItems.list) {
      // Don't deposit it if it's for us.
      if (desiredItem.element.requestingCharacter == character.name) {
        continue;
      }

      // How many do we want that aren't in the bank?
      final countNotInBank = desiredItem.element.quantity -
          boardState.bank.items.count(code: desiredItem.element.item.code);

      // Everything we need is already in the bank.
      if (countNotInBank <= 0) {
        continue;
      }

      // Is it one of the items we can gather or craft?
      if (canGatherItem(desiredItem.element.item) ||
          canCraftItem(desiredItem.element.item) ||
          canFightForItem(desiredItem.element.item)) {
        final countInInventory = character.inventory.items
            .count(code: desiredItem.element.item.code);

        // Do we have enough to deposit?
        if (countInInventory >= countNotInBank) {
          return DepositItemTarget(
                  quantityToRemain: ItemQuantity(
                      code: desiredItem.element.item.code,
                      quantity: countInInventory - countNotInBank))
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
      description: 'No items to deposit',
      imageUrl: null,
    );
  }

  TargetProcessResult gatherGlobalWantedItems(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    for (final desiredItem in teamManager.neededItems.list) {
      if (canGatherItem(desiredItem.element.item)) {
        // How many do we want that aren't in the bank?
        var countNotInBank = desiredItem.element.quantity -
            boardState.bank.items.count(code: desiredItem.element.item.code);

        // If it's for us, check our inventory too.
        if (desiredItem.element.requestingCharacter == character.name) {
          countNotInBank -= character.inventory.items
              .count(code: desiredItem.element.item.code);
        }

        // Everything we need is already in the bank.
        if (countNotInBank <= 0) {
          continue;
        }

        // Can we equip better stuff for this skill?
        final optimizeEquipment = optimizeEquipmentForGatheringSkill(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
          skillType: gatheringSkill,
        );
        if (!optimizeEquipment.progress.finished) {
          return optimizeEquipment;
        }

        return GatheringItemTarget(
                targetItemQuantity: ItemQuantity(
                    code: desiredItem.element.item.code,
                    quantity: countNotInBank))
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
      }
    }
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to gather',
      imageUrl: null,
    );
  }

  TargetProcessResult optimizeEquipmentForGatheringSkill(
      {required Character character,
      required BoardState boardState,
      required SkillType skillType,
      required ArtifactsClient artifactsClient}) {
    final currentBonus = skillBonusForItemCode(
        itemCode: character.equipmentLoadout.weapon.itemCode,
        boardState: boardState,
        skillType: skillType);
    final potentialOptions = character.inventory.items
        .where((i) =>
            skillBonusForItemCode(
                itemCode: i.code,
                boardState: boardState,
                skillType: skillType) !=
            0)
        .toList();
    if (potentialOptions.isNotEmpty) {
      potentialOptions.sort((a, b) =>
          skillBonusForItemCode(
              itemCode: a.code, boardState: boardState, skillType: skillType) -
          skillBonusForItemCode(
              itemCode: b.code, boardState: boardState, skillType: skillType));

      // If we have a better option, equip it.
      if (skillBonusForItemCode(
              itemCode: potentialOptions.first.code,
              boardState: boardState,
              skillType: skillType) <
          currentBonus) {
        // Equip this item.
        final equipmentTarget = EquipItemTarget(
                equipmentSlot: QuantityEquipmentSlot(
                    equipmentType: EquipmentType.weapon,
                    equipmentSlot: EquipmentSlot.weapon,
                    itemCode: potentialOptions.first.code,
                    quantity: 1))
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
        if (!equipmentTarget.progress.finished) {
          return equipmentTarget;
        }
      }
    }

    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to optimize',
      imageUrl: null,
    );
  }

  int skillBonusForItemCode(
      {required String? itemCode,
      required BoardState boardState,
      required SkillType skillType}) {
    if (itemCode == null) {
      return 0;
    }

    return skillBonusForItem(
        item: boardState.items.itemByCode(itemCode),
        skillType: skillType);
  }

  int skillBonusForItem({required Item item, required SkillType skillType}) {
    return item.effects.fold(
                0,
                (o, e) =>
                    o + (e.effectType == skillType.effectType ? e.value : 0));
  }

  TargetProcessResult _checkConsumables({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    // Health potions
    if (fightingSkill != SkillType.unknown) {
      final options = boardState.items.itemsByTypeAndSubType(ItemType.utility, ItemSubType.potion)
          .where((i) =>
              i.level <= character.overall.level &&
              i.effects.where((i) => i.effectType == EffectType.restore).isNotEmpty)
          .toList();
      options.sort((a, b) => b.level - a.level);
      if (options.isNotEmpty) {
        final first = options.first;
        const desiredCount = 25;
        const minCount = 10;
        final request = UniqueItemQuantityRequest(
            key: 'health ${character.name}',
            item: first,
            quantity: desiredCount,
            requestingCharacter: character.name);
        final count = _countOfItemInEquipmentAndInventory(character, request);
        if (count < minCount) {
          teamManager.neededItems.addElement(PrioritizedElement(
              itemPriority: ItemPriority.high,
              element: request.copyWith(quantity: desiredCount - count)));
        }

        // Equip what we can
        if (count > 0) {
          final slot1 =
              character.equipmentLoadout.equipmentSlots[EquipmentSlot.utility1];
          // Unequip util 1
          if (slot1?.itemCode != null && slot1?.itemCode != first.code) {
            return TargetProcessResult(
                progress: Progress.empty(),
                action: artifactsClient.unequipItem(
                    action: ActionUnequipItem(
                        slot: EquipmentSlot.utility1,
                        quantity: slot1?.quantity ?? 0,
                        characterName: character.name)),
                description: 'Unequipping ${first.name}',
                imageUrl:
                    'https://artifactsmmo.com/images/items/${first.code}.png');
          }

          // Equip any extra potions in inventory.
          final count = character.inventory.items.count(code: first.code);
          if (count > 0) {
            return TargetProcessResult(
                progress: Progress.empty(),
                action: artifactsClient.equipItem(
                    action: ActionEquipItem(
                        code: first.code,
                        slot: EquipmentSlot.utility1,
                        quantity: count,
                        characterName: character.name)),
                description: 'Equipping ${first.name}.',
                imageUrl:
                    'https://artifactsmmo.com/images/items/${first.code}.png');
          }
        }
      }

      // Boost potions
      final desiredPotions = [
        'earth_boost_potion',
        'air_boost_potion',
        'fire_boost_potion',
        'water_boost_potion'
      ];
      for (final potion in desiredPotions) {
        const desiredCount = 10;
        const minCount = 2;
        final item = boardState.items.itemByCode(potion);
        final request = UniqueItemQuantityRequest(
            key: '$potion ${character.name}',
            item: item,
            quantity: desiredCount,
            requestingCharacter: character.name);
        final count = _countOfItemInEquipmentAndInventory(character, request);
        if (count < minCount) {
          teamManager.neededItems.addElement(PrioritizedElement(
              itemPriority: ItemPriority.high,
              element: request.copyWith(quantity: desiredCount - count)));
        }
      }

      // Healing items.
      final healOptions = boardState.items.itemsByType(ItemType.consumable) .where(
          (i) => i.level < character.overall.level);
      for (final option in healOptions) {
        const desiredCountOfConsumableItems = 5;
        final request = UniqueItemQuantityRequest(
            key: '${character.name} ${option.name}',
            item: option,
            quantity: desiredCountOfConsumableItems,
            requestingCharacter: character.name);
        final currentCount =
            _countOfItemInEquipmentAndInventory(character, request);
        if (currentCount < desiredCountOfConsumableItems) {
          teamManager.neededItems.addElement(PrioritizedElement(
              itemPriority: ItemPriority.high, element: request));
        }
      }
    }

    return TargetProcessResult(
        progress: Progress.done(),
        action: null,
        description: 'No need to manage consumables.',
        imageUrl: null);
  }

  TargetProcessResult fightGlobalWantedItems(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    for (final desiredItem in teamManager.neededItems.list) {
      if (canFightForItem(desiredItem.element.item)) {
        // How many do we want that aren't in the bank?
        var countNotInBank = desiredItem.element.quantity -
            boardState.bank.items.count(code: desiredItem.element.item.code);

        // If it's for us, check our inventory too.
        if (desiredItem.element.requestingCharacter == character.name) {
          countNotInBank -= character.inventory.items
              .count(code: desiredItem.element.item.code);
        }

        // Everything we need is already in the bank.
        if (countNotInBank <= 0) {
          continue;
        }

        return FightItemTarget(
                itemQuantity: ItemQuantity(
                    code: desiredItem.element.item.code,
                    quantity: desiredItem.element.quantity))
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
      }
    }
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to fight',
      imageUrl: null,
    );
  }

  TargetProcessResult craftGlobalWantedItems(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final list = [...teamManager.neededItems.list];
    for (final desiredItem in list) {
      if (canCraftItem(desiredItem.element.item)) {
        // How many do we want that aren't in the bank?
        var countNotInBank = desiredItem.element.quantity -
            boardState.bank.items.count(code: desiredItem.element.item.code);

        // If it's for us, check our inventory too.
        if (desiredItem.element.requestingCharacter == character.name) {
          countNotInBank -= character.inventory.items
              .count(code: desiredItem.element.item.code);
        }

        // Everything we need is already in the bank.
        if (countNotInBank <= 0) {
          continue;
        }

        // Do we have the ingredients to craft it?
        var hasAllIngredients = true;
        for (final ingredientQuantity
            in desiredItem.element.item.craft?.items ?? <ItemQuantity>[]) {
          final neededCount =
              ingredientQuantity.quantity * desiredItem.element.quantity;
          final countInInventory =
              character.inventory.items.count(code: ingredientQuantity.code);
          if (countInInventory < neededCount) {
            teamManager.addRequestedItem(PrioritizedElement(
              itemPriority: desiredItem.itemPriority,
              element: UniqueItemQuantityRequest(
                  key: '${desiredItem.element.key}:${ingredientQuantity.code}',
                  item: boardState.items.itemByCode(ingredientQuantity.code),
                  quantity: neededCount - countInInventory,
                  requestingCharacter: character.name),
            ));
            hasAllIngredients = false;
          }
        }

        // Can't craft it.
        if (!hasAllIngredients) {
          continue;
        }

        // We can craft it!
        return CraftItemTarget(
                itemQuantity: ItemQuantity(
                    code: desiredItem.element.item.code,
                    quantity: desiredItem.element.quantity))
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
      }
    }
    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'No items to craft',
      imageUrl: null,
    );
  }

  bool canFightForItem(Item item) {
    return fightingSkill != SkillType.unknown &&
        item.type == ItemType.resource &&
        item.subType == ItemSubType.mob;
  }

  bool canGatherItem(Item item) {
    return item.type == ItemType.resource && item.subType == gatheringSkill.itemSubtype;
  }

  bool canCraftItem(Item item) {
    return skillTypes.contains(item.craft?.skill);
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
                      ItemQuantity(code: itemQuantity.code, quantity: 1))
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
        if (item.type == ItemType.resource || item.type == ItemType.consumable) {
          resources.add(itemQuantity);
        }
      }
      resources.sort((a, b) => b.quantity - a.quantity);
      final itemQuantity = resources.firstOrNull;
      if (itemQuantity != null) {
        return DepositItemTarget(
                quantityToRemain:
                    ItemQuantity(code: itemQuantity.code, quantity: 0))
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

  TargetProcessResult performLevelUpCraft(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    // Try to craft the highest level thing we can.
    final options = skillTypes.fold([], (o,l) => o..addAll(skillTypes.map((s) => boardState.items.itemsByCraftType(s))))
        .where((i) =>
            (i.craft?.level ?? 0) <=
                character.allSkills
                    .where((s) => s.skillType == i.craft?.skill)
                    .first
                    .level)
        .toList();

    options.sort((a, b) => (b.craft?.level ?? 0) - (a.craft?.level ?? 0));

    // Do we have enough for this item?
    for (final option in options) {
      bool hasEnough = true;
      for (final ingredientQuantity
          in option.craft?.items ?? <ItemQuantity>[]) {
        // Don't use any rare resources for level up crafting.
        if (boardState.items.itemByCode(ingredientQuantity.code)
                .subType == ItemSubType.task) {
          hasEnough = false;
          break;
        }

        // Check how many we currently have in our inventory and bank
        final ownedCount =
            character.inventory.items.count(code: ingredientQuantity.code) +
                boardState.bank.items.count(code: ingredientQuantity.code);

        //  Not enough, this is not a viable craft.
        if (ownedCount < ingredientQuantity.quantity) {
          hasEnough = false;
          break;
        }
      }

      // We do have enough!
      if (hasEnough) {
        // Decide if we need to pull something out of bank or not.
        for (final ingredientQuantity
            in option.craft?.items ?? <ItemQuantity>[]) {
          final inventoryCount =
              character.inventory.items.count(code: ingredientQuantity.code);

          // We do, pull it from the bank.
          if (inventoryCount < ingredientQuantity.quantity) {
            return WithdrawItemTarget(quantityToMaintain: ingredientQuantity)
                .update(
                    character: character,
                    boardState: boardState,
                    artifactsClient: artifactsClient);
          }
        }

        // Craft it.
        return CraftItemTarget(
                itemQuantity: ItemQuantity(
                    code: option.code,
                    quantity:
                        character.inventory.items.count(code: option.code) + 1))
            .update(
                character: character,
                boardState: boardState,
                artifactsClient: artifactsClient);
      }
    }

    // Didn't find any valid items to craft.
    return TargetProcessResult(
        progress: Progress.done(),
        action: null,
        description: 'Not enough ingredients to craft anything.',
        imageUrl: null);
  }

  TargetProcessResult performLevelUpGather(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    return GatheringSkillTarget(
            skillType: gatheringSkill,
            targetLevel: character.allSkills
                    .where((s) => s.skillType == gatheringSkill)
                    .first
                    .level +
                1)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
  }
}
