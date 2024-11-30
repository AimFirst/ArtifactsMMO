import 'package:equatable/equatable.dart';

class ItemQuantity with EquatableMixin {
  final String code;
  final int quantity;

  ItemQuantity({required this.code, required this.quantity});

  @override
  List<Object?> get props => [code, quantity];
}