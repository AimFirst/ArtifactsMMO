// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_item_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveItemDataSchema extends GiveItemDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final BuiltList<SimpleItemSchema> items;
  @override
  final CharacterSchema receiverCharacter;
  @override
  final CharacterSchema character;

  factory _$GiveItemDataSchema(
          [void Function(GiveItemDataSchemaBuilder)? updates]) =>
      (GiveItemDataSchemaBuilder()..update(updates))._build();

  _$GiveItemDataSchema._(
      {required this.cooldown,
      required this.items,
      required this.receiverCharacter,
      required this.character})
      : super._();
  @override
  GiveItemDataSchema rebuild(
          void Function(GiveItemDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveItemDataSchemaBuilder toBuilder() =>
      GiveItemDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveItemDataSchema &&
        cooldown == other.cooldown &&
        items == other.items &&
        receiverCharacter == other.receiverCharacter &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, receiverCharacter.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiveItemDataSchema')
          ..add('cooldown', cooldown)
          ..add('items', items)
          ..add('receiverCharacter', receiverCharacter)
          ..add('character', character))
        .toString();
  }
}

class GiveItemDataSchemaBuilder
    implements Builder<GiveItemDataSchema, GiveItemDataSchemaBuilder> {
  _$GiveItemDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  ListBuilder<SimpleItemSchema>? _items;
  ListBuilder<SimpleItemSchema> get items =>
      _$this._items ??= ListBuilder<SimpleItemSchema>();
  set items(ListBuilder<SimpleItemSchema>? items) => _$this._items = items;

  CharacterSchemaBuilder? _receiverCharacter;
  CharacterSchemaBuilder get receiverCharacter =>
      _$this._receiverCharacter ??= CharacterSchemaBuilder();
  set receiverCharacter(CharacterSchemaBuilder? receiverCharacter) =>
      _$this._receiverCharacter = receiverCharacter;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  GiveItemDataSchemaBuilder() {
    GiveItemDataSchema._defaults(this);
  }

  GiveItemDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _items = $v.items.toBuilder();
      _receiverCharacter = $v.receiverCharacter.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveItemDataSchema other) {
    _$v = other as _$GiveItemDataSchema;
  }

  @override
  void update(void Function(GiveItemDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveItemDataSchema build() => _build();

  _$GiveItemDataSchema _build() {
    _$GiveItemDataSchema _$result;
    try {
      _$result = _$v ??
          _$GiveItemDataSchema._(
            cooldown: cooldown.build(),
            items: items.build(),
            receiverCharacter: receiverCharacter.build(),
            character: character.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'items';
        items.build();
        _$failedField = 'receiverCharacter';
        receiverCharacter.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GiveItemDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
