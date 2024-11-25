import 'package:artifacts_mmo/infrastructure/api/dto/inventory_item.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';

sealed class InventoryModel implements BaseModel {}

class InventoryModelLoading with EquatableMixin implements InventoryModel {
  @override
  List<Object?> get props => [];

}

class InventoryModelError with EquatableMixin implements InventoryModel {
  final String error;

  InventoryModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

class InventoryModelLoaded with EquatableMixin implements InventoryModel {
  final List<InventoryItem> items;

  InventoryModelLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}
