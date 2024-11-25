import 'package:equatable/equatable.dart';

class InventoryItem with EquatableMixin {
  final int slot;
  final String code;
  final int quantity;

  InventoryItem({required this.slot, required this.code, required this.quantity,});

  @override
  List<Object?> get props => [slot, code, quantity];
}