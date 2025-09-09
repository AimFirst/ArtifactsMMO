// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_skin_character_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeSkinCharacterDataSchema extends ChangeSkinCharacterDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final String skin;
  @override
  final CharacterSchema character;

  factory _$ChangeSkinCharacterDataSchema(
          [void Function(ChangeSkinCharacterDataSchemaBuilder)? updates]) =>
      (new ChangeSkinCharacterDataSchemaBuilder()..update(updates))._build();

  _$ChangeSkinCharacterDataSchema._(
      {required this.cooldown, required this.skin, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'ChangeSkinCharacterDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        skin, r'ChangeSkinCharacterDataSchema', 'skin');
    BuiltValueNullFieldError.checkNotNull(
        character, r'ChangeSkinCharacterDataSchema', 'character');
  }

  @override
  ChangeSkinCharacterDataSchema rebuild(
          void Function(ChangeSkinCharacterDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeSkinCharacterDataSchemaBuilder toBuilder() =>
      new ChangeSkinCharacterDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeSkinCharacterDataSchema &&
        cooldown == other.cooldown &&
        skin == other.skin &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, skin.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeSkinCharacterDataSchema')
          ..add('cooldown', cooldown)
          ..add('skin', skin)
          ..add('character', character))
        .toString();
  }
}

class ChangeSkinCharacterDataSchemaBuilder
    implements
        Builder<ChangeSkinCharacterDataSchema,
            ChangeSkinCharacterDataSchemaBuilder> {
  _$ChangeSkinCharacterDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  String? _skin;
  String? get skin => _$this._skin;
  set skin(String? skin) => _$this._skin = skin;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  ChangeSkinCharacterDataSchemaBuilder() {
    ChangeSkinCharacterDataSchema._defaults(this);
  }

  ChangeSkinCharacterDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _skin = $v.skin;
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeSkinCharacterDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeSkinCharacterDataSchema;
  }

  @override
  void update(void Function(ChangeSkinCharacterDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeSkinCharacterDataSchema build() => _build();

  _$ChangeSkinCharacterDataSchema _build() {
    _$ChangeSkinCharacterDataSchema _$result;
    try {
      _$result = _$v ??
          new _$ChangeSkinCharacterDataSchema._(
              cooldown: cooldown.build(),
              skin: BuiltValueNullFieldError.checkNotNull(
                  skin, r'ChangeSkinCharacterDataSchema', 'skin'),
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
            r'ChangeSkinCharacterDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
