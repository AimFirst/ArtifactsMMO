import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_level_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_item_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_skill_target.dart';
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
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

abstract class SkillBasedRole extends Role {
  SkillType get skillType;

  @override
  Providable canGetItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
  }) {
    // Is it a harvestable resource for our skill?
    final harvestable = canHarvestItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity);
    if (harvestable != Providable.cannotProvide) {
      return harvestable;
    }

    // Is it a craftable resource for our skill?
    final craftable = canCraftItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity);
    if (craftable != Providable.cannotProvide) {
      return craftable;
    }

    // Don't know any other way to get it.
    return Providable.cannotProvide;
  }

  Providable canHarvestItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
  }) {
    if (itemQuantity.item.type == ItemType.resource &&
        itemQuantity.item.subType == skillType.itemSubtype) {
      return itemQuantity.item.level <=
              character.allSkills
                  .where((s) => s.skillType == skillType)
                  .first
                  .level
          ? Providable.canProvideSoon
          : Providable.canProvideEventually;
    }

    return Providable.cannotProvide;
  }

  Providable canCraftItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
  }) {
    if (itemQuantity.item.craft?.skill == skillType) {
      return (itemQuantity.item.craft?.level ?? 0) <=
              character.allSkills
                  .where((s) => s.skillType == skillType)
                  .first
                  .level
          ? Providable.canProvideSoon
          : Providable.canProvideEventually;
    }

    return Providable.cannotProvide;
  }

  @override
  TargetProcessResult defaultIdle(
      {required BoardState boardState,
      required Character character,
      required ArtifactsClient artifactsClient,
      required Target? parentTarget}) {
    final craftTarget = _defaultCraftIdle(
        boardState: boardState,
        character: character,
        artifactsClient: artifactsClient,
        parentTarget: parentTarget);
    if (!craftTarget.progress.finished) {
      return craftTarget;
    }

    return GatheringSkillTarget(
      skillType: skillType,
      targetLevel: 40,
      parentTarget: parentTarget,
    ).update(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
  }

  TargetProcessResult _defaultCraftIdle(
      {required BoardState boardState,
      required Character character,
      required ArtifactsClient artifactsClient,
      required Target? parentTarget}) {
    final options = boardState.items
        .itemsByCraftType(skillType)
        .where((i) =>
            (i.craft?.level ?? 99) <= character.skillByType(skillType).level)
        .toList();
    options.sort((a, b) => b.level - a.level);

    // Can we craft one of them?
    for (final item in options) {
      // Can we craft it?
      Providable providability = Providable.canProvideImmediately;
      for (final ingredient in item.craft?.items ?? []) {
        final item = boardState.items.itemByCode(ingredient.code);
        // Don't use rare resources
        if (item.subType == ItemSubType.task) {
          providability = Providable.cannotProvide;
          break;
        }

        // How soon can we provide it?
        final ingredientProvidability = hasItem(
            boardState: boardState,
            character: character,
            itemQuantity: ingredient);
        if (ingredientProvidability > providability) {
          providability = ingredientProvidability;
        }
      }

      if (providability <= Providable.canProvideSoon) {
        return CraftItemTarget(
          itemQuantity: ItemQuantity(code: item.code, quantity: 1),
          parentTarget: parentTarget,
        ).update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
      }
    }

    return CraftLevelTarget(
            skillType: skillType, targetLevel: 40, parentTarget: parentTarget)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
  }

  bool canCraft({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) {
    final item = boardState.items.itemByCode(itemQuantity.code);
    return item.craft == null ? false : (item.craft?.level ?? 99) <=
        character.skillByType(item.craft?.skill ?? SkillType.unknown).level;
  }

  Providable hasItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) {
    var quantityNeeded = itemQuantity.quantity;
    // In our inventory?
    final quantityInInventory =
        character.inventory.items.count(code: itemQuantity.code);
    quantityNeeded -= quantityInInventory;
    if (quantityNeeded <= 0) {
      return Providable.canProvideImmediately;
    }

    // In the bank?
    final quantityInBank = boardState.bank.items.count(code: itemQuantity.code);
    quantityNeeded -= quantityInBank;
    if (quantityNeeded <= 0) {
      return Providable.canProvideSoon;
    }

    // Can we gather it?
    final gatherOptions = boardState.dropsFromResources[Content(
      type: ContentType.item,
      code: itemQuantity.code,
    )];
    final canGather = gatherOptions?.any(
            (g) => character.skillByType(g.skillType).level >= g.skillLevel) ??
        false;
    if (canGather) {
      return Providable.canProvideSoon;
    }

    // Can we fight for it?
    final fightOptions = boardState.dropsFromMonsters[Content(
      type: ContentType.item,
      code: itemQuantity.code,
    )];
    final canFight = fightOptions
            ?.any((f) => canWinFight(character: character, monster: f)) ??
        false;
    if (canFight) {
      return Providable.canProvideSoon;
    }

    // Can we craft it?
    final canCraftIt = canCraft(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity);
    if (canCraftIt) {
      return Providable.canProvideSoon;
    }

    // No clear path to provide it right now
    return Providable.cannotProvide;
  }

  bool canWinFight({
    required Character character,
    required Monster monster,
  }) {
    return monster.level < character.overall.level - 5;
  }

  @override
  List<InventoryItemConstraints> desiredConsumables(
      {required BoardState boardState, required Character character}) {
    return [];
  }

  @override
  List<UniqueItemQuantityRequest> bestEquipment({
    required BoardState boardState,
    required Character character,
  }) {
    return boardState.items
        .itemsByTypeAndSubType(ItemType.weapon, ItemSubType.tool)
        .where((i) =>
            i.effects.fold(
              0,
              (o, e) =>
                  o +
                  (e.effectType == skillType.effectType && e.value < 0 ? 1 : 0),
            ) >
            0)
        .map((i) => UniqueItemQuantityRequest(
            key: '${character.name}:tool:${i.code}',
            item: i,
            quantity: 1,
            requestingCharacter: character.name))
        .toList();
  }

  @override
  TargetProcessResult getItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    // Is it a harvestable resource for our skill?
    final harvestable = canHarvestItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity);
    if (harvestable != Providable.cannotProvide) {
      return harvestItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity,
        artifactsClient: artifactsClient,
        parentTarget: parentTarget,
      );
    }

    // Is it a craftable resource for our skill?
    final craftable = canCraftItem(
        boardState: boardState,
        character: character,
        itemQuantity: itemQuantity);
    if (craftable != Providable.cannotProvide) {
      return craftItem(
          boardState: boardState,
          character: character,
          itemQuantity: itemQuantity,
          artifactsClient: artifactsClient,
          parentTarget: parentTarget);
    }

    return TargetProcessResult(
      progress: Progress.done(),
      action: null,
      description: 'Cannot get ${itemQuantity.item.name}',
      imageUrl: itemQuantity.item.imageUrl,
    );
  }

  TargetProcessResult harvestItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    return GatheringItemTarget(
            targetItemQuantity: itemQuantity.itemQuantity,
            parentTarget: parentTarget)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
  }

  TargetProcessResult craftItem({
    required BoardState boardState,
    required Character character,
    required ItemFullQuantity itemQuantity,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
  }) {
    return CraftItemTarget(
            itemQuantity: itemQuantity.itemQuantity, parentTarget: parentTarget)
        .update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
  }
}
