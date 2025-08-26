// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_merchant_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NpcMerchantTransactionSchema extends NpcMerchantTransactionSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final NpcItemTransactionSchema transaction;
  @override
  final CharacterSchema character;

  factory _$NpcMerchantTransactionSchema(
          [void Function(NpcMerchantTransactionSchemaBuilder)? updates]) =>
      (NpcMerchantTransactionSchemaBuilder()..update(updates))._build();

  _$NpcMerchantTransactionSchema._(
      {required this.cooldown,
      required this.transaction,
      required this.character})
      : super._();
  @override
  NpcMerchantTransactionSchema rebuild(
          void Function(NpcMerchantTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NpcMerchantTransactionSchemaBuilder toBuilder() =>
      NpcMerchantTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NpcMerchantTransactionSchema &&
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
    return (newBuiltValueToStringHelper(r'NpcMerchantTransactionSchema')
          ..add('cooldown', cooldown)
          ..add('transaction', transaction)
          ..add('character', character))
        .toString();
  }
}

class NpcMerchantTransactionSchemaBuilder
    implements
        Builder<NpcMerchantTransactionSchema,
            NpcMerchantTransactionSchemaBuilder> {
  _$NpcMerchantTransactionSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  NpcItemTransactionSchemaBuilder? _transaction;
  NpcItemTransactionSchemaBuilder get transaction =>
      _$this._transaction ??= NpcItemTransactionSchemaBuilder();
  set transaction(NpcItemTransactionSchemaBuilder? transaction) =>
      _$this._transaction = transaction;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  NpcMerchantTransactionSchemaBuilder() {
    NpcMerchantTransactionSchema._defaults(this);
  }

  NpcMerchantTransactionSchemaBuilder get _$this {
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
  void replace(NpcMerchantTransactionSchema other) {
    _$v = other as _$NpcMerchantTransactionSchema;
  }

  @override
  void update(void Function(NpcMerchantTransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NpcMerchantTransactionSchema build() => _build();

  _$NpcMerchantTransactionSchema _build() {
    _$NpcMerchantTransactionSchema _$result;
    try {
      _$result = _$v ??
          _$NpcMerchantTransactionSchema._(
            cooldown: cooldown.build(),
            transaction: transaction.build(),
            character: character.build(),
          );
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
        throw BuiltValueNestedFieldError(
            r'NpcMerchantTransactionSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
