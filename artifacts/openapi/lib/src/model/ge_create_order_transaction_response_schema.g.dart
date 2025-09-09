// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_create_order_transaction_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GECreateOrderTransactionResponseSchema
    extends GECreateOrderTransactionResponseSchema {
  @override
  final GEOrderTransactionSchema data;

  factory _$GECreateOrderTransactionResponseSchema(
          [void Function(GECreateOrderTransactionResponseSchemaBuilder)?
              updates]) =>
      (new GECreateOrderTransactionResponseSchemaBuilder()..update(updates))
          ._build();

  _$GECreateOrderTransactionResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'GECreateOrderTransactionResponseSchema', 'data');
  }

  @override
  GECreateOrderTransactionResponseSchema rebuild(
          void Function(GECreateOrderTransactionResponseSchemaBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GECreateOrderTransactionResponseSchemaBuilder toBuilder() =>
      new GECreateOrderTransactionResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GECreateOrderTransactionResponseSchema &&
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
            r'GECreateOrderTransactionResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class GECreateOrderTransactionResponseSchemaBuilder
    implements
        Builder<GECreateOrderTransactionResponseSchema,
            GECreateOrderTransactionResponseSchemaBuilder> {
  _$GECreateOrderTransactionResponseSchema? _$v;

  GEOrderTransactionSchemaBuilder? _data;
  GEOrderTransactionSchemaBuilder get data =>
      _$this._data ??= new GEOrderTransactionSchemaBuilder();
  set data(GEOrderTransactionSchemaBuilder? data) => _$this._data = data;

  GECreateOrderTransactionResponseSchemaBuilder() {
    GECreateOrderTransactionResponseSchema._defaults(this);
  }

  GECreateOrderTransactionResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GECreateOrderTransactionResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GECreateOrderTransactionResponseSchema;
  }

  @override
  void update(
      void Function(GECreateOrderTransactionResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GECreateOrderTransactionResponseSchema build() => _build();

  _$GECreateOrderTransactionResponseSchema _build() {
    _$GECreateOrderTransactionResponseSchema _$result;
    try {
      _$result = _$v ??
          new _$GECreateOrderTransactionResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GECreateOrderTransactionResponseSchema',
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
