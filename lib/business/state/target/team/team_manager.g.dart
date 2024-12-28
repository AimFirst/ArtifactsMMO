// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_manager.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UniqueItemQuantityRequestCWProxy {
  UniqueItemQuantityRequest key(String key);

  UniqueItemQuantityRequest item(Item item);

  UniqueItemQuantityRequest quantityRemaining(int quantityRemaining);

  UniqueItemQuantityRequest totalQuantity(int totalQuantity);

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
    int quantityRemaining,
    int totalQuantity,
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
  UniqueItemQuantityRequest quantityRemaining(int quantityRemaining) =>
      this(quantityRemaining: quantityRemaining);

  @override
  UniqueItemQuantityRequest totalQuantity(int totalQuantity) =>
      this(totalQuantity: totalQuantity);

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
    Object? quantityRemaining = const $CopyWithPlaceholder(),
    Object? totalQuantity = const $CopyWithPlaceholder(),
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
      quantityRemaining: quantityRemaining == const $CopyWithPlaceholder()
          ? _value.quantityRemaining
          // ignore: cast_nullable_to_non_nullable
          : quantityRemaining as int,
      totalQuantity: totalQuantity == const $CopyWithPlaceholder()
          ? _value.totalQuantity
          // ignore: cast_nullable_to_non_nullable
          : totalQuantity as int,
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
