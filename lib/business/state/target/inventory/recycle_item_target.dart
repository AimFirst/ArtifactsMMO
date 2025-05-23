import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/util/math.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_recycling.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class RecycleItemTarget extends Target {
  final ItemQuantity quantityToMaintain;

  RecycleItemTarget({
    required this.quantityToMaintain, required super.parentTarget, required super.characterLog,
  });

  @override
  String get name => 'Recycle item target';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final currentAmount =
        character.inventory.items.count(code: quantityToMaintain.code);
    final amountToRecycle = currentAmount - quantityToMaintain.quantity;
    final progress = amountToRecycle <= 0
        ? Progress(current: 1, target: 1)
        : Progress(current: 0, target: amountToRecycle.toDouble());

    final item = boardState.items.itemByCode(quantityToMaintain.code);

    if (progress.finished) {
      return TargetProcessResult(
        progress: progress,
        action: null,
        description: 'Finished recycling $quantityToMaintain',
        imageUrl: item.imageUrl,
      );
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
    workshopLocations
        .sort((a, b) => MathUtil.sortDistance(character.location, a, b));
    final location = workshopLocations.first;
    final moveAction = MoveToTarget(targetLocation: location, parentTarget: this, characterLog: characterLog).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!moveAction.progress.finished) {
      return moveAction;
    }

    // Recycle it
    return TargetProcessResult(
      progress: progress,
      action: artifactsClient.recycle(
        action: ActionRecycling(
          characterName: character.name,
          itemQuantity: ItemQuantity(
            code: quantityToMaintain.code,
            quantity: amountToRecycle,
          ),
        ),
      ),
      description: 'Recycling $quantityToMaintain',
      imageUrl: boardState.items.itemByCode(quantityToMaintain.code).imageUrl,
    );
  }
}
