// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResourceSchema extends ResourceSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final GatheringSkill skill;
  @override
  final int level;
  @override
  final BuiltList<DropRateSchema> drops;

  factory _$ResourceSchema([void Function(ResourceSchemaBuilder)? updates]) =>
      (new ResourceSchemaBuilder()..update(updates))._build();

  _$ResourceSchema._(
      {required this.name,
      required this.code,
      required this.skill,
      required this.level,
      required this.drops})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ResourceSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'ResourceSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(skill, r'ResourceSchema', 'skill');
    BuiltValueNullFieldError.checkNotNull(level, r'ResourceSchema', 'level');
    BuiltValueNullFieldError.checkNotNull(drops, r'ResourceSchema', 'drops');
  }

  @override
  ResourceSchema rebuild(void Function(ResourceSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceSchemaBuilder toBuilder() =>
      new ResourceSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceSchema &&
        name == other.name &&
        code == other.code &&
        skill == other.skill &&
        level == other.level &&
        drops == other.drops;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, skill.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, drops.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResourceSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('skill', skill)
          ..add('level', level)
          ..add('drops', drops))
        .toString();
  }
}

class ResourceSchemaBuilder
    implements Builder<ResourceSchema, ResourceSchemaBuilder> {
  _$ResourceSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  GatheringSkill? _skill;
  GatheringSkill? get skill => _$this._skill;
  set skill(GatheringSkill? skill) => _$this._skill = skill;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  ListBuilder<DropRateSchema>? _drops;
  ListBuilder<DropRateSchema> get drops =>
      _$this._drops ??= new ListBuilder<DropRateSchema>();
  set drops(ListBuilder<DropRateSchema>? drops) => _$this._drops = drops;

  ResourceSchemaBuilder() {
    ResourceSchema._defaults(this);
  }

  ResourceSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _skill = $v.skill;
      _level = $v.level;
      _drops = $v.drops.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResourceSchema;
  }

  @override
  void update(void Function(ResourceSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResourceSchema build() => _build();

  _$ResourceSchema _build() {
    _$ResourceSchema _$result;
    try {
      _$result = _$v ??
          new _$ResourceSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ResourceSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'ResourceSchema', 'code'),
              skill: BuiltValueNullFieldError.checkNotNull(
                  skill, r'ResourceSchema', 'skill'),
              level: BuiltValueNullFieldError.checkNotNull(
                  level, r'ResourceSchema', 'level'),
              drops: drops.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'drops';
        drops.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResourceSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
