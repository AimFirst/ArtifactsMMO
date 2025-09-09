// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_order_created_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GEOrderCreatedSchema extends GEOrderCreatedSchema {
  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String code;
  @override
  final int quantity;
  @override
  final int price;
  @override
  final int totalPrice;
  @override
  final int tax;

  factory _$GEOrderCreatedSchema(
          [void Function(GEOrderCreatedSchemaBuilder)? updates]) =>
      (new GEOrderCreatedSchemaBuilder()..update(updates))._build();

  _$GEOrderCreatedSchema._(
      {required this.id,
      required this.createdAt,
      required this.code,
      required this.quantity,
      required this.price,
      required this.totalPrice,
      required this.tax})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GEOrderCreatedSchema', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GEOrderCreatedSchema', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        code, r'GEOrderCreatedSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GEOrderCreatedSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GEOrderCreatedSchema', 'price');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, r'GEOrderCreatedSchema', 'totalPrice');
    BuiltValueNullFieldError.checkNotNull(tax, r'GEOrderCreatedSchema', 'tax');
  }

  @override
  GEOrderCreatedSchema rebuild(
          void Function(GEOrderCreatedSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEOrderCreatedSchemaBuilder toBuilder() =>
      new GEOrderCreatedSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEOrderCreatedSchema &&
        id == other.id &&
        createdAt == other.createdAt &&
        code == other.code &&
        quantity == other.quantity &&
        price == other.price &&
        totalPrice == other.totalPrice &&
        tax == other.tax;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jc(_$hash, tax.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GEOrderCreatedSchema')
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('code', code)
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('totalPrice', totalPrice)
          ..add('tax', tax))
        .toString();
  }
}

class GEOrderCreatedSchemaBuilder
    implements Builder<GEOrderCreatedSchema, GEOrderCreatedSchemaBuilder> {
  _$GEOrderCreatedSchema? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  int? _totalPrice;
  int? get totalPrice => _$this._totalPrice;
  set totalPrice(int? totalPrice) => _$this._totalPrice = totalPrice;

  int? _tax;
  int? get tax => _$this._tax;
  set tax(int? tax) => _$this._tax = tax;

  GEOrderCreatedSchemaBuilder() {
    GEOrderCreatedSchema._defaults(this);
  }

  GEOrderCreatedSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdAt = $v.createdAt;
      _code = $v.code;
      _quantity = $v.quantity;
      _price = $v.price;
      _totalPrice = $v.totalPrice;
      _tax = $v.tax;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEOrderCreatedSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEOrderCreatedSchema;
  }

  @override
  void update(void Function(GEOrderCreatedSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEOrderCreatedSchema build() => _build();

  _$GEOrderCreatedSchema _build() {
    final _$result = _$v ??
        new _$GEOrderCreatedSchema._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GEOrderCreatedSchema', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GEOrderCreatedSchema', 'createdAt'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GEOrderCreatedSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GEOrderCreatedSchema', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'GEOrderCreatedSchema', 'price'),
            totalPrice: BuiltValueNullFieldError.checkNotNull(
                totalPrice, r'GEOrderCreatedSchema', 'totalPrice'),
            tax: BuiltValueNullFieldError.checkNotNull(
                tax, r'GEOrderCreatedSchema', 'tax'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
