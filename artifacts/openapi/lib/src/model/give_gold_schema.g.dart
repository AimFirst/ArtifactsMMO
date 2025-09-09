// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_gold_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveGoldSchema extends GiveGoldSchema {
  @override
  final int quantity;
  @override
  final String character;

  factory _$GiveGoldSchema([void Function(GiveGoldSchemaBuilder)? updates]) =>
      (new GiveGoldSchemaBuilder()..update(updates))._build();

  _$GiveGoldSchema._({required this.quantity, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GiveGoldSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        character, r'GiveGoldSchema', 'character');
  }

  @override
  GiveGoldSchema rebuild(void Function(GiveGoldSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveGoldSchemaBuilder toBuilder() =>
      new GiveGoldSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveGoldSchema &&
        quantity == other.quantity &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiveGoldSchema')
          ..add('quantity', quantity)
          ..add('character', character))
        .toString();
  }
}

class GiveGoldSchemaBuilder
    implements Builder<GiveGoldSchema, GiveGoldSchemaBuilder> {
  _$GiveGoldSchema? _$v;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  String? _character;
  String? get character => _$this._character;
  set character(String? character) => _$this._character = character;

  GiveGoldSchemaBuilder() {
    GiveGoldSchema._defaults(this);
  }

  GiveGoldSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _character = $v.character;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveGoldSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveGoldSchema;
  }

  @override
  void update(void Function(GiveGoldSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveGoldSchema build() => _build();

  _$GiveGoldSchema _build() {
    final _$result = _$v ??
        new _$GiveGoldSchema._(
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GiveGoldSchema', 'quantity'),
            character: BuiltValueNullFieldError.checkNotNull(
                character, r'GiveGoldSchema', 'character'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
