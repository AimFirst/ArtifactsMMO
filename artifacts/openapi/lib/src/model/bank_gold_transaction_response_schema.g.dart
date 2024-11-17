// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_gold_transaction_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankGoldTransactionResponseSchema
    extends BankGoldTransactionResponseSchema {
  @override
  final BankGoldTransactionSchema data;

  factory _$BankGoldTransactionResponseSchema(
          [void Function(BankGoldTransactionResponseSchemaBuilder)? updates]) =>
      (new BankGoldTransactionResponseSchemaBuilder()..update(updates))
          ._build();

  _$BankGoldTransactionResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'BankGoldTransactionResponseSchema', 'data');
  }

  @override
  BankGoldTransactionResponseSchema rebuild(
          void Function(BankGoldTransactionResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankGoldTransactionResponseSchemaBuilder toBuilder() =>
      new BankGoldTransactionResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankGoldTransactionResponseSchema && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankGoldTransactionResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class BankGoldTransactionResponseSchemaBuilder
    implements
        Builder<BankGoldTransactionResponseSchema,
            BankGoldTransactionResponseSchemaBuilder> {
  _$BankGoldTransactionResponseSchema? _$v;

  BankGoldTransactionSchemaBuilder? _data;
  BankGoldTransactionSchemaBuilder get data =>
      _$this._data ??= new BankGoldTransactionSchemaBuilder();
  set data(BankGoldTransactionSchemaBuilder? data) => _$this._data = data;

  BankGoldTransactionResponseSchemaBuilder() {
    BankGoldTransactionResponseSchema._defaults(this);
  }

  BankGoldTransactionResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankGoldTransactionResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankGoldTransactionResponseSchema;
  }

  @override
  void update(
      void Function(BankGoldTransactionResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankGoldTransactionResponseSchema build() => _build();

  _$BankGoldTransactionResponseSchema _build() {
    _$BankGoldTransactionResponseSchema _$result;
    try {
      _$result =
          _$v ?? new _$BankGoldTransactionResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankGoldTransactionResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
