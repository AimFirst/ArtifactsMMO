// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_full_quantity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemFullQuantityCWProxy {
  ItemFullQuantity item(Item item);

  ItemFullQuantity quantity(int quantity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemFullQuantity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemFullQuantity(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemFullQuantity call({
    Item item,
    int quantity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemFullQuantity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemFullQuantity.copyWith.fieldName(...)`
class _$ItemFullQuantityCWProxyImpl implements _$ItemFullQuantityCWProxy {
  const _$ItemFullQuantityCWProxyImpl(this._value);

  final ItemFullQuantity _value;

  @override
  ItemFullQuantity item(Item item) => this(item: item);

  @override
  ItemFullQuantity quantity(int quantity) => this(quantity: quantity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemFullQuantity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemFullQuantity(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemFullQuantity call({
    Object? item = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
  }) {
    return ItemFullQuantity(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as Item,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int,
    );
  }
}

extension $ItemFullQuantityCopyWith on ItemFullQuantity {
  /// Returns a callable class that can be used as follows: `instanceOfItemFullQuantity.copyWith(...)` or like so:`instanceOfItemFullQuantity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemFullQuantityCWProxy get copyWith => _$ItemFullQuantityCWProxyImpl(this);
}
