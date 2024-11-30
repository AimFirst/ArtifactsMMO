import 'package:equatable/equatable.dart';

class OpenOrder with EquatableMixin {
  final String orderId;
  final String seller;
  final String itemCode;
  final int price;
  final DateTime createdAt;

  OpenOrder({
    required this.orderId,
    required this.seller,
    required this.itemCode,
    required this.price,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        orderId,
        seller,
        itemCode,
        price,
        createdAt,
      ];
}
