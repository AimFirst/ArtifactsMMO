import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class Inventory with EquatableMixin {
  final int maxCount;
  final List<ItemQuantity> items;

  Inventory({required this.maxCount, required this.items});

  Inventory.empty()
      : maxCount = 1,
        items = [];

  @override
  List<Object?> get props => [maxCount, items];
}
