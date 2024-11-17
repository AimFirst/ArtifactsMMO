// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_order_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GEOrderTransactionSchema extends GEOrderTransactionSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final GEOrderCreatedSchema order;
  @override
  final CharacterSchema character;

  factory _$GEOrderTransactionSchema(
          [void Function(GEOrderTransactionSchemaBuilder)? updates]) =>
      (new GEOrderTransactionSchemaBuilder()..update(updates))._build();

  _$GEOrderTransactionSchema._(
      {required this.cooldown, required this.order, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'GEOrderTransactionSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        order, r'GEOrderTransactionSchema', 'order');
    BuiltValueNullFieldError.checkNotNull(
        character, r'GEOrderTransactionSchema', 'character');
  }

  @override
  GEOrderTransactionSchema rebuild(
          void Function(GEOrderTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEOrderTransactionSchemaBuilder toBuilder() =>
      new GEOrderTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEOrderTransactionSchema &&
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
    return (newBuiltValueToStringHelper(r'GEOrderTransactionSchema')
          ..add('cooldown', cooldown)
          ..add('order', order)
          ..add('character', character))
        .toString();
  }
}

class GEOrderTransactionSchemaBuilder
    implements
        Builder<GEOrderTransactionSchema, GEOrderTransactionSchemaBuilder> {
  _$GEOrderTransactionSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  GEOrderCreatedSchemaBuilder? _order;
  GEOrderCreatedSchemaBuilder get order =>
      _$this._order ??= new GEOrderCreatedSchemaBuilder();
  set order(GEOrderCreatedSchemaBuilder? order) => _$this._order = order;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  GEOrderTransactionSchemaBuilder() {
    GEOrderTransactionSchema._defaults(this);
  }

  GEOrderTransactionSchemaBuilder get _$this {
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
  void replace(GEOrderTransactionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEOrderTransactionSchema;
  }

  @override
  void update(void Function(GEOrderTransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEOrderTransactionSchema build() => _build();

  _$GEOrderTransactionSchema _build() {
    _$GEOrderTransactionSchema _$result;
    try {
      _$result = _$v ??
          new _$GEOrderTransactionSchema._(
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
            r'GEOrderTransactionSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
