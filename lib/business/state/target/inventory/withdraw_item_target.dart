import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_withdraw_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class WithdrawItemTarget extends Target {
  final ItemQuantity quantityToMaintain;

  WithdrawItemTarget({required this.quantityToMaintain, required super.parentTarget});

  @override
  String get name => 'Deposit item in bank';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final currentAmount =
        character.inventory.items.count(code: quantityToMaintain.code);
    final amountToWithdraw = quantityToMaintain.quantity - currentAmount;
    final progress = amountToWithdraw <= 0
        ? Progress.done()
        : Progress(current: 0, target: amountToWithdraw.toDouble());

    // Already done?
    if (progress.finished) {
      return TargetProcessResult(
        progress: progress,
        action: null,
        description: 'No items to withdraw',
        imageUrl: boardState.items.itemByCode(quantityToMaintain.code).imageUrl,
      );
    }

    // Move to bank.
    final bankLocation = boardState
        .contentLocations[Content(type: ContentType.bank, code: 'bank')]?.first;
    if (bankLocation == null) {
      throw ArtifactsException(errorMessage: 'Unable to find bank to move to');
    }
    final moveAction = MoveToTarget(targetLocation: bankLocation, parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!moveAction.progress.finished) {
      return moveAction;
    }

    // Withdraw the item.
    final quantityToWithdraw =
        ItemQuantity(code: quantityToMaintain.code, quantity: amountToWithdraw);
    return TargetProcessResult(
      progress: progress,
      action: artifactsClient.withdrawBank(
          action: ActionWithdrawBank(
              characterName: character.name, itemQuantity: quantityToWithdraw)),
      description: 'Withdrawing $quantityToWithdraw',
      imageUrl: boardState.items.itemByCode(quantityToMaintain.code).imageUrl,
    );
  }
}
