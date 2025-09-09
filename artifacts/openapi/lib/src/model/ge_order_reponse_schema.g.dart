// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_order_reponse_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GEOrderReponseSchema extends GEOrderReponseSchema {
  @override
  final GEOrderSchema data;

  factory _$GEOrderReponseSchema(
          [void Function(GEOrderReponseSchemaBuilder)? updates]) =>
      (new GEOrderReponseSchemaBuilder()..update(updates))._build();

  _$GEOrderReponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'GEOrderReponseSchema', 'data');
  }

  @override
  GEOrderReponseSchema rebuild(
          void Function(GEOrderReponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEOrderReponseSchemaBuilder toBuilder() =>
      new GEOrderReponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEOrderReponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'GEOrderReponseSchema')
          ..add('data', data))
        .toString();
  }
}

class GEOrderReponseSchemaBuilder
    implements Builder<GEOrderReponseSchema, GEOrderReponseSchemaBuilder> {
  _$GEOrderReponseSchema? _$v;

  GEOrderSchemaBuilder? _data;
  GEOrderSchemaBuilder get data => _$this._data ??= new GEOrderSchemaBuilder();
  set data(GEOrderSchemaBuilder? data) => _$this._data = data;

  GEOrderReponseSchemaBuilder() {
    GEOrderReponseSchema._defaults(this);
  }

  GEOrderReponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEOrderReponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEOrderReponseSchema;
  }

  @override
  void update(void Function(GEOrderReponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEOrderReponseSchema build() => _build();

  _$GEOrderReponseSchema _build() {
    _$GEOrderReponseSchema _$result;
    try {
      _$result = _$v ?? new _$GEOrderReponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GEOrderReponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
