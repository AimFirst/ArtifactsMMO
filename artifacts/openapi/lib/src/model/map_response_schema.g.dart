// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapResponseSchema extends MapResponseSchema {
  @override
  final MapSchema data;

  factory _$MapResponseSchema(
          [void Function(MapResponseSchemaBuilder)? updates]) =>
      (new MapResponseSchemaBuilder()..update(updates))._build();

  _$MapResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'MapResponseSchema', 'data');
  }

  @override
  MapResponseSchema rebuild(void Function(MapResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapResponseSchemaBuilder toBuilder() =>
      new MapResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'MapResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class MapResponseSchemaBuilder
    implements Builder<MapResponseSchema, MapResponseSchemaBuilder> {
  _$MapResponseSchema? _$v;

  MapSchemaBuilder? _data;
  MapSchemaBuilder get data => _$this._data ??= new MapSchemaBuilder();
  set data(MapSchemaBuilder? data) => _$this._data = data;

  MapResponseSchemaBuilder() {
    MapResponseSchema._defaults(this);
  }

  MapResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MapResponseSchema;
  }

  @override
  void update(void Function(MapResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MapResponseSchema build() => _build();

  _$MapResponseSchema _build() {
    _$MapResponseSchema _$result;
    try {
      _$result = _$v ?? new _$MapResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MapResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
