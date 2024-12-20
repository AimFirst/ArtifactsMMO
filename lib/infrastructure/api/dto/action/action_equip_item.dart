import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';

class ActionEquipItemResponse extends ActionResponse {
  final EquipmentSlot slot;
  final Item item;

  ActionEquipItemResponse({
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

class ActionEquipItem extends Action {
  final String code;
  final EquipmentSlot slot;
  final int quantity;

  ActionEquipItem({
    required this.code,
    required this.slot,
    required this.quantity,
    required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        code,
        slot,
        quantity,
      ];
}
