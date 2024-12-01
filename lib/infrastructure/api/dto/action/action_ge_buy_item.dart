import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/order_transaction.dart';

class ActionGEBuyItemResponse extends ActionResponse {
  final OrderTransaction order;

  ActionGEBuyItemResponse({
    required super.cooldown,
    required super.character,
    required this.order,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        order,
      ];
}

class ActionGEBuyItem extends Action {
  final ItemQuantity itemQuantity;

  ActionGEBuyItem({
    required this.itemQuantity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
