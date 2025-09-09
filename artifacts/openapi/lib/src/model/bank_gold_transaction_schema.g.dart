// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_gold_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankGoldTransactionSchema extends BankGoldTransactionSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final GoldSchema bank;
  @override
  final CharacterSchema character;

  factory _$BankGoldTransactionSchema(
          [void Function(BankGoldTransactionSchemaBuilder)? updates]) =>
      (new BankGoldTransactionSchemaBuilder()..update(updates))._build();

  _$BankGoldTransactionSchema._(
      {required this.cooldown, required this.bank, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'BankGoldTransactionSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        bank, r'BankGoldTransactionSchema', 'bank');
    BuiltValueNullFieldError.checkNotNull(
        character, r'BankGoldTransactionSchema', 'character');
  }

  @override
  BankGoldTransactionSchema rebuild(
          void Function(BankGoldTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankGoldTransactionSchemaBuilder toBuilder() =>
      new BankGoldTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankGoldTransactionSchema &&
        cooldown == other.cooldown &&
        bank == other.bank &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, bank.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankGoldTransactionSchema')
          ..add('cooldown', cooldown)
          ..add('bank', bank)
          ..add('character', character))
        .toString();
  }
}

class BankGoldTransactionSchemaBuilder
    implements
        Builder<BankGoldTransactionSchema, BankGoldTransactionSchemaBuilder> {
  _$BankGoldTransactionSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  GoldSchemaBuilder? _bank;
  GoldSchemaBuilder get bank => _$this._bank ??= new GoldSchemaBuilder();
  set bank(GoldSchemaBuilder? bank) => _$this._bank = bank;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  BankGoldTransactionSchemaBuilder() {
    BankGoldTransactionSchema._defaults(this);
  }

  BankGoldTransactionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _bank = $v.bank.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankGoldTransactionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankGoldTransactionSchema;
  }

  @override
  void update(void Function(BankGoldTransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankGoldTransactionSchema build() => _build();

  _$BankGoldTransactionSchema _build() {
    _$BankGoldTransactionSchema _$result;
    try {
      _$result = _$v ??
          new _$BankGoldTransactionSchema._(
              cooldown: cooldown.build(),
              bank: bank.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'bank';
        bank.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankGoldTransactionSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
