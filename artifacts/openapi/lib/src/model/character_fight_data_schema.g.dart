// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_fight_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterFightDataSchema extends CharacterFightDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final FightSchema fight;
  @override
  final CharacterSchema character;

  factory _$CharacterFightDataSchema(
          [void Function(CharacterFightDataSchemaBuilder)? updates]) =>
      (new CharacterFightDataSchemaBuilder()..update(updates))._build();

  _$CharacterFightDataSchema._(
      {required this.cooldown, required this.fight, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'CharacterFightDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        fight, r'CharacterFightDataSchema', 'fight');
    BuiltValueNullFieldError.checkNotNull(
        character, r'CharacterFightDataSchema', 'character');
  }

  @override
  CharacterFightDataSchema rebuild(
          void Function(CharacterFightDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterFightDataSchemaBuilder toBuilder() =>
      new CharacterFightDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterFightDataSchema &&
        cooldown == other.cooldown &&
        fight == other.fight &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, fight.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterFightDataSchema')
          ..add('cooldown', cooldown)
          ..add('fight', fight)
          ..add('character', character))
        .toString();
  }
}

class CharacterFightDataSchemaBuilder
    implements
        Builder<CharacterFightDataSchema, CharacterFightDataSchemaBuilder> {
  _$CharacterFightDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  FightSchemaBuilder? _fight;
  FightSchemaBuilder get fight => _$this._fight ??= new FightSchemaBuilder();
  set fight(FightSchemaBuilder? fight) => _$this._fight = fight;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  CharacterFightDataSchemaBuilder() {
    CharacterFightDataSchema._defaults(this);
  }

  CharacterFightDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _fight = $v.fight.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterFightDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterFightDataSchema;
  }

  @override
  void update(void Function(CharacterFightDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterFightDataSchema build() => _build();

  _$CharacterFightDataSchema _build() {
    _$CharacterFightDataSchema _$result;
    try {
      _$result = _$v ??
          new _$CharacterFightDataSchema._(
              cooldown: cooldown.build(),
              fight: fight.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'fight';
        fight.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterFightDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
