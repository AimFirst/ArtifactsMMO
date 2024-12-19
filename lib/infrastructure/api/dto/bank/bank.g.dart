// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BankCWProxy {
  Bank bankDetails(BankDetails bankDetails);

  Bank items(List<ItemQuantity> items);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Bank(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Bank(...).copyWith(id: 12, name: "My name")
  /// ````
  Bank call({
    BankDetails bankDetails,
    List<ItemQuantity> items,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBank.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBank.copyWith.fieldName(...)`
class _$BankCWProxyImpl implements _$BankCWProxy {
  const _$BankCWProxyImpl(this._value);

  final Bank _value;

  @override
  Bank bankDetails(BankDetails bankDetails) => this(bankDetails: bankDetails);

  @override
  Bank items(List<ItemQuantity> items) => this(items: items);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Bank(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Bank(...).copyWith(id: 12, name: "My name")
  /// ````
  Bank call({
    Object? bankDetails = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
  }) {
    return Bank(
      bankDetails: bankDetails == const $CopyWithPlaceholder()
          ? _value.bankDetails
          // ignore: cast_nullable_to_non_nullable
          : bankDetails as BankDetails,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<ItemQuantity>,
    );
  }
}

extension $BankCopyWith on Bank {
  /// Returns a callable class that can be used as follows: `instanceOfBank.copyWith(...)` or like so:`instanceOfBank.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BankCWProxy get copyWith => _$BankCWProxyImpl(this);
}
