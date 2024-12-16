import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_deposit_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class DepositItemTarget extends Target {
  final ItemQuantity quantityToRemain;

  DepositItemTarget({required this.quantityToRemain});

  @override
  String get name => 'Deposit item in bank';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final currentAmount =
        character.inventory.items.count(code: quantityToRemain.code);
    final amountToDeposit = currentAmount - quantityToRemain.quantity;
    final progress = amountToDeposit <= 0
        ? Progress.done()
        : Progress(current: 0, target: amountToDeposit.toDouble());

    // Already done?
    if (progress.finished) {
      return TargetProcessResult(
          progress: progress,
          action: null,
          description: 'No items to deposit',
          imageUrl:
              'https://artifactsmmo.com/images/items/${quantityToRemain.code}.png');
    }

    // Move to bank.
    final bankLocation = boardState
        .contentLocations[Content(type: ContentType.bank, code: 'bank')]?.first;
    if (bankLocation == null) {
      throw ArtifactsException(errorMessage: 'Unable to find bank to move to');
    }
    final moveAction = MoveToTarget(targetLocation: bankLocation).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!moveAction.progress.finished) {
      return moveAction;
    }

    // Deposit the item.
    final quantityToDeposit =
        ItemQuantity(code: quantityToRemain.code, quantity: amountToDeposit);
    return TargetProcessResult(
        progress: progress,
        action: artifactsClient.depositBank(
            action: ActionDepositBank(
                characterName: character.name,
                itemQuantity: quantityToDeposit)),
        description: 'Depositing $quantityToDeposit',
        imageUrl:
            'https://artifactsmmo.com/images/items/${quantityToRemain.code}.png');
  }
}
