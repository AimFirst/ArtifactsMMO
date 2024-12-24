import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_item_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_level_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/item_full_quantity.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';

class FightingRole extends Role {
  @override
  Providable canGetItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
  }) {
    final monstersThatDrop = boardState.dropsFromMonsters[
            Content(type: ContentType.item, code: itemQuantity.item.code)] ??
        [];
    monstersThatDrop.sort((a, b) => a.level - b.level);
    if (monstersThatDrop.isNotEmpty) {
      return monstersThatDrop.first.level <= character.overall.level
          ? Providable.canProvideSoon
          : Providable.canProvideEventually;
    }

    return Providable.cannotProvide;
  }

  @override
  TargetProcessResult getItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    if (canGetItem(
            boardState: boardState,
            character: character,
            itemQuantity: itemQuantity) ==
        Providable.cannotProvide) {
      return TargetProcessResult(
        progress: Progress.done(),
        action: null,
        description: 'Cannot get ${itemQuantity.item.name}',
        imageUrl: itemQuantity.item.imageUrl,
      );
    }

    return FightItemTarget(
            itemQuantity: itemQuantity.itemQuantity, parentTarget: parentTarget)
        .update(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
  }

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
      InventoryItemConstraints(code: 'small_health_potion', min: 10, max: 20, overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(code: 'minor_health_potion', min: 10, max: 20, overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(code: 'earth_boost_potion', min: 1, max: 3, overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(code: 'air_boost_potion', min: 1, max: 3, overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(code: 'fire_boost_potion', min: 1, max: 3, overflowSolution: InventoryOverflowSolution.deposit),
      InventoryItemConstraints(code: 'water_boost_potion', min: 1, max: 3, overflowSolution: InventoryOverflowSolution.deposit),
    ];
  }
}
