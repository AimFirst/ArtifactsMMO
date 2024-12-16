// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_manager.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UniqueItemQuantityRequestCWProxy {
  UniqueItemQuantityRequest key(String key);

  UniqueItemQuantityRequest item(Item item);

  UniqueItemQuantityRequest quantity(int quantity);

  UniqueItemQuantityRequest requestingCharacter(String requestingCharacter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UniqueItemQuantityRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UniqueItemQuantityRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UniqueItemQuantityRequest call({
    String key,
    Item item,
    int quantity,
    String requestingCharacter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUniqueItemQuantityRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUniqueItemQuantityRequest.copyWith.fieldName(...)`
class _$UniqueItemQuantityRequestCWProxyImpl
    implements _$UniqueItemQuantityRequestCWProxy {
  const _$UniqueItemQuantityRequestCWProxyImpl(this._value);

  final UniqueItemQuantityRequest _value;

  @override
  UniqueItemQuantityRequest key(String key) => this(key: key);

  @override
  UniqueItemQuantityRequest item(Item item) => this(item: item);

  @override
  UniqueItemQuantityRequest quantity(int quantity) => this(quantity: quantity);

  @override
  UniqueItemQuantityRequest requestingCharacter(String requestingCharacter) =>
      this(requestingCharacter: requestingCharacter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UniqueItemQuantityRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UniqueItemQuantityRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UniqueItemQuantityRequest call({
    Object? key = const $CopyWithPlaceholder(),
    Object? item = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? requestingCharacter = const $CopyWithPlaceholder(),
  }) {
    return UniqueItemQuantityRequest(
      key: key == const $CopyWithPlaceholder()
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as Item,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int,
      requestingCharacter: requestingCharacter == const $CopyWithPlaceholder()
          ? _value.requestingCharacter
          // ignore: cast_nullable_to_non_nullable
          : requestingCharacter as String,
    );
  }
}

extension $UniqueItemQuantityRequestCopyWith on UniqueItemQuantityRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUniqueItemQuantityRequest.copyWith(...)` or like so:`instanceOfUniqueItemQuantityRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UniqueItemQuantityRequestCWProxy get copyWith =>
      _$UniqueItemQuantityRequestCWProxyImpl(this);
}
