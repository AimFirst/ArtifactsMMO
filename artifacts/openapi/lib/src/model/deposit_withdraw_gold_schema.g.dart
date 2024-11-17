// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_withdraw_gold_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DepositWithdrawGoldSchema extends DepositWithdrawGoldSchema {
  @override
  final int quantity;

  factory _$DepositWithdrawGoldSchema(
          [void Function(DepositWithdrawGoldSchemaBuilder)? updates]) =>
      (new DepositWithdrawGoldSchemaBuilder()..update(updates))._build();

  _$DepositWithdrawGoldSchema._({required this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'DepositWithdrawGoldSchema', 'quantity');
  }

  @override
  DepositWithdrawGoldSchema rebuild(
          void Function(DepositWithdrawGoldSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DepositWithdrawGoldSchemaBuilder toBuilder() =>
      new DepositWithdrawGoldSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DepositWithdrawGoldSchema && quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DepositWithdrawGoldSchema')
          ..add('quantity', quantity))
        .toString();
  }
}

class DepositWithdrawGoldSchemaBuilder
    implements
        Builder<DepositWithdrawGoldSchema, DepositWithdrawGoldSchemaBuilder> {
  _$DepositWithdrawGoldSchema? _$v;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  DepositWithdrawGoldSchemaBuilder() {
    DepositWithdrawGoldSchema._defaults(this);
  }

  DepositWithdrawGoldSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DepositWithdrawGoldSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DepositWithdrawGoldSchema;
  }

  @override
  void update(void Function(DepositWithdrawGoldSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DepositWithdrawGoldSchema build() => _build();

  _$DepositWithdrawGoldSchema _build() {
    final _$result = _$v ??
        new _$DepositWithdrawGoldSchema._(
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'DepositWithdrawGoldSchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
