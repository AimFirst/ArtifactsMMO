import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'item_quantity.g.dart';

@CopyWith()
class ItemQuantity with EquatableMixin {
  final String code;
  final int quantity;

  ItemQuantity({required this.code, required this.quantity});

  @override
  List<Object?> get props => [code, quantity];
}