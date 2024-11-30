import 'package:equatable/equatable.dart';

class PastOrder with EquatableMixin {
  final String orderId;
  final String seller;
  final String buyer;
  final String itemCode;
  final int quantity;
  final int price;
  final DateTime soldAt;

  PastOrder({
    required this.orderId,
    required this.seller,
    required this.buyer,
    required this.itemCode,
    required this.quantity,
    required this.price,
    required this.soldAt,
  });

  @override
  List<Object?> get props => [
        orderId,
        seller,
        buyer,
        itemCode,
        quantity,
        price,
        soldAt,
      ];
}
