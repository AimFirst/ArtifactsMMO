// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_rest_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterRestDataSchema extends CharacterRestDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final int hpRestored;
  @override
  final CharacterSchema character;

  factory _$CharacterRestDataSchema(
          [void Function(CharacterRestDataSchemaBuilder)? updates]) =>
      (new CharacterRestDataSchemaBuilder()..update(updates))._build();

  _$CharacterRestDataSchema._(
      {required this.cooldown,
      required this.hpRestored,
      required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'CharacterRestDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        hpRestored, r'CharacterRestDataSchema', 'hpRestored');
    BuiltValueNullFieldError.checkNotNull(
        character, r'CharacterRestDataSchema', 'character');
  }

  @override
  CharacterRestDataSchema rebuild(
          void Function(CharacterRestDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterRestDataSchemaBuilder toBuilder() =>
      new CharacterRestDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterRestDataSchema &&
        cooldown == other.cooldown &&
        hpRestored == other.hpRestored &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, hpRestored.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterRestDataSchema')
          ..add('cooldown', cooldown)
          ..add('hpRestored', hpRestored)
          ..add('character', character))
        .toString();
  }
}

class CharacterRestDataSchemaBuilder
    implements
        Builder<CharacterRestDataSchema, CharacterRestDataSchemaBuilder> {
  _$CharacterRestDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  int? _hpRestored;
  int? get hpRestored => _$this._hpRestored;
  set hpRestored(int? hpRestored) => _$this._hpRestored = hpRestored;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  CharacterRestDataSchemaBuilder() {
    CharacterRestDataSchema._defaults(this);
  }

  CharacterRestDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _hpRestored = $v.hpRestored;
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterRestDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterRestDataSchema;
  }

  @override
  void update(void Function(CharacterRestDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterRestDataSchema build() => _build();

  _$CharacterRestDataSchema _build() {
    _$CharacterRestDataSchema _$result;
    try {
      _$result = _$v ??
          new _$CharacterRestDataSchema._(
              cooldown: cooldown.build(),
              hpRestored: BuiltValueNullFieldError.checkNotNull(
                  hpRestored, r'CharacterRestDataSchema', 'hpRestored'),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();

        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterRestDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
