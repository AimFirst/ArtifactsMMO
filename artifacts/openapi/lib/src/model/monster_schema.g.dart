// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MonsterSchema extends MonsterSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final int level;
  @override
  final int hp;
  @override
  final int attackFire;
  @override
  final int attackEarth;
  @override
  final int attackWater;
  @override
  final int attackAir;
  @override
  final int resFire;
  @override
  final int resEarth;
  @override
  final int resWater;
  @override
  final int resAir;
  @override
  final int minGold;
  @override
  final int maxGold;
  @override
  final BuiltList<DropRateSchema> drops;

  factory _$MonsterSchema([void Function(MonsterSchemaBuilder)? updates]) =>
      (new MonsterSchemaBuilder()..update(updates))._build();

  _$MonsterSchema._(
      {required this.name,
      required this.code,
      required this.level,
      required this.hp,
      required this.attackFire,
      required this.attackEarth,
      required this.attackWater,
      required this.attackAir,
      required this.resFire,
      required this.resEarth,
      required this.resWater,
      required this.resAir,
      required this.minGold,
      required this.maxGold,
      required this.drops})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'MonsterSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'MonsterSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(level, r'MonsterSchema', 'level');
    BuiltValueNullFieldError.checkNotNull(hp, r'MonsterSchema', 'hp');
    BuiltValueNullFieldError.checkNotNull(
        attackFire, r'MonsterSchema', 'attackFire');
    BuiltValueNullFieldError.checkNotNull(
        attackEarth, r'MonsterSchema', 'attackEarth');
    BuiltValueNullFieldError.checkNotNull(
        attackWater, r'MonsterSchema', 'attackWater');
    BuiltValueNullFieldError.checkNotNull(
        attackAir, r'MonsterSchema', 'attackAir');
    BuiltValueNullFieldError.checkNotNull(resFire, r'MonsterSchema', 'resFire');
    BuiltValueNullFieldError.checkNotNull(
        resEarth, r'MonsterSchema', 'resEarth');
    BuiltValueNullFieldError.checkNotNull(
        resWater, r'MonsterSchema', 'resWater');
    BuiltValueNullFieldError.checkNotNull(resAir, r'MonsterSchema', 'resAir');
    BuiltValueNullFieldError.checkNotNull(minGold, r'MonsterSchema', 'minGold');
    BuiltValueNullFieldError.checkNotNull(maxGold, r'MonsterSchema', 'maxGold');
    BuiltValueNullFieldError.checkNotNull(drops, r'MonsterSchema', 'drops');
  }

  @override
  MonsterSchema rebuild(void Function(MonsterSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonsterSchemaBuilder toBuilder() => new MonsterSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonsterSchema &&
        name == other.name &&
        code == other.code &&
        level == other.level &&
        hp == other.hp &&
        attackFire == other.attackFire &&
        attackEarth == other.attackEarth &&
        attackWater == other.attackWater &&
        attackAir == other.attackAir &&
        resFire == other.resFire &&
        resEarth == other.resEarth &&
        resWater == other.resWater &&
        resAir == other.resAir &&
        minGold == other.minGold &&
        maxGold == other.maxGold &&
        drops == other.drops;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, hp.hashCode);
    _$hash = $jc(_$hash, attackFire.hashCode);
    _$hash = $jc(_$hash, attackEarth.hashCode);
    _$hash = $jc(_$hash, attackWater.hashCode);
    _$hash = $jc(_$hash, attackAir.hashCode);
    _$hash = $jc(_$hash, resFire.hashCode);
    _$hash = $jc(_$hash, resEarth.hashCode);
    _$hash = $jc(_$hash, resWater.hashCode);
    _$hash = $jc(_$hash, resAir.hashCode);
    _$hash = $jc(_$hash, minGold.hashCode);
    _$hash = $jc(_$hash, maxGold.hashCode);
    _$hash = $jc(_$hash, drops.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MonsterSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('level', level)
          ..add('hp', hp)
          ..add('attackFire', attackFire)
          ..add('attackEarth', attackEarth)
          ..add('attackWater', attackWater)
          ..add('attackAir', attackAir)
          ..add('resFire', resFire)
          ..add('resEarth', resEarth)
          ..add('resWater', resWater)
          ..add('resAir', resAir)
          ..add('minGold', minGold)
          ..add('maxGold', maxGold)
          ..add('drops', drops))
        .toString();
  }
}

class MonsterSchemaBuilder
    implements Builder<MonsterSchema, MonsterSchemaBuilder> {
  _$MonsterSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  int? _hp;
  int? get hp => _$this._hp;
  set hp(int? hp) => _$this._hp = hp;

  int? _attackFire;
  int? get attackFire => _$this._attackFire;
  set attackFire(int? attackFire) => _$this._attackFire = attackFire;

  int? _attackEarth;
  int? get attackEarth => _$this._attackEarth;
  set attackEarth(int? attackEarth) => _$this._attackEarth = attackEarth;

  int? _attackWater;
  int? get attackWater => _$this._attackWater;
  set attackWater(int? attackWater) => _$this._attackWater = attackWater;

  int? _attackAir;
  int? get attackAir => _$this._attackAir;
  set attackAir(int? attackAir) => _$this._attackAir = attackAir;

  int? _resFire;
  int? get resFire => _$this._resFire;
  set resFire(int? resFire) => _$this._resFire = resFire;

  int? _resEarth;
  int? get resEarth => _$this._resEarth;
  set resEarth(int? resEarth) => _$this._resEarth = resEarth;

  int? _resWater;
  int? get resWater => _$this._resWater;
  set resWater(int? resWater) => _$this._resWater = resWater;

  int? _resAir;
  int? get resAir => _$this._resAir;
  set resAir(int? resAir) => _$this._resAir = resAir;

  int? _minGold;
  int? get minGold => _$this._minGold;
  set minGold(int? minGold) => _$this._minGold = minGold;

  int? _maxGold;
  int? get maxGold => _$this._maxGold;
  set maxGold(int? maxGold) => _$this._maxGold = maxGold;

  ListBuilder<DropRateSchema>? _drops;
  ListBuilder<DropRateSchema> get drops =>
      _$this._drops ??= new ListBuilder<DropRateSchema>();
  set drops(ListBuilder<DropRateSchema>? drops) => _$this._drops = drops;

  MonsterSchemaBuilder() {
    MonsterSchema._defaults(this);
  }

  MonsterSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _level = $v.level;
      _hp = $v.hp;
      _attackFire = $v.attackFire;
      _attackEarth = $v.attackEarth;
      _attackWater = $v.attackWater;
      _attackAir = $v.attackAir;
      _resFire = $v.resFire;
      _resEarth = $v.resEarth;
      _resWater = $v.resWater;
      _resAir = $v.resAir;
      _minGold = $v.minGold;
      _maxGold = $v.maxGold;
      _drops = $v.drops.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonsterSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonsterSchema;
  }

  @override
  void update(void Function(MonsterSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonsterSchema build() => _build();

  _$MonsterSchema _build() {
    _$MonsterSchema _$result;
    try {
      _$result = _$v ??
          new _$MonsterSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'MonsterSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'MonsterSchema', 'code'),
              level: BuiltValueNullFieldError.checkNotNull(
                  level, r'MonsterSchema', 'level'),
              hp: BuiltValueNullFieldError.checkNotNull(
                  hp, r'MonsterSchema', 'hp'),
              attackFire: BuiltValueNullFieldError.checkNotNull(
                  attackFire, r'MonsterSchema', 'attackFire'),
              attackEarth: BuiltValueNullFieldError.checkNotNull(
                  attackEarth, r'MonsterSchema', 'attackEarth'),
              attackWater: BuiltValueNullFieldError.checkNotNull(
                  attackWater, r'MonsterSchema', 'attackWater'),
              attackAir: BuiltValueNullFieldError.checkNotNull(
                  attackAir, r'MonsterSchema', 'attackAir'),
              resFire: BuiltValueNullFieldError.checkNotNull(
                  resFire, r'MonsterSchema', 'resFire'),
              resEarth:
                  BuiltValueNullFieldError.checkNotNull(resEarth, r'MonsterSchema', 'resEarth'),
              resWater: BuiltValueNullFieldError.checkNotNull(resWater, r'MonsterSchema', 'resWater'),
              resAir: BuiltValueNullFieldError.checkNotNull(resAir, r'MonsterSchema', 'resAir'),
              minGold: BuiltValueNullFieldError.checkNotNull(minGold, r'MonsterSchema', 'minGold'),
              maxGold: BuiltValueNullFieldError.checkNotNull(maxGold, r'MonsterSchema', 'maxGold'),
              drops: drops.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'drops';
        drops.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MonsterSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
