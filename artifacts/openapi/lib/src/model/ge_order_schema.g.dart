// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_order_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GEOrderSchema extends GEOrderSchema {
  @override
  final String id;
  @override
  final String seller;
  @override
  final String code;
  @override
  final int quantity;
  @override
  final int price;
  @override
  final DateTime createdAt;

  factory _$GEOrderSchema([void Function(GEOrderSchemaBuilder)? updates]) =>
      (new GEOrderSchemaBuilder()..update(updates))._build();

  _$GEOrderSchema._(
      {required this.id,
      required this.seller,
      required this.code,
      required this.quantity,
      required this.price,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GEOrderSchema', 'id');
    BuiltValueNullFieldError.checkNotNull(seller, r'GEOrderSchema', 'seller');
    BuiltValueNullFieldError.checkNotNull(code, r'GEOrderSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GEOrderSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(price, r'GEOrderSchema', 'price');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GEOrderSchema', 'createdAt');
  }

  @override
  GEOrderSchema rebuild(void Function(GEOrderSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEOrderSchemaBuilder toBuilder() => new GEOrderSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEOrderSchema &&
        id == other.id &&
        seller == other.seller &&
        code == other.code &&
        quantity == other.quantity &&
        price == other.price &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, seller.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GEOrderSchema')
          ..add('id', id)
          ..add('seller', seller)
          ..add('code', code)
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GEOrderSchemaBuilder
    implements Builder<GEOrderSchema, GEOrderSchemaBuilder> {
  _$GEOrderSchema? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _seller;
  String? get seller => _$this._seller;
  set seller(String? seller) => _$this._seller = seller;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  GEOrderSchemaBuilder() {
    GEOrderSchema._defaults(this);
  }

  GEOrderSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _seller = $v.seller;
      _code = $v.code;
      _quantity = $v.quantity;
      _price = $v.price;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEOrderSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEOrderSchema;
  }

  @override
  void update(void Function(GEOrderSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEOrderSchema build() => _build();

  _$GEOrderSchema _build() {
    final _$result = _$v ??
        new _$GEOrderSchema._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GEOrderSchema', 'id'),
            seller: BuiltValueNullFieldError.checkNotNull(
                seller, r'GEOrderSchema', 'seller'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GEOrderSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GEOrderSchema', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'GEOrderSchema', 'price'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GEOrderSchema', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
