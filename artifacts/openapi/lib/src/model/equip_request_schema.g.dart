// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equip_request_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EquipRequestSchema extends EquipRequestSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final ItemSlot slot;
  @override
  final ItemSchema item;
  @override
  final CharacterSchema character;

  factory _$EquipRequestSchema(
          [void Function(EquipRequestSchemaBuilder)? updates]) =>
      (new EquipRequestSchemaBuilder()..update(updates))._build();

  _$EquipRequestSchema._(
      {required this.cooldown,
      required this.slot,
      required this.item,
      required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'EquipRequestSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(slot, r'EquipRequestSchema', 'slot');
    BuiltValueNullFieldError.checkNotNull(item, r'EquipRequestSchema', 'item');
    BuiltValueNullFieldError.checkNotNull(
        character, r'EquipRequestSchema', 'character');
  }

  @override
  EquipRequestSchema rebuild(
          void Function(EquipRequestSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EquipRequestSchemaBuilder toBuilder() =>
      new EquipRequestSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EquipRequestSchema &&
        cooldown == other.cooldown &&
        slot == other.slot &&
        item == other.item &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, slot.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EquipRequestSchema')
          ..add('cooldown', cooldown)
          ..add('slot', slot)
          ..add('item', item)
          ..add('character', character))
        .toString();
  }
}

class EquipRequestSchemaBuilder
    implements Builder<EquipRequestSchema, EquipRequestSchemaBuilder> {
  _$EquipRequestSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  ItemSlot? _slot;
  ItemSlot? get slot => _$this._slot;
  set slot(ItemSlot? slot) => _$this._slot = slot;

  ItemSchemaBuilder? _item;
  ItemSchemaBuilder get item => _$this._item ??= new ItemSchemaBuilder();
  set item(ItemSchemaBuilder? item) => _$this._item = item;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  EquipRequestSchemaBuilder() {
    EquipRequestSchema._defaults(this);
  }

  EquipRequestSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _slot = $v.slot;
      _item = $v.item.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EquipRequestSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EquipRequestSchema;
  }

  @override
  void update(void Function(EquipRequestSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EquipRequestSchema build() => _build();

  _$EquipRequestSchema _build() {
    _$EquipRequestSchema _$result;
    try {
      _$result = _$v ??
          new _$EquipRequestSchema._(
              cooldown: cooldown.build(),
              slot: BuiltValueNullFieldError.checkNotNull(
                  slot, r'EquipRequestSchema', 'slot'),
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
            r'EquipRequestSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
