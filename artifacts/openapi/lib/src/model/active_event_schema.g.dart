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
  final MapSchema previousMap;
  @override
  final int duration;
  @override
  final DateTime expiration;
  @override
  final DateTime createdAt;

  factory _$ActiveEventSchema(
          [void Function(ActiveEventSchemaBuilder)? updates]) =>
      (ActiveEventSchemaBuilder()..update(updates))._build();

  _$ActiveEventSchema._(
      {required this.name,
      required this.code,
      required this.map,
      required this.previousMap,
      required this.duration,
      required this.expiration,
      required this.createdAt})
      : super._();
  @override
  ActiveEventSchema rebuild(void Function(ActiveEventSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActiveEventSchemaBuilder toBuilder() =>
      ActiveEventSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActiveEventSchema &&
        name == other.name &&
        code == other.code &&
        map == other.map &&
        previousMap == other.previousMap &&
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
    _$hash = $jc(_$hash, previousMap.hashCode);
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
          ..add('previousMap', previousMap)
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
  MapSchemaBuilder get map => _$this._map ??= MapSchemaBuilder();
  set map(MapSchemaBuilder? map) => _$this._map = map;

  MapSchemaBuilder? _previousMap;
  MapSchemaBuilder get previousMap =>
      _$this._previousMap ??= MapSchemaBuilder();
  set previousMap(MapSchemaBuilder? previousMap) =>
      _$this._previousMap = previousMap;

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
      _previousMap = $v.previousMap.toBuilder();
      _duration = $v.duration;
      _expiration = $v.expiration;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActiveEventSchema other) {
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
          _$ActiveEventSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ActiveEventSchema', 'name'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ActiveEventSchema', 'code'),
            map: map.build(),
            previousMap: previousMap.build(),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'ActiveEventSchema', 'duration'),
            expiration: BuiltValueNullFieldError.checkNotNull(
                expiration, r'ActiveEventSchema', 'expiration'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ActiveEventSchema', 'createdAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
        _$failedField = 'previousMap';
        previousMap.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ActiveEventSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
