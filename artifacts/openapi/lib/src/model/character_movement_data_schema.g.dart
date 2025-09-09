// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_movement_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterMovementDataSchema extends CharacterMovementDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final MapSchema destination;
  @override
  final CharacterSchema character;

  factory _$CharacterMovementDataSchema(
          [void Function(CharacterMovementDataSchemaBuilder)? updates]) =>
      (new CharacterMovementDataSchemaBuilder()..update(updates))._build();

  _$CharacterMovementDataSchema._(
      {required this.cooldown,
      required this.destination,
      required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'CharacterMovementDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        destination, r'CharacterMovementDataSchema', 'destination');
    BuiltValueNullFieldError.checkNotNull(
        character, r'CharacterMovementDataSchema', 'character');
  }

  @override
  CharacterMovementDataSchema rebuild(
          void Function(CharacterMovementDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterMovementDataSchemaBuilder toBuilder() =>
      new CharacterMovementDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterMovementDataSchema &&
        cooldown == other.cooldown &&
        destination == other.destination &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, destination.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterMovementDataSchema')
          ..add('cooldown', cooldown)
          ..add('destination', destination)
          ..add('character', character))
        .toString();
  }
}

class CharacterMovementDataSchemaBuilder
    implements
        Builder<CharacterMovementDataSchema,
            CharacterMovementDataSchemaBuilder> {
  _$CharacterMovementDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  MapSchemaBuilder? _destination;
  MapSchemaBuilder get destination =>
      _$this._destination ??= new MapSchemaBuilder();
  set destination(MapSchemaBuilder? destination) =>
      _$this._destination = destination;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  CharacterMovementDataSchemaBuilder() {
    CharacterMovementDataSchema._defaults(this);
  }

  CharacterMovementDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _destination = $v.destination.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterMovementDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterMovementDataSchema;
  }

  @override
  void update(void Function(CharacterMovementDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterMovementDataSchema build() => _build();

  _$CharacterMovementDataSchema _build() {
    _$CharacterMovementDataSchema _$result;
    try {
      _$result = _$v ??
          new _$CharacterMovementDataSchema._(
              cooldown: cooldown.build(),
              destination: destination.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'destination';
        destination.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterMovementDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
