// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_transaction_list_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GETransactionListSchema extends GETransactionListSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final GETransactionSchema order;
  @override
  final CharacterSchema character;

  factory _$GETransactionListSchema(
          [void Function(GETransactionListSchemaBuilder)? updates]) =>
      (new GETransactionListSchemaBuilder()..update(updates))._build();

  _$GETransactionListSchema._(
      {required this.cooldown, required this.order, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'GETransactionListSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        order, r'GETransactionListSchema', 'order');
    BuiltValueNullFieldError.checkNotNull(
        character, r'GETransactionListSchema', 'character');
  }

  @override
  GETransactionListSchema rebuild(
          void Function(GETransactionListSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GETransactionListSchemaBuilder toBuilder() =>
      new GETransactionListSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GETransactionListSchema &&
        cooldown == other.cooldown &&
        order == other.order &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GETransactionListSchema')
          ..add('cooldown', cooldown)
          ..add('order', order)
          ..add('character', character))
        .toString();
  }
}

class GETransactionListSchemaBuilder
    implements
        Builder<GETransactionListSchema, GETransactionListSchemaBuilder> {
  _$GETransactionListSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  GETransactionSchemaBuilder? _order;
  GETransactionSchemaBuilder get order =>
      _$this._order ??= new GETransactionSchemaBuilder();
  set order(GETransactionSchemaBuilder? order) => _$this._order = order;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  GETransactionListSchemaBuilder() {
    GETransactionListSchema._defaults(this);
  }

  GETransactionListSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _order = $v.order.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GETransactionListSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GETransactionListSchema;
  }

  @override
  void update(void Function(GETransactionListSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GETransactionListSchema build() => _build();

  _$GETransactionListSchema _build() {
    _$GETransactionListSchema _$result;
    try {
      _$result = _$v ??
          new _$GETransactionListSchema._(
              cooldown: cooldown.build(),
              order: order.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'order';
        order.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GETransactionListSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
