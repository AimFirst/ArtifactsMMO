// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_gold_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveGoldDataSchema extends GiveGoldDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final int quantity;
  @override
  final CharacterSchema receiverCharacter;
  @override
  final CharacterSchema character;

  factory _$GiveGoldDataSchema(
          [void Function(GiveGoldDataSchemaBuilder)? updates]) =>
      (new GiveGoldDataSchemaBuilder()..update(updates))._build();

  _$GiveGoldDataSchema._(
      {required this.cooldown,
      required this.quantity,
      required this.receiverCharacter,
      required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'GiveGoldDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GiveGoldDataSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        receiverCharacter, r'GiveGoldDataSchema', 'receiverCharacter');
    BuiltValueNullFieldError.checkNotNull(
        character, r'GiveGoldDataSchema', 'character');
  }

  @override
  GiveGoldDataSchema rebuild(
          void Function(GiveGoldDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveGoldDataSchemaBuilder toBuilder() =>
      new GiveGoldDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveGoldDataSchema &&
        cooldown == other.cooldown &&
        quantity == other.quantity &&
        receiverCharacter == other.receiverCharacter &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, receiverCharacter.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiveGoldDataSchema')
          ..add('cooldown', cooldown)
          ..add('quantity', quantity)
          ..add('receiverCharacter', receiverCharacter)
          ..add('character', character))
        .toString();
  }
}

class GiveGoldDataSchemaBuilder
    implements Builder<GiveGoldDataSchema, GiveGoldDataSchemaBuilder> {
  _$GiveGoldDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  CharacterSchemaBuilder? _receiverCharacter;
  CharacterSchemaBuilder get receiverCharacter =>
      _$this._receiverCharacter ??= new CharacterSchemaBuilder();
  set receiverCharacter(CharacterSchemaBuilder? receiverCharacter) =>
      _$this._receiverCharacter = receiverCharacter;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  GiveGoldDataSchemaBuilder() {
    GiveGoldDataSchema._defaults(this);
  }

  GiveGoldDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _quantity = $v.quantity;
      _receiverCharacter = $v.receiverCharacter.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveGoldDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveGoldDataSchema;
  }

  @override
  void update(void Function(GiveGoldDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveGoldDataSchema build() => _build();

  _$GiveGoldDataSchema _build() {
    _$GiveGoldDataSchema _$result;
    try {
      _$result = _$v ??
          new _$GiveGoldDataSchema._(
              cooldown: cooldown.build(),
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, r'GiveGoldDataSchema', 'quantity'),
              receiverCharacter: receiverCharacter.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();

        _$failedField = 'receiverCharacter';
        receiverCharacter.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GiveGoldDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
