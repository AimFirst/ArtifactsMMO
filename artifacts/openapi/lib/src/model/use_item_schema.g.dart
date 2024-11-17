// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_item_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UseItemSchema extends UseItemSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final ItemSchema item;
  @override
  final CharacterSchema character;

  factory _$UseItemSchema([void Function(UseItemSchemaBuilder)? updates]) =>
      (new UseItemSchemaBuilder()..update(updates))._build();

  _$UseItemSchema._(
      {required this.cooldown, required this.item, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'UseItemSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(item, r'UseItemSchema', 'item');
    BuiltValueNullFieldError.checkNotNull(
        character, r'UseItemSchema', 'character');
  }

  @override
  UseItemSchema rebuild(void Function(UseItemSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UseItemSchemaBuilder toBuilder() => new UseItemSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UseItemSchema &&
        cooldown == other.cooldown &&
        item == other.item &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UseItemSchema')
          ..add('cooldown', cooldown)
          ..add('item', item)
          ..add('character', character))
        .toString();
  }
}

class UseItemSchemaBuilder
    implements Builder<UseItemSchema, UseItemSchemaBuilder> {
  _$UseItemSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  ItemSchemaBuilder? _item;
  ItemSchemaBuilder get item => _$this._item ??= new ItemSchemaBuilder();
  set item(ItemSchemaBuilder? item) => _$this._item = item;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  UseItemSchemaBuilder() {
    UseItemSchema._defaults(this);
  }

  UseItemSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _item = $v.item.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UseItemSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UseItemSchema;
  }

  @override
  void update(void Function(UseItemSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UseItemSchema build() => _build();

  _$UseItemSchema _build() {
    _$UseItemSchema _$result;
    try {
      _$result = _$v ??
          new _$UseItemSchema._(
              cooldown: cooldown.build(),
              item: item.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'item';
        item.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UseItemSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
