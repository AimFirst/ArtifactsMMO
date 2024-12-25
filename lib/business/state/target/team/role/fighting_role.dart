import 'package:artifacts_mmo/business/state/board/monster_manager.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_level_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';

class FightingRole extends Role {

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
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.boots, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:boots:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.helmet, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:helmet:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.shield, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:shield:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.ring, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:ring:${i.code}',
                item: i,
                quantity: 2,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.legArmor, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:leg_armor:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.bodyArmor, fightingLevel).map(
            (i) => UniqueItemQuantityRequest(
                key: '${character.name}:body_armor:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.amulet, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:amulet:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    desiredItems.addAll(
        bestItems(boardState.items, ItemType.amulet, fightingLevel).map((i) =>
            UniqueItemQuantityRequest(
                key: '${character.name}:amulet:${i.code}',
                item: i,
                quantity: 1,
                requestingCharacter: character.name)));
    return desiredItems;
  }

  @override
  TargetProcessResult defaultIdle(
      {required BoardState boardState,
      required Character character,
      required ArtifactsClient artifactsClient,
      required Target? parentTarget}) {
    return FightLevelTarget(level: 40, parentTarget: parentTarget).update(
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
    required bool allowBank,
  }) {
    var quantityNeeded = itemQuantity.quantity;

    // Do we have it in the inventory?
    final inventoryCount =
        character.inventory.items.count(code: itemQuantity.code);
    quantityNeeded -= inventoryCount;
    if (quantityNeeded <= 0) {
      return ProvideResult(
        providable: Providable.canProvideImmediately,
        neededDependencies: [],
        provideMethod: ProvideMethod.inventory,
        countNeeded: itemQuantity.quantity,
      );
    }

    // Do we have it in the bank?
    if (allowBank) {
      final countNeededBeforeBank = quantityNeeded;
      final bankCount = boardState.bank.items.count(code: itemQuantity.code);
      quantityNeeded -= bankCount;
      if (quantityNeeded <= 0) {
        return ProvideResult(
          providable: Providable.canProvideSoon,
          neededDependencies: [],
          provideMethod: ProvideMethod.bank,
          countNeeded: countNeededBeforeBank,
        );
      }
    }

    // Can we fight for it?
    final monsters =
        boardState.monsters.monstersThatProvideItem(code: itemQuantity.code);
    final monster = monsters
        .where((m) => canDefaultMonster(
            monster: m, character: character, boardState: boardState))
        .firstOrNull;
    if (monster != null) {
      return ProvideResult(
        providable: Providable.canProvideSoon,
        neededDependencies: [],
        provideMethod: ProvideMethod.fight,
        countNeeded: quantityNeeded,
      );
    }

    return ProvideResult(
      providable: Providable.cannotProvide,
      neededDependencies: [],
      provideMethod: ProvideMethod.unknown,
      countNeeded: quantityNeeded,
    );
  }

  bool canDefaultMonster({
    required Monster monster,
    required Character character,
    required BoardState boardState,
  }) {
    return monster.level <= character.overall.level - 10;
  }
}
