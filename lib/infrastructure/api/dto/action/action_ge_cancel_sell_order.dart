import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/order_transaction.dart';

class ActionGECancelSellOrderResponse extends ActionResponse {
  final OrderTransaction order;

  ActionGECancelSellOrderResponse({
    required super.cooldown,
    required super.character,
    required this.order,
  });

  @override
  List<Object?> get props => [...super.props, order];
}

class ActionGECancelSellOrder extends Action {
  final String id;

  ActionGECancelSellOrder({
    required this.id,
  });

  @override
  List<Object?> get props => [...super.props, id];
}
