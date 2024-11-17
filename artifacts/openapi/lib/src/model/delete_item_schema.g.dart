// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_item_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteItemSchema extends DeleteItemSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final SimpleItemSchema item;
  @override
  final CharacterSchema character;

  factory _$DeleteItemSchema(
          [void Function(DeleteItemSchemaBuilder)? updates]) =>
      (new DeleteItemSchemaBuilder()..update(updates))._build();

  _$DeleteItemSchema._(
      {required this.cooldown, required this.item, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'DeleteItemSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(item, r'DeleteItemSchema', 'item');
    BuiltValueNullFieldError.checkNotNull(
        character, r'DeleteItemSchema', 'character');
  }

  @override
  DeleteItemSchema rebuild(void Function(DeleteItemSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteItemSchemaBuilder toBuilder() =>
      new DeleteItemSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteItemSchema &&
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
    return (newBuiltValueToStringHelper(r'DeleteItemSchema')
          ..add('cooldown', cooldown)
          ..add('item', item)
          ..add('character', character))
        .toString();
  }
}

class DeleteItemSchemaBuilder
    implements Builder<DeleteItemSchema, DeleteItemSchemaBuilder> {
  _$DeleteItemSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  SimpleItemSchemaBuilder? _item;
  SimpleItemSchemaBuilder get item =>
      _$this._item ??= new SimpleItemSchemaBuilder();
  set item(SimpleItemSchemaBuilder? item) => _$this._item = item;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  DeleteItemSchemaBuilder() {
    DeleteItemSchema._defaults(this);
  }

  DeleteItemSchemaBuilder get _$this {
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
  void replace(DeleteItemSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteItemSchema;
  }

  @override
  void update(void Function(DeleteItemSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteItemSchema build() => _build();

  _$DeleteItemSchema _build() {
    _$DeleteItemSchema _$result;
    try {
      _$result = _$v ??
          new _$DeleteItemSchema._(
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
            r'DeleteItemSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
