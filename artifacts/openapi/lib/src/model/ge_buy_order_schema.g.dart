// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_buy_order_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GEBuyOrderSchema extends GEBuyOrderSchema {
  @override
  final String id;
  @override
  final int quantity;

  factory _$GEBuyOrderSchema(
          [void Function(GEBuyOrderSchemaBuilder)? updates]) =>
      (new GEBuyOrderSchemaBuilder()..update(updates))._build();

  _$GEBuyOrderSchema._({required this.id, required this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GEBuyOrderSchema', 'id');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GEBuyOrderSchema', 'quantity');
  }

  @override
  GEBuyOrderSchema rebuild(void Function(GEBuyOrderSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEBuyOrderSchemaBuilder toBuilder() =>
      new GEBuyOrderSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEBuyOrderSchema &&
        id == other.id &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GEBuyOrderSchema')
          ..add('id', id)
          ..add('quantity', quantity))
        .toString();
  }
}

class GEBuyOrderSchemaBuilder
    implements Builder<GEBuyOrderSchema, GEBuyOrderSchemaBuilder> {
  _$GEBuyOrderSchema? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  GEBuyOrderSchemaBuilder() {
    GEBuyOrderSchema._defaults(this);
  }

  GEBuyOrderSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEBuyOrderSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEBuyOrderSchema;
  }

  @override
  void update(void Function(GEBuyOrderSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEBuyOrderSchema build() => _build();

  _$GEBuyOrderSchema _build() {
    final _$result = _$v ??
        new _$GEBuyOrderSchema._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GEBuyOrderSchema', 'id'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GEBuyOrderSchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
