// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MapSchema extends MapSchema {
  @override
  final String name;
  @override
  final String skin;
  @override
  final int x;
  @override
  final int y;
  @override
  final MapContentSchema? content;

  factory _$MapSchema([void Function(MapSchemaBuilder)? updates]) =>
      (new MapSchemaBuilder()..update(updates))._build();

  _$MapSchema._(
      {required this.name,
      required this.skin,
      required this.x,
      required this.y,
      this.content})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'MapSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(skin, r'MapSchema', 'skin');
    BuiltValueNullFieldError.checkNotNull(x, r'MapSchema', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'MapSchema', 'y');
  }

  @override
  MapSchema rebuild(void Function(MapSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapSchemaBuilder toBuilder() => new MapSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapSchema &&
        name == other.name &&
        skin == other.skin &&
        x == other.x &&
        y == other.y &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, skin.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapSchema')
          ..add('name', name)
          ..add('skin', skin)
          ..add('x', x)
          ..add('y', y)
          ..add('content', content))
        .toString();
  }
}

class MapSchemaBuilder implements Builder<MapSchema, MapSchemaBuilder> {
  _$MapSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _skin;
  String? get skin => _$this._skin;
  set skin(String? skin) => _$this._skin = skin;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  MapContentSchemaBuilder? _content;
  MapContentSchemaBuilder get content =>
      _$this._content ??= new MapContentSchemaBuilder();
  set content(MapContentSchemaBuilder? content) => _$this._content = content;

  MapSchemaBuilder() {
    MapSchema._defaults(this);
  }

  MapSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _skin = $v.skin;
      _x = $v.x;
      _y = $v.y;
      _content = $v.content?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MapSchema;
  }

  @override
  void update(void Function(MapSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MapSchema build() => _build();

  _$MapSchema _build() {
    _$MapSchema _$result;
    try {
      _$result = _$v ??
          new _$MapSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'MapSchema', 'name'),
              skin: BuiltValueNullFieldError.checkNotNull(
                  skin, r'MapSchema', 'skin'),
              x: BuiltValueNullFieldError.checkNotNull(x, r'MapSchema', 'x'),
              y: BuiltValueNullFieldError.checkNotNull(y, r'MapSchema', 'y'),
              content: _content?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        _content?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MapSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
