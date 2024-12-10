import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionDeleteItemResponse extends ActionResponse {
  final ItemQuantity itemQuantity;

  ActionDeleteItemResponse({
    required super.cooldown,
    required super.character,
    required this.itemQuantity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}

class ActionDeleteItem extends Action {
  final ItemQuantity itemQuantity;

  ActionDeleteItem({
    required this.itemQuantity, required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
