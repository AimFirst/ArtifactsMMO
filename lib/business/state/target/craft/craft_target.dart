import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_item_target.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_level_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_item_target.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_item_target.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/util/math.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_crafting.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

abstract class CraftTarget extends Target {
  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final progress = getProgress(
      character: character,
      boardState: boardState,
    );
    final item = getItemCraft(character: character, boardState: boardState);
    if (progress.finished) {
      return TargetProcessResult(
          progress: progress,
          action: null,
          description: 'Finished Craft Target',
          imageUrl: 'https://artifactsmmo.com/images/items/${item.code}.png');
    }

    if (item.craft == null) {
      throw ArtifactsException(errorMessage: 'No craft for $item');
    }

    // See if we have the required level.
    if ((item.craft?.level ?? 1) >
        character.allSkills
            .firstWhere((s) => s.skillType == item.craft!.skill)
            .level) {
      return CraftLevelTarget(
        skillType: item.craft!.skill!,
        targetLevel: item.craft!.level!,
      ).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient,
      );
    }

    // See if we have the right ingredients.
    for (final craftIngredient in item.craft?.items ?? []) {
      if (character.inventoryItems.fold(
              0,
              (c, i) => i.itemQuantity.code == craftIngredient.code
                  ? c + i.itemQuantity.quantity
                  : c) <
          craftIngredient.quantity) {
        // Can we get it from resources?
        final resources = boardState.dropsFromResources[
                Content(type: ContentType.item, code: craftIngredient.code)] ??
            [];
        if (resources.isNotEmpty) {
          return GatheringItemTarget(
                  targetItemQuantity: ItemQuantity(
                      code: craftIngredient.code,
                      quantity: craftIngredient.quantity))
              .update(
                  character: character,
                  boardState: boardState,
                  artifactsClient: artifactsClient);
        }

        // Can we fight for it?
        final monsterDrop = boardState.dropsFromMonsters[
                Content(type: ContentType.item, code: craftIngredient.code)] ??
            [];
        if (monsterDrop.isNotEmpty) {
          return FightItemTarget(
                  itemQuantity: ItemQuantity(
                      code: craftIngredient.code,
                      quantity: craftIngredient.quantity))
              .update(
                  character: character,
                  boardState: boardState,
                  artifactsClient: artifactsClient);
        }

        // Can we craft it?
        final craftItem = boardState.items
            .where((i) => i.code == craftIngredient.code)
            .firstOrNull;
        if (craftItem != null) {
          if (craftItem.craft != null) {
            return CraftItemTarget(
                    itemQuantity: ItemQuantity(
                        code: craftIngredient.code,
                        quantity: craftIngredient.quantity))
                .update(
                    character: character,
                    boardState: boardState,
                    artifactsClient: artifactsClient);
          }
        }

        throw ArtifactsException(
            errorMessage: 'Unable to find way to acquire $craftIngredient');
      }
    }

    // Find the right workshop.
    final workshopLocations = boardState.contentLocations[Content(
        type: ContentType.workshop,
        code: item.craft!.skill!.name.toLowerCase())];
    if (workshopLocations == null || workshopLocations.isEmpty) {
      throw ArtifactsException(
          errorMessage: 'Failed to find workshop for ${item.craft!.skill!}');
    }

    // Move to the workshop if we're not there.
    workshopLocations.sort(MathUtil.sortDistance);
    final location = workshopLocations.first;
    final moveAction = MoveToTarget(targetLocation: location).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!moveAction.progress.finished) {
      return moveAction;
    }

    // Craft it.
    return TargetProcessResult(
      progress: progress,
      action: artifactsClient.craft(
          action: ActionCrafting(
              itemQuantity: ItemQuantity(
        code: item.code,
        quantity: 1,
        //quantity: progress.target.round() - progress.current.round(),
      ))),
      description: 'Crafting $item',
      imageUrl: 'https://artifactsmmo.com/images/items/${item.code}.png',
    );
  }

  Item getItemCraft({
    required Character character,
    required BoardState boardState,
  });

  Progress getProgress({
    required Character character,
    required BoardState boardState,
  });
}
