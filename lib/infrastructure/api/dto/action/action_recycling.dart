import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionRecyclingResponse extends ActionResponse {
  final List<ItemQuantity> returnedItems;

  ActionRecyclingResponse({
    required super.cooldown,
    required super.character,
    required this.returnedItems,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        returnedItems,
      ];
}

class ActionRecycling extends Action {
  final ItemQuantity itemQuantity;

  ActionRecycling({
    required this.itemQuantity, required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
