import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';

class ActionUnequipItemResponse extends ActionResponse {
  final EquipmentSlot slot;
  final Item item;

  ActionUnequipItemResponse({
    required super.cooldown,
    required super.character,
    required this.slot,
    required this.item,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        slot,
        item,
      ];
}

class ActionUnequipItem extends Action {
  final EquipmentSlot slot;
  final int quantity;

  ActionUnequipItem({
    required this.slot,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        slot,
        quantity,
      ];
}
