import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class TaskReward with EquatableMixin {
  final List<ItemQuantity> items;
  final int gold;

  TaskReward({required this.items, required this.gold});

  @override
  List<Object?> get props => [items, gold];
}