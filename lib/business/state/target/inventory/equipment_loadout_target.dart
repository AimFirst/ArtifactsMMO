import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/inventory/withdraw_item_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_equip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_unequip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class EquipmentLoadoutTarget extends Target {
  final EquipmentLoadout targetLoadout;

  EquipmentLoadoutTarget({
    required this.targetLoadout,
    required super.parentTarget,
    required super.characterLog,
  });

  @override
  String get name => 'Equipment Loadout';

  @override
  TargetProcessResult update({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  }) {
    // Are we already done.
    final progress = _getProgress(character: character, boardState: boardState);
    if (progress.finished) {
      return TargetProcessResult.noAction();
    }

    for (final slot in EquipmentSlot.values) {
      final currentSlot = character.equipmentLoadout.equipmentSlots[slot];
      final targetSlot = targetLoadout.equipmentSlots[slot];

      // Items are the same, no need to do anything with this.
      if (targetSlot?.itemCode == currentSlot?.itemCode || (targetSlot!.itemCode ?? '').isEmpty && currentSlot?.itemCode == null) {
        continue;
      }

      // Do we need to unequip something?
      if (currentSlot?.itemCode != null && currentSlot!.itemCode!.isNotEmpty) {
        final currentItem = boardState.items.itemByCode(currentSlot!.itemCode!);
        return TargetProcessResult(
          progress: progress,
          action: artifactsClient.unequipItem(
              action: ActionUnequipItem(
                  slot: slot,
                  quantity: currentSlot?.quantity ?? 1,
                  characterName: character.name)),
          description: 'Unequiping ${currentItem.name}',
          imageUrl: currentItem.imageUrl,
        );
      } else if (targetSlot.itemCode != null && character.inventory.items.count(code: targetSlot.itemCode!) >=
          targetSlot.quantity) {
        // Equip it?
        final targetItem = boardState.items.itemByCode(targetSlot.itemCode!);
        return TargetProcessResult(
          progress: progress,
          action: artifactsClient.equipItem(
              action: ActionEquipItem(
            code: targetSlot.itemCode!,
            slot: slot,
            quantity: targetSlot.quantity,
            characterName: character.name,
          )),
          description: 'Equipping ${targetItem.name}',
          imageUrl: targetItem.imageUrl,
        );
      } else if (targetSlot.itemCode != null && boardState.bank.items.count(code: targetSlot.itemCode!) >=
          targetSlot.quantity) {
        // Need to acquire it from the bank?
        return WithdrawItemTarget(
                quantityToMaintain: ItemQuantity(
                    code: targetSlot.itemCode!, quantity: targetSlot.quantity),
                parentTarget: parentTarget,
                characterLog: characterLog)
            .update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient,
        );
      }
    }

    return TargetProcessResult.noAction();
  }

  Progress _getProgress({
    required Character character,
    required BoardState boardState,
  }) {
    if (character.equipmentLoadout == targetLoadout) {
      return Progress(current: 1.0, target: 1.0);
    }
    return Progress(current: 0.0, target: 1.0);
  }
}
