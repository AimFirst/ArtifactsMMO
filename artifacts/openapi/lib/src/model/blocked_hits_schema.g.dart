// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_hits_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BlockedHitsSchema extends BlockedHitsSchema {
  @override
  final int fire;
  @override
  final int earth;
  @override
  final int water;
  @override
  final int air;
  @override
  final int total;

  factory _$BlockedHitsSchema(
          [void Function(BlockedHitsSchemaBuilder)? updates]) =>
      (new BlockedHitsSchemaBuilder()..update(updates))._build();

  _$BlockedHitsSchema._(
      {required this.fire,
      required this.earth,
      required this.water,
      required this.air,
      required this.total})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(fire, r'BlockedHitsSchema', 'fire');
    BuiltValueNullFieldError.checkNotNull(earth, r'BlockedHitsSchema', 'earth');
    BuiltValueNullFieldError.checkNotNull(water, r'BlockedHitsSchema', 'water');
    BuiltValueNullFieldError.checkNotNull(air, r'BlockedHitsSchema', 'air');
    BuiltValueNullFieldError.checkNotNull(total, r'BlockedHitsSchema', 'total');
  }

  @override
  BlockedHitsSchema rebuild(void Function(BlockedHitsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockedHitsSchemaBuilder toBuilder() =>
      new BlockedHitsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlockedHitsSchema &&
        fire == other.fire &&
        earth == other.earth &&
        water == other.water &&
        air == other.air &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fire.hashCode);
    _$hash = $jc(_$hash, earth.hashCode);
    _$hash = $jc(_$hash, water.hashCode);
    _$hash = $jc(_$hash, air.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BlockedHitsSchema')
          ..add('fire', fire)
          ..add('earth', earth)
          ..add('water', water)
          ..add('air', air)
          ..add('total', total))
        .toString();
  }
}

class BlockedHitsSchemaBuilder
    implements Builder<BlockedHitsSchema, BlockedHitsSchemaBuilder> {
  _$BlockedHitsSchema? _$v;

  int? _fire;
  int? get fire => _$this._fire;
  set fire(int? fire) => _$this._fire = fire;

  int? _earth;
  int? get earth => _$this._earth;
  set earth(int? earth) => _$this._earth = earth;

  int? _water;
  int? get water => _$this._water;
  set water(int? water) => _$this._water = water;

  int? _air;
  int? get air => _$this._air;
  set air(int? air) => _$this._air = air;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  BlockedHitsSchemaBuilder() {
    BlockedHitsSchema._defaults(this);
  }

  BlockedHitsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fire = $v.fire;
      _earth = $v.earth;
      _water = $v.water;
      _air = $v.air;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BlockedHitsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BlockedHitsSchema;
  }

  @override
  void update(void Function(BlockedHitsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BlockedHitsSchema build() => _build();

  _$BlockedHitsSchema _build() {
    final _$result = _$v ??
        new _$BlockedHitsSchema._(
            fire: BuiltValueNullFieldError.checkNotNull(
                fire, r'BlockedHitsSchema', 'fire'),
            earth: BuiltValueNullFieldError.checkNotNull(
                earth, r'BlockedHitsSchema', 'earth'),
            water: BuiltValueNullFieldError.checkNotNull(
                water, r'BlockedHitsSchema', 'water'),
            air: BuiltValueNullFieldError.checkNotNull(
                air, r'BlockedHitsSchema', 'air'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'BlockedHitsSchema', 'total'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
