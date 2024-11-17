// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_item_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankItemTransactionSchema extends BankItemTransactionSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final ItemSchema item;
  @override
  final BuiltList<SimpleItemSchema> bank;
  @override
  final CharacterSchema character;

  factory _$BankItemTransactionSchema(
          [void Function(BankItemTransactionSchemaBuilder)? updates]) =>
      (new BankItemTransactionSchemaBuilder()..update(updates))._build();

  _$BankItemTransactionSchema._(
      {required this.cooldown,
      required this.item,
      required this.bank,
      required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'BankItemTransactionSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        item, r'BankItemTransactionSchema', 'item');
    BuiltValueNullFieldError.checkNotNull(
        bank, r'BankItemTransactionSchema', 'bank');
    BuiltValueNullFieldError.checkNotNull(
        character, r'BankItemTransactionSchema', 'character');
  }

  @override
  BankItemTransactionSchema rebuild(
          void Function(BankItemTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankItemTransactionSchemaBuilder toBuilder() =>
      new BankItemTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankItemTransactionSchema &&
        cooldown == other.cooldown &&
        item == other.item &&
        bank == other.bank &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, bank.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankItemTransactionSchema')
          ..add('cooldown', cooldown)
          ..add('item', item)
          ..add('bank', bank)
          ..add('character', character))
        .toString();
  }
}

class BankItemTransactionSchemaBuilder
    implements
        Builder<BankItemTransactionSchema, BankItemTransactionSchemaBuilder> {
  _$BankItemTransactionSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  ItemSchemaBuilder? _item;
  ItemSchemaBuilder get item => _$this._item ??= new ItemSchemaBuilder();
  set item(ItemSchemaBuilder? item) => _$this._item = item;

  ListBuilder<SimpleItemSchema>? _bank;
  ListBuilder<SimpleItemSchema> get bank =>
      _$this._bank ??= new ListBuilder<SimpleItemSchema>();
  set bank(ListBuilder<SimpleItemSchema>? bank) => _$this._bank = bank;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  BankItemTransactionSchemaBuilder() {
    BankItemTransactionSchema._defaults(this);
  }

  BankItemTransactionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _item = $v.item.toBuilder();
      _bank = $v.bank.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankItemTransactionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankItemTransactionSchema;
  }

  @override
  void update(void Function(BankItemTransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankItemTransactionSchema build() => _build();

  _$BankItemTransactionSchema _build() {
    _$BankItemTransactionSchema _$result;
    try {
      _$result = _$v ??
          new _$BankItemTransactionSchema._(
              cooldown: cooldown.build(),
              item: item.build(),
              bank: bank.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'item';
        item.build();
        _$failedField = 'bank';
        bank.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankItemTransactionSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
