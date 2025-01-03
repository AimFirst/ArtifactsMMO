import 'package:artifacts_mmo/business/state/board/monster_manager.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_item_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_level_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/item_full_quantity.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/business/util/fight_calculator.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:equatable/equatable.dart';

class FightingRole extends Role {
  FightingRole({required super.characterLog});

  @override
  RoleType get roleType => RoleType.fighting;

  @override
  List<UniqueItemQuantityRequest> bestEquipment({
    required BoardState boardState,
    required Character character,
  }) {
    List<UniqueItemQuantityRequest> desiredItems = [];
    final fightingLevel = character.overall.level;
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.weapon, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:weapon:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.boots, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:boots:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.helmet, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:helmet:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.shield, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:shield:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.ring, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:ring:${i.code}',
                item: i,
                quantityRemaining: 2,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.legArmor, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:leg_armor:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.bodyArmor, fightingLevel).map(
            (i) => UniqueItemQuantityRequest(
                key: '${character.name}:body_armor:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.amulet, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:amulet:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.amulet, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:amulet:${i.code}',
                item: i,
                quantityRemaining: 1,
                totalQuantity: 1,
                requestingCharacter: character.name)));
    return desiredItems;
  }

  @override
  TargetProcessResult defaultIdle({
    required BoardState boardState,
    required Character character,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
    required CharacterItemAcquirerSoon characterItemAcquirer,
  }) {
    return FightLevelTarget(
            level: 40, parentTarget: parentTarget, characterLog: characterLog)
        .update(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
  }

  @override
  List<InventoryItemConstraints> desiredConsumables(
      {required BoardState boardState, required Character character}) {
    return [
      InventoryItemConstraints(
          code: 'small_health_potion',
          min: 10,
          max: 20,
          overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(
          code: 'minor_health_potion',
          min: 10,
          max: 20,
          overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(
          code: 'earth_boost_potion',
          min: 1,
          max: 3,
          overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(
          code: 'air_boost_potion',
          min: 1,
          max: 3,
          overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(
          code: 'fire_boost_potion',
          min: 1,
          max: 3,
          overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(
          code: 'water_boost_potion',
          min: 1,
          max: 3,
          overflowSolution: InventoryOverflowSolution.deposit),
    ];
  }

  @override
  ProvideResult canProvideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) {
    var quantityNeeded = itemQuantity.quantity;

    // Can we fight for it?
    final monsters =
        boardState.monsters.monstersThatProvideItem(code: itemQuantity.code);
    final monster = monsters
        .where((m) => canDefeatMonster(
            monster: m, character: character, boardState: boardState))
        .firstOrNull;
    if (monster != null) {
      return ProvideResult(
        providable: Providable.canProvideSoon,
        neededDependencies: [],
        provideMethod: ProvideMethod.fight,
        countNeededAfterThis: 0,
      );
    }

    return ProvideResult(
      providable: Providable.cannotProvide,
      neededDependencies: [],
      provideMethod: ProvideMethod.unknown,
      countNeededAfterThis: quantityNeeded,
    );
  }

  bool canDefeatMonster({
    required Monster monster,
    required Character character,
    required BoardState boardState,
  }) {
    return monster.level <= character.overall.level - 10;
  }

  @override
  TargetProcessResult provideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    final canProvide = canProvideItem(
      boardState: boardState,
      character: character,
      itemQuantity: itemQuantity,
    );

    final item = boardState.items.itemByCode(itemQuantity.code);
    if (canProvide.providable == Providable.cannotProvide) {
      return TargetProcessResult.noAction(
          description: 'No way to provide ${item.name}');
    }

    switch (canProvide.provideMethod) {
      case ProvideMethod.fight:
        return FightItemTarget(
          itemQuantity: itemQuantity,
          parentTarget: parentTarget,
          characterLog: characterLog,
        ).update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
      case ProvideMethod.bankDeposit:
      case ProvideMethod.bankWithdraw:
      case ProvideMethod.inventory:
      case ProvideMethod.craft:
      case ProvideMethod.gather:
      case ProvideMethod.unknown:
        return TargetProcessResult.noAction(
          description:
              'Expected type of ${ProvideMethod.fight} but got ${canProvide.provideMethod}',
        );
    }
  }

  final optimalMonsterLoadouts = <String, EquipmentLoadout>{};

  // TargetProcessResult _optimizeEquipment({
  //   required BoardState boardState,
  //   required Character character,
  //   required ArtifactsClient artifactsClient,
  //   required Monster monster,
  //   required Target? parentTarget,
  // }) {
  //   // Find our optimal loadout for this monster.
  //   var optimalLoadout = optimalMonsterLoadouts[monster.code] ??
  //       _optimalLoadout(
  //         boardState: boardState,
  //         character: character,
  //         monster: monster,
  //       );
  //   optimalMonsterLoadouts[monster.code] = optimalLoadout;
  //
  //   return TargetProcessResult.noAction();
  // }

  // EquipmentLoadout _optimalLoadout({
  //   required BoardState boardState,
  //   required Character character,
  //   required Monster monster,
  // }) {
  //   final allPossibleItems = character.inventory.items
  //       .map((i) => ItemFullQuantity(
  //           item: boardState.items.itemByCode(i.code), quantity: i.quantity))
  //       .toList();
  //   character.equipmentLoadout.equipmentSlots.forEach((k, v) {
  //     if (v.itemCode != null) {
  //       allPossibleItems.add(ItemFullQuantity(
  //           item: boardState.items.itemByCode(v.itemCode!),
  //           quantity: v.quantity));
  //     }
  //   });
  //
  //   EquipmentLoadout equipmentLoadout = EquipmentLoadout.empty();
  //
  //   final slotOptions = <EquipmentSlot, List<ItemFullQuantity>>{};
  //
  //   for (final slot in EquipmentSlot.values) {
  //     slotOptions[slot] = _options(allOptions: allPossibleItems, itemType: slot.acceptedItemType);
  //   }
  // }

  // OptimalLoadoutResult _tryAllLoadoutOptions({required Map<EquipmentSlot, List<ItemFullQuantity>> slotOptions, required EquipmentLoadout currentLoadout, required int slotIndex}) {
  //   final keys = slotOptions.keys.toList();
  //   final thisSlot = keys[slotIndex];
  //   final values = slotOptions[thisSlot];
  //   for (final val in values!) {
  //     currentLoadout.
  //   }
  // }

  List<ItemFullQuantity> _options({required List<ItemFullQuantity> allOptions, required ItemType itemType}) {
    return [ItemFullQuantity(item: Item.blank(type: itemType), quantity: 1), ...allOptions.where((i) => i.item.type == itemType)];
  }

// List<Item> weaponOptions({required BoardState boardState, required Character character,}) {
//   final allOptions = character.inventory.items.map((i) => boardState.items.itemByCode(i.code)).where((i) => i.type == ItemType.weapon).toList();
//   if (character.equipmentLoadout.weapon.itemCode != null) {
//     allOptions.add(boardState.items.itemByCode(character.equipmentLoadout.weapon.itemCode!));
//   }
// }
}

class OptimalLoadoutResult with EquatableMixin {
  final EquipmentLoadout loadout;
  final FightPrediction result;

  OptimalLoadoutResult({required this.loadout, required this.result});

  @override
  List<Object?> get props => [loadout, result];
}
