// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_extension_transaction_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankExtensionTransactionResponseSchema
    extends BankExtensionTransactionResponseSchema {
  @override
  final BankExtensionTransactionSchema data;

  factory _$BankExtensionTransactionResponseSchema(
          [void Function(BankExtensionTransactionResponseSchemaBuilder)?
              updates]) =>
      (new BankExtensionTransactionResponseSchemaBuilder()..update(updates))
          ._build();

  _$BankExtensionTransactionResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'BankExtensionTransactionResponseSchema', 'data');
  }

  @override
  BankExtensionTransactionResponseSchema rebuild(
          void Function(BankExtensionTransactionResponseSchemaBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankExtensionTransactionResponseSchemaBuilder toBuilder() =>
      new BankExtensionTransactionResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankExtensionTransactionResponseSchema &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(
            r'BankExtensionTransactionResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class BankExtensionTransactionResponseSchemaBuilder
    implements
        Builder<BankExtensionTransactionResponseSchema,
            BankExtensionTransactionResponseSchemaBuilder> {
  _$BankExtensionTransactionResponseSchema? _$v;

  BankExtensionTransactionSchemaBuilder? _data;
  BankExtensionTransactionSchemaBuilder get data =>
      _$this._data ??= new BankExtensionTransactionSchemaBuilder();
  set data(BankExtensionTransactionSchemaBuilder? data) => _$this._data = data;

  BankExtensionTransactionResponseSchemaBuilder() {
    BankExtensionTransactionResponseSchema._defaults(this);
  }

  BankExtensionTransactionResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankExtensionTransactionResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankExtensionTransactionResponseSchema;
  }

  @override
  void update(
      void Function(BankExtensionTransactionResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankExtensionTransactionResponseSchema build() => _build();

  _$BankExtensionTransactionResponseSchema _build() {
    _$BankExtensionTransactionResponseSchema _$result;
    try {
      _$result = _$v ??
          new _$BankExtensionTransactionResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankExtensionTransactionResponseSchema',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
