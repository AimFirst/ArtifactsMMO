import 'package:artifacts_mmo/business/state/board/resource_manager.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_level_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_item_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_skill_target.dart';
import 'package:artifacts_mmo/business/state/target/inventory/mange_inventory_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/providability.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

abstract class SkillBasedRole extends Role {
  SkillBasedRole({required super.characterLog});

  SkillType get skillType;

  @override
  ProvideResult canProvideItem({
    required BoardState boardState,
    required Character character,
    required ItemQuantity itemQuantity,
  }) {
    final quantityNeeded = itemQuantity.quantity;

    // Can we gather it?
    final resources =
        boardState.resources.resourcesThatProvideItem(code: itemQuantity.code);
    if (resources
        .where((r) => r.skillLevel <= character.skillByType(skillType).level)
        .isNotEmpty) {
      return ProvideResult(
        providable: Providable.canProvideSoon,
        neededDependencies: [],
        provideMethod: ProvideMethod.gather,
        countNeededAfterThis: 0,
      );
    } else if (resources.isNotEmpty) {
      return ProvideResult(
        providable: Providable.canProvideEventually,
        neededDependencies: [],
        provideMethod: ProvideMethod.gather,
        countNeededAfterThis: 0,
      );
    }

    // Can we craft it?
    Item item = boardState.items.itemByCode(itemQuantity.code);
    if (item.craftable &&
        item.craft?.skill == skillType &&
        (item.craft?.level ?? 99) <= character.skillByType(skillType).level) {
      return ProvideResult(
        providable: Providable.canProvideSoon,
        neededDependencies: item.craft?.items
                .map((q) => q.copyWith(quantity: q.quantity * quantityNeeded))
                .toList() ??
            [],
        provideMethod: ProvideMethod.craft,
        countNeededAfterThis: 0,
      );
    }

    // No path to provide required items.
    return ProvideResult(
      providable: Providable.cannotProvide,
      neededDependencies: [],
      provideMethod: ProvideMethod.unknown,
      countNeededAfterThis: quantityNeeded,
    );
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
      characterLog.addLog('$roleType cannot provide $itemQuantity');
      return TargetProcessResult.noAction(
          description: 'No way to provide ${item.name}');
    }

    switch (canProvide.provideMethod) {
      case ProvideMethod.craft:
        characterLog
            .addLog('Providing $itemQuantity via ${canProvide.provideMethod}');
        return CraftItemTarget(
          itemQuantity: ItemQuantity(
            code: itemQuantity.code,
            quantity: character.inventory.items.count(
                  code: itemQuantity.code,
                ) +
                itemQuantity.quantity,
          ),
          parentTarget: parentTarget,
          characterLog: characterLog,
        ).update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
      case ProvideMethod.gather:
        characterLog
            .addLog('Providing $itemQuantity via ${canProvide.provideMethod}');
        return GatheringItemTarget(
          targetItemQuantity: itemQuantity,
          parentTarget: parentTarget,
          characterLog: characterLog,
        ).update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
      case ProvideMethod.unknown:
      case ProvideMethod.inventory:
      case ProvideMethod.bankWithdraw:
      case ProvideMethod.bankDeposit:
      case ProvideMethod.fight:
        characterLog.addLog(
            '$roleType unexpected provide type ${canProvide.provideMethod} for $itemQuantity');
        return TargetProcessResult.noAction();
    }
  }

  @override
  TargetProcessResult defaultIdle({
    required BoardState boardState,
    required Character character,
    required ArtifactsClient artifactsClient,
    required Target? parentTarget,
    required CharacterItemAcquirerSoon characterItemAcquirer,
  }) {
    // Can we work on our crafting level up?
    final options = boardState.items
        .itemsByCraftType(skillType)
        .where((i) =>
            (i.craft?.level ?? 99) <= character.skillByType(skillType).level)
        .toList();
    options.sort((a, b) => b.level - a.level);
    for (final option in options) {
      final itemQuantity = ItemQuantity(
        code: option.code,
        quantity: 1,
      );

      final acquireItem = characterItemAcquirer(
        artifactsClient: artifactsClient,
        boardState: boardState,
        character: character,
        parentTarget: parentTarget,
        itemQuantity: itemQuantity,
        canUseStock: false,
        allowRareIngredients: false,
      );
      if (!acquireItem.progress.finished) {
        characterLog.addLog('Idle attempting to craft ${option.name}');
        return acquireItem;
      }
    }

    characterLog.addLog('No craft options for $roleType, trying gathering');

    // Can we work on gathering?
    final gatherTarget = GatheringSkillTarget(
      skillType: skillType,
      targetLevel: Skill.maxSkillLevel,
      parentTarget: parentTarget,
      characterLog: characterLog,
    ).update(
      character: character,
      boardState: boardState,
      artifactsClient: artifactsClient,
    );
    if (!gatherTarget.progress.finished) {
      return gatherTarget;
    }

    // No target to work on.
    return TargetProcessResult.noAction();
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
    final itemsOfType = boardState.items
        .itemsByTypeAndSubType(ItemType.weapon, ItemSubType.tool);
    final skillTypeOptions = itemsOfType
        .where((i) =>
            i.effects.fold(
              0,
              (o, e) =>
                  o +
                  ((e.effectType == skillType.effectType && (e.value < 0))
                      ? 1
                      : 0),
            ) >
            0)
        .toList();
    final uniqueRequests = skillTypeOptions
        .map((i) => UniqueItemQuantityRequest(
            key: '${character.name}:tool:${i.code}',
            item: i,
            quantityRemaining: 1,
            totalQuantity: 1,
            requestingCharacter: character.name))
        .toList();
    return uniqueRequests;
  }
}
