// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_merchant_transaction_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NpcMerchantTransactionResponseSchema
    extends NpcMerchantTransactionResponseSchema {
  @override
  final NpcMerchantTransactionSchema data;

  factory _$NpcMerchantTransactionResponseSchema(
          [void Function(NpcMerchantTransactionResponseSchemaBuilder)?
              updates]) =>
      (new NpcMerchantTransactionResponseSchemaBuilder()..update(updates))
          ._build();

  _$NpcMerchantTransactionResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'NpcMerchantTransactionResponseSchema', 'data');
  }

  @override
  NpcMerchantTransactionResponseSchema rebuild(
          void Function(NpcMerchantTransactionResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NpcMerchantTransactionResponseSchemaBuilder toBuilder() =>
      new NpcMerchantTransactionResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NpcMerchantTransactionResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NpcMerchantTransactionResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class NpcMerchantTransactionResponseSchemaBuilder
    implements
        Builder<NpcMerchantTransactionResponseSchema,
            NpcMerchantTransactionResponseSchemaBuilder> {
  _$NpcMerchantTransactionResponseSchema? _$v;

  NpcMerchantTransactionSchemaBuilder? _data;
  NpcMerchantTransactionSchemaBuilder get data =>
      _$this._data ??= new NpcMerchantTransactionSchemaBuilder();
  set data(NpcMerchantTransactionSchemaBuilder? data) => _$this._data = data;

  NpcMerchantTransactionResponseSchemaBuilder() {
    NpcMerchantTransactionResponseSchema._defaults(this);
  }

  NpcMerchantTransactionResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NpcMerchantTransactionResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NpcMerchantTransactionResponseSchema;
  }

  @override
  void update(
      void Function(NpcMerchantTransactionResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NpcMerchantTransactionResponseSchema build() => _build();

  _$NpcMerchantTransactionResponseSchema _build() {
    _$NpcMerchantTransactionResponseSchema _$result;
    try {
      _$result = _$v ??
          new _$NpcMerchantTransactionResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NpcMerchantTransactionResponseSchema',
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
