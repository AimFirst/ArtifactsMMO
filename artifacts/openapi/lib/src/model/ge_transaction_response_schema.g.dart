// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_transaction_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GETransactionResponseSchema extends GETransactionResponseSchema {
  @override
  final GETransactionListSchema data;

  factory _$GETransactionResponseSchema(
          [void Function(GETransactionResponseSchemaBuilder)? updates]) =>
      (new GETransactionResponseSchemaBuilder()..update(updates))._build();

  _$GETransactionResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'GETransactionResponseSchema', 'data');
  }

  @override
  GETransactionResponseSchema rebuild(
          void Function(GETransactionResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GETransactionResponseSchemaBuilder toBuilder() =>
      new GETransactionResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GETransactionResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'GETransactionResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class GETransactionResponseSchemaBuilder
    implements
        Builder<GETransactionResponseSchema,
            GETransactionResponseSchemaBuilder> {
  _$GETransactionResponseSchema? _$v;

  GETransactionListSchemaBuilder? _data;
  GETransactionListSchemaBuilder get data =>
      _$this._data ??= new GETransactionListSchemaBuilder();
  set data(GETransactionListSchemaBuilder? data) => _$this._data = data;

  GETransactionResponseSchemaBuilder() {
    GETransactionResponseSchema._defaults(this);
  }

  GETransactionResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GETransactionResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GETransactionResponseSchema;
  }

  @override
  void update(void Function(GETransactionResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GETransactionResponseSchema build() => _build();

  _$GETransactionResponseSchema _build() {
    _$GETransactionResponseSchema _$result;
    try {
      _$result = _$v ?? new _$GETransactionResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GETransactionResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
