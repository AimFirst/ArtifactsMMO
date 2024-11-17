// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DestinationSchema extends DestinationSchema {
  @override
  final int x;
  @override
  final int y;

  factory _$DestinationSchema(
          [void Function(DestinationSchemaBuilder)? updates]) =>
      (new DestinationSchemaBuilder()..update(updates))._build();

  _$DestinationSchema._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'DestinationSchema', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'DestinationSchema', 'y');
  }

  @override
  DestinationSchema rebuild(void Function(DestinationSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DestinationSchemaBuilder toBuilder() =>
      new DestinationSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DestinationSchema && x == other.x && y == other.y;
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
    return (newBuiltValueToStringHelper(r'DestinationSchema')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class DestinationSchemaBuilder
    implements Builder<DestinationSchema, DestinationSchemaBuilder> {
  _$DestinationSchema? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  DestinationSchemaBuilder() {
    DestinationSchema._defaults(this);
  }

  DestinationSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DestinationSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DestinationSchema;
  }

  @override
  void update(void Function(DestinationSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DestinationSchema build() => _build();

  _$DestinationSchema _build() {
    final _$result = _$v ??
        new _$DestinationSchema._(
            x: BuiltValueNullFieldError.checkNotNull(
                x, r'DestinationSchema', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, r'DestinationSchema', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
