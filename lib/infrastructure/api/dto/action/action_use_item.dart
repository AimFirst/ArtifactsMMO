import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionUseItemResponse extends ActionResponse {
  final Item item;

  ActionUseItemResponse({
    required super.cooldown,
    required super.character,
    required this.item,
  });

  @override
  List<Object?> get props => [...super.props, item];
}

class ActionUseItem extends Action {
  final ItemQuantity itemQuantity;

  ActionUseItem({
    required this.itemQuantity, required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
