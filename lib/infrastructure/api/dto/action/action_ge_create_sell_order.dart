import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class ActionGECreateSellOrderResponse extends ActionResponse {
  final OrderCreation order;

  ActionGECreateSellOrderResponse({
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

class ActionGECreateSellOrder extends Action {
  final ItemQuantity itemQuantity;
  final int price;

  ActionGECreateSellOrder({
    required this.itemQuantity,
    required this.price,
    required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
        price,
      ];
}

class OrderCreation with EquatableMixin {
  final String id;
  final DateTime createdAt;
  final ItemQuantity itemQuantity;
  final int price;
  final int totalPrice;
  final int tax;

  OrderCreation({
    required this.id,
    required this.createdAt,
    required this.itemQuantity,
    required this.price,
    required this.totalPrice,
    required this.tax,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        itemQuantity,
        price,
        totalPrice,
        tax,
      ];
}
