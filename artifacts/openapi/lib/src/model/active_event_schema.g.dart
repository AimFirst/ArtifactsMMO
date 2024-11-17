// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_event_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ActiveEventSchema extends ActiveEventSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final MapSchema map;
  @override
  final String previousSkin;
  @override
  final int duration;
  @override
  final DateTime expiration;
  @override
  final DateTime createdAt;

  factory _$ActiveEventSchema(
          [void Function(ActiveEventSchemaBuilder)? updates]) =>
      (new ActiveEventSchemaBuilder()..update(updates))._build();

  _$ActiveEventSchema._(
      {required this.name,
      required this.code,
      required this.map,
      required this.previousSkin,
      required this.duration,
      required this.expiration,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ActiveEventSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'ActiveEventSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(map, r'ActiveEventSchema', 'map');
    BuiltValueNullFieldError.checkNotNull(
        previousSkin, r'ActiveEventSchema', 'previousSkin');
    BuiltValueNullFieldError.checkNotNull(
        duration, r'ActiveEventSchema', 'duration');
    BuiltValueNullFieldError.checkNotNull(
        expiration, r'ActiveEventSchema', 'expiration');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'ActiveEventSchema', 'createdAt');
  }

  @override
  ActiveEventSchema rebuild(void Function(ActiveEventSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActiveEventSchemaBuilder toBuilder() =>
      new ActiveEventSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActiveEventSchema &&
        name == other.name &&
        code == other.code &&
        map == other.map &&
        previousSkin == other.previousSkin &&
        duration == other.duration &&
        expiration == other.expiration &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, map.hashCode);
    _$hash = $jc(_$hash, previousSkin.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, expiration.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActiveEventSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('map', map)
          ..add('previousSkin', previousSkin)
          ..add('duration', duration)
          ..add('expiration', expiration)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ActiveEventSchemaBuilder
    implements Builder<ActiveEventSchema, ActiveEventSchemaBuilder> {
  _$ActiveEventSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  MapSchemaBuilder? _map;
  MapSchemaBuilder get map => _$this._map ??= new MapSchemaBuilder();
  set map(MapSchemaBuilder? map) => _$this._map = map;

  String? _previousSkin;
  String? get previousSkin => _$this._previousSkin;
  set previousSkin(String? previousSkin) => _$this._previousSkin = previousSkin;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  DateTime? _expiration;
  DateTime? get expiration => _$this._expiration;
  set expiration(DateTime? expiration) => _$this._expiration = expiration;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ActiveEventSchemaBuilder() {
    ActiveEventSchema._defaults(this);
  }

  ActiveEventSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _map = $v.map.toBuilder();
      _previousSkin = $v.previousSkin;
      _duration = $v.duration;
      _expiration = $v.expiration;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActiveEventSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActiveEventSchema;
  }

  @override
  void update(void Function(ActiveEventSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActiveEventSchema build() => _build();

  _$ActiveEventSchema _build() {
    _$ActiveEventSchema _$result;
    try {
      _$result = _$v ??
          new _$ActiveEventSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ActiveEventSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'ActiveEventSchema', 'code'),
              map: map.build(),
              previousSkin: BuiltValueNullFieldError.checkNotNull(
                  previousSkin, r'ActiveEventSchema', 'previousSkin'),
              duration: BuiltValueNullFieldError.checkNotNull(
                  duration, r'ActiveEventSchema', 'duration'),
              expiration: BuiltValueNullFieldError.checkNotNull(
                  expiration, r'ActiveEventSchema', 'expiration'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'ActiveEventSchema', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ActiveEventSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
