// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycling_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecyclingDataSchema extends RecyclingDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final RecyclingItemsSchema details;
  @override
  final CharacterSchema character;

  factory _$RecyclingDataSchema(
          [void Function(RecyclingDataSchemaBuilder)? updates]) =>
      (new RecyclingDataSchemaBuilder()..update(updates))._build();

  _$RecyclingDataSchema._(
      {required this.cooldown, required this.details, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'RecyclingDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        details, r'RecyclingDataSchema', 'details');
    BuiltValueNullFieldError.checkNotNull(
        character, r'RecyclingDataSchema', 'character');
  }

  @override
  RecyclingDataSchema rebuild(
          void Function(RecyclingDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecyclingDataSchemaBuilder toBuilder() =>
      new RecyclingDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecyclingDataSchema &&
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
    return (newBuiltValueToStringHelper(r'RecyclingDataSchema')
          ..add('cooldown', cooldown)
          ..add('details', details)
          ..add('character', character))
        .toString();
  }
}

class RecyclingDataSchemaBuilder
    implements Builder<RecyclingDataSchema, RecyclingDataSchemaBuilder> {
  _$RecyclingDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  RecyclingItemsSchemaBuilder? _details;
  RecyclingItemsSchemaBuilder get details =>
      _$this._details ??= new RecyclingItemsSchemaBuilder();
  set details(RecyclingItemsSchemaBuilder? details) =>
      _$this._details = details;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  RecyclingDataSchemaBuilder() {
    RecyclingDataSchema._defaults(this);
  }

  RecyclingDataSchemaBuilder get _$this {
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
  void replace(RecyclingDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecyclingDataSchema;
  }

  @override
  void update(void Function(RecyclingDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecyclingDataSchema build() => _build();

  _$RecyclingDataSchema _build() {
    _$RecyclingDataSchema _$result;
    try {
      _$result = _$v ??
          new _$RecyclingDataSchema._(
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
            r'RecyclingDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
