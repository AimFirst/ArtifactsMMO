// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SkillDataSchema extends SkillDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final SkillInfoSchema details;
  @override
  final CharacterSchema character;

  factory _$SkillDataSchema([void Function(SkillDataSchemaBuilder)? updates]) =>
      (new SkillDataSchemaBuilder()..update(updates))._build();

  _$SkillDataSchema._(
      {required this.cooldown, required this.details, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'SkillDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        details, r'SkillDataSchema', 'details');
    BuiltValueNullFieldError.checkNotNull(
        character, r'SkillDataSchema', 'character');
  }

  @override
  SkillDataSchema rebuild(void Function(SkillDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillDataSchemaBuilder toBuilder() =>
      new SkillDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillDataSchema &&
        cooldown == other.cooldown &&
        details == other.details &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillDataSchema')
          ..add('cooldown', cooldown)
          ..add('details', details)
          ..add('character', character))
        .toString();
  }
}

class SkillDataSchemaBuilder
    implements Builder<SkillDataSchema, SkillDataSchemaBuilder> {
  _$SkillDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  SkillInfoSchemaBuilder? _details;
  SkillInfoSchemaBuilder get details =>
      _$this._details ??= new SkillInfoSchemaBuilder();
  set details(SkillInfoSchemaBuilder? details) => _$this._details = details;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  SkillDataSchemaBuilder() {
    SkillDataSchema._defaults(this);
  }

  SkillDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _details = $v.details.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillDataSchema;
  }

  @override
  void update(void Function(SkillDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillDataSchema build() => _build();

  _$SkillDataSchema _build() {
    _$SkillDataSchema _$result;
    try {
      _$result = _$v ??
          new _$SkillDataSchema._(
              cooldown: cooldown.build(),
              details: details.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'details';
        details.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SkillDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
