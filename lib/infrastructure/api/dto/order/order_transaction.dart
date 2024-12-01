import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class OrderTransaction with EquatableMixin {
  final String id;
  final ItemQuantity itemQuantity;
  final int price;
  final int totalPrice;

  OrderTransaction({
    required this.id,
    required this.itemQuantity,
    required this.price,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [
        id,
        itemQuantity,
        price,
        totalPrice,
      ];
}
