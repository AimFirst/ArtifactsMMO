import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_level_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_crafting.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
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

    // Craft it.
    return TargetProcessResult(
      progress: progress,
      action: artifactsClient.craft(
          action: ActionCrafting(
              itemQuantity: ItemQuantity(
                  code: item.code,
                  quantity:
                      progress.target.round() - progress.current.round()))),
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
