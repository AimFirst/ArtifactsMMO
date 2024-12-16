// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_quantity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemQuantityCWProxy {
  ItemQuantity code(String code);

  ItemQuantity quantity(int quantity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemQuantity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemQuantity(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemQuantity call({
    String code,
    int quantity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemQuantity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemQuantity.copyWith.fieldName(...)`
class _$ItemQuantityCWProxyImpl implements _$ItemQuantityCWProxy {
  const _$ItemQuantityCWProxyImpl(this._value);

  final ItemQuantity _value;

  @override
  ItemQuantity code(String code) => this(code: code);

  @override
  ItemQuantity quantity(int quantity) => this(quantity: quantity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemQuantity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemQuantity(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemQuantity call({
    Object? code = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
  }) {
    return ItemQuantity(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int,
    );
  }
}

extension $ItemQuantityCopyWith on ItemQuantity {
  /// Returns a callable class that can be used as follows: `instanceOfItemQuantity.copyWith(...)` or like so:`instanceOfItemQuantity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemQuantityCWProxy get copyWith => _$ItemQuantityCWProxyImpl(this);
}
