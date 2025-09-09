// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_extension_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankExtensionTransactionSchema extends BankExtensionTransactionSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final BankExtensionSchema transaction;
  @override
  final CharacterSchema character;

  factory _$BankExtensionTransactionSchema(
          [void Function(BankExtensionTransactionSchemaBuilder)? updates]) =>
      (new BankExtensionTransactionSchemaBuilder()..update(updates))._build();

  _$BankExtensionTransactionSchema._(
      {required this.cooldown,
      required this.transaction,
      required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'BankExtensionTransactionSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        transaction, r'BankExtensionTransactionSchema', 'transaction');
    BuiltValueNullFieldError.checkNotNull(
        character, r'BankExtensionTransactionSchema', 'character');
  }

  @override
  BankExtensionTransactionSchema rebuild(
          void Function(BankExtensionTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankExtensionTransactionSchemaBuilder toBuilder() =>
      new BankExtensionTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankExtensionTransactionSchema &&
        cooldown == other.cooldown &&
        transaction == other.transaction &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, transaction.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankExtensionTransactionSchema')
          ..add('cooldown', cooldown)
          ..add('transaction', transaction)
          ..add('character', character))
        .toString();
  }
}

class BankExtensionTransactionSchemaBuilder
    implements
        Builder<BankExtensionTransactionSchema,
            BankExtensionTransactionSchemaBuilder> {
  _$BankExtensionTransactionSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  BankExtensionSchemaBuilder? _transaction;
  BankExtensionSchemaBuilder get transaction =>
      _$this._transaction ??= new BankExtensionSchemaBuilder();
  set transaction(BankExtensionSchemaBuilder? transaction) =>
      _$this._transaction = transaction;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  BankExtensionTransactionSchemaBuilder() {
    BankExtensionTransactionSchema._defaults(this);
  }

  BankExtensionTransactionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _transaction = $v.transaction.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankExtensionTransactionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankExtensionTransactionSchema;
  }

  @override
  void update(void Function(BankExtensionTransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankExtensionTransactionSchema build() => _build();

  _$BankExtensionTransactionSchema _build() {
    _$BankExtensionTransactionSchema _$result;
    try {
      _$result = _$v ??
          new _$BankExtensionTransactionSchema._(
              cooldown: cooldown.build(),
              transaction: transaction.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'transaction';
        transaction.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BankExtensionTransactionSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
