// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_map_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventMapSchema extends EventMapSchema {
  @override
  final int x;
  @override
  final int y;

  factory _$EventMapSchema([void Function(EventMapSchemaBuilder)? updates]) =>
      (new EventMapSchemaBuilder()..update(updates))._build();

  _$EventMapSchema._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'EventMapSchema', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'EventMapSchema', 'y');
  }

  @override
  EventMapSchema rebuild(void Function(EventMapSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventMapSchemaBuilder toBuilder() =>
      new EventMapSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventMapSchema && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventMapSchema')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class EventMapSchemaBuilder
    implements Builder<EventMapSchema, EventMapSchemaBuilder> {
  _$EventMapSchema? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  EventMapSchemaBuilder() {
    EventMapSchema._defaults(this);
  }

  EventMapSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventMapSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventMapSchema;
  }

  @override
  void update(void Function(EventMapSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventMapSchema build() => _build();

  _$EventMapSchema _build() {
    final _$result = _$v ??
        new _$EventMapSchema._(
            x: BuiltValueNullFieldError.checkNotNull(x, r'EventMapSchema', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, r'EventMapSchema', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
