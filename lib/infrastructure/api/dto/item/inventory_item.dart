import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class InventoryItem with EquatableMixin {
  final int slot;
  final ItemQuantity itemQuantity;

  InventoryItem({required this.slot, required this.itemQuantity,});

  @override
  List<Object?> get props => [slot, itemQuantity];
}