// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BankDetailsCWProxy {
  BankDetails slots(int slots);

  BankDetails expansions(int expansions);

  BankDetails nextExpansionCost(int nextExpansionCost);

  BankDetails gold(int gold);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BankDetails(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BankDetails(...).copyWith(id: 12, name: "My name")
  /// ````
  BankDetails call({
    int slots,
    int expansions,
    int nextExpansionCost,
    int gold,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBankDetails.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBankDetails.copyWith.fieldName(...)`
class _$BankDetailsCWProxyImpl implements _$BankDetailsCWProxy {
  const _$BankDetailsCWProxyImpl(this._value);

  final BankDetails _value;

  @override
  BankDetails slots(int slots) => this(slots: slots);

  @override
  BankDetails expansions(int expansions) => this(expansions: expansions);

  @override
  BankDetails nextExpansionCost(int nextExpansionCost) =>
      this(nextExpansionCost: nextExpansionCost);

  @override
  BankDetails gold(int gold) => this(gold: gold);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BankDetails(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BankDetails(...).copyWith(id: 12, name: "My name")
  /// ````
  BankDetails call({
    Object? slots = const $CopyWithPlaceholder(),
    Object? expansions = const $CopyWithPlaceholder(),
    Object? nextExpansionCost = const $CopyWithPlaceholder(),
    Object? gold = const $CopyWithPlaceholder(),
  }) {
    return BankDetails(
      slots: slots == const $CopyWithPlaceholder()
          ? _value.slots
          // ignore: cast_nullable_to_non_nullable
          : slots as int,
      expansions: expansions == const $CopyWithPlaceholder()
          ? _value.expansions
          // ignore: cast_nullable_to_non_nullable
          : expansions as int,
      nextExpansionCost: nextExpansionCost == const $CopyWithPlaceholder()
          ? _value.nextExpansionCost
          // ignore: cast_nullable_to_non_nullable
          : nextExpansionCost as int,
      gold: gold == const $CopyWithPlaceholder()
          ? _value.gold
          // ignore: cast_nullable_to_non_nullable
          : gold as int,
    );
  }
}

extension $BankDetailsCopyWith on BankDetails {
  /// Returns a callable class that can be used as follows: `instanceOfBankDetails.copyWith(...)` or like so:`instanceOfBankDetails.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BankDetailsCWProxy get copyWith => _$BankDetailsCWProxyImpl(this);
}
