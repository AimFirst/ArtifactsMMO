import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_equip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_unequip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';

class EquipItemTarget extends Target {
  final QuantityEquipmentSlot equipmentSlot;

  EquipItemTarget({required this.equipmentSlot});

  @override
  String get name => 'Equipping ${equipmentSlot.itemCode}';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final current =
        character.equipmentLoadout.equipmentSlots[equipmentSlot.equipmentSlot];

    final currentItem = current?.itemCode == null
        ? boardState.items.itemByCode(current!.itemCode!)
        : null;
    final targetItem = equipmentSlot.itemCode == null
        ? boardState.items.itemByCode(equipmentSlot.itemCode!)
        : null;

    // Is the right item already equipped?
    if (equipmentSlot.itemCode == current?.itemCode) {
      return TargetProcessResult(
        progress: Progress.done(),
        action: null,
        description:
            'Done equipping ${targetItem?.imageUrl ?? equipmentSlot.itemCode}',
        imageUrl: targetItem?.imageUrl,
      );
    }

    // Do we need to un equip first?
    if (current != null) {
      return TargetProcessResult(
        progress: Progress(current: 0, target: current.quantity.toDouble()),
        action: artifactsClient.unequipItem(
            action: ActionUnequipItem(
                slot: current.equipmentSlot,
                quantity: current.quantity,
                characterName: character.name)),
        description: 'Unequipping ${currentItem?.name ?? current.itemCode}',
        imageUrl: currentItem?.imageUrl,
      );
    }

    // Equip item
    return TargetProcessResult(
      progress: Progress(current: 0, target: equipmentSlot.quantity.toDouble()),
      action: artifactsClient.equipItem(
          action: ActionEquipItem(
              code: equipmentSlot.itemCode ?? '',
              slot: equipmentSlot.equipmentSlot,
              quantity: equipmentSlot.quantity,
              characterName: character.name)),
      description: 'Equipping ${equipmentSlot.itemCode}',
      imageUrl: targetItem?.imageUrl,
    );
  }
}
