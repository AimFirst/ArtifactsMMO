// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GETransactionSchema extends GETransactionSchema {
  @override
  final String id;
  @override
  final String code;
  @override
  final int quantity;
  @override
  final int price;
  @override
  final int totalPrice;

  factory _$GETransactionSchema(
          [void Function(GETransactionSchemaBuilder)? updates]) =>
      (new GETransactionSchemaBuilder()..update(updates))._build();

  _$GETransactionSchema._(
      {required this.id,
      required this.code,
      required this.quantity,
      required this.price,
      required this.totalPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GETransactionSchema', 'id');
    BuiltValueNullFieldError.checkNotNull(code, r'GETransactionSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GETransactionSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GETransactionSchema', 'price');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, r'GETransactionSchema', 'totalPrice');
  }

  @override
  GETransactionSchema rebuild(
          void Function(GETransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GETransactionSchemaBuilder toBuilder() =>
      new GETransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GETransactionSchema &&
        id == other.id &&
        code == other.code &&
        quantity == other.quantity &&
        price == other.price &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GETransactionSchema')
          ..add('id', id)
          ..add('code', code)
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('totalPrice', totalPrice))
        .toString();
  }
}

class GETransactionSchemaBuilder
    implements Builder<GETransactionSchema, GETransactionSchemaBuilder> {
  _$GETransactionSchema? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  GETransactionSchemaBuilder() {
    GETransactionSchema._defaults(this);
  }

  GETransactionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _quantity = $v.quantity;
      _price = $v.price;
      _totalPrice = $v.totalPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GETransactionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GETransactionSchema;
  }

  @override
  void update(void Function(GETransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GETransactionSchema build() => _build();

  _$GETransactionSchema _build() {
    final _$result = _$v ??
        new _$GETransactionSchema._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GETransactionSchema', 'id'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GETransactionSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GETransactionSchema', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'GETransactionSchema', 'price'),
            totalPrice: BuiltValueNullFieldError.checkNotNull(
                totalPrice, r'GETransactionSchema', 'totalPrice'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
