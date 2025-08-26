// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_item_transaction_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankItemTransactionResponseSchema
    extends BankItemTransactionResponseSchema {
  @override
  final BankItemTransactionSchema data;

  factory _$BankItemTransactionResponseSchema(
          [void Function(BankItemTransactionResponseSchemaBuilder)? updates]) =>
      (BankItemTransactionResponseSchemaBuilder()..update(updates))._build();

  _$BankItemTransactionResponseSchema._({required this.data}) : super._();
  @override
  BankItemTransactionResponseSchema rebuild(
          void Function(BankItemTransactionResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankItemTransactionResponseSchemaBuilder toBuilder() =>
      BankItemTransactionResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankItemTransactionResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'BankItemTransactionResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class BankItemTransactionResponseSchemaBuilder
    implements
        Builder<BankItemTransactionResponseSchema,
            BankItemTransactionResponseSchemaBuilder> {
  _$BankItemTransactionResponseSchema? _$v;

  BankItemTransactionSchemaBuilder? _data;
  BankItemTransactionSchemaBuilder get data =>
      _$this._data ??= BankItemTransactionSchemaBuilder();
  set data(BankItemTransactionSchemaBuilder? data) => _$this._data = data;

  BankItemTransactionResponseSchemaBuilder() {
    BankItemTransactionResponseSchema._defaults(this);
  }

  BankItemTransactionResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankItemTransactionResponseSchema other) {
    _$v = other as _$BankItemTransactionResponseSchema;
  }

  @override
  void update(
      void Function(BankItemTransactionResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankItemTransactionResponseSchema build() => _build();

  _$BankItemTransactionResponseSchema _build() {
    _$BankItemTransactionResponseSchema _$result;
    try {
      _$result = _$v ??
          _$BankItemTransactionResponseSchema._(
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BankItemTransactionResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
