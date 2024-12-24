import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'item_full_quantity.g.dart';

@CopyWith()
class ItemFullQuantity with EquatableMixin {
  final Item item;
  final int quantity;

  ItemFullQuantity({required this.item, required this.quantity});

  @override
  List<Object?> get props => [item, quantity];

  ItemQuantity get itemQuantity => ItemQuantity(code: item.code, quantity: quantity);
}
