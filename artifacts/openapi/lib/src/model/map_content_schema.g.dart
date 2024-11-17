// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_content_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapContentSchema extends MapContentSchema {
  @override
  final String type;
  @override
  final String code;

  factory _$MapContentSchema(
          [void Function(MapContentSchemaBuilder)? updates]) =>
      (new MapContentSchemaBuilder()..update(updates))._build();

  _$MapContentSchema._({required this.type, required this.code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'MapContentSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(code, r'MapContentSchema', 'code');
  }

  @override
  MapContentSchema rebuild(void Function(MapContentSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapContentSchemaBuilder toBuilder() =>
      new MapContentSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapContentSchema &&
        type == other.type &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapContentSchema')
          ..add('type', type)
          ..add('code', code))
        .toString();
  }
}

class MapContentSchemaBuilder
    implements Builder<MapContentSchema, MapContentSchemaBuilder> {
  _$MapContentSchema? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  MapContentSchemaBuilder() {
    MapContentSchema._defaults(this);
  }

  MapContentSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapContentSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MapContentSchema;
  }

  @override
  void update(void Function(MapContentSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MapContentSchema build() => _build();

  _$MapContentSchema _build() {
    final _$result = _$v ??
        new _$MapContentSchema._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'MapContentSchema', 'type'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'MapContentSchema', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
