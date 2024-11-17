// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_order_history_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeOrderHistorySchema extends GeOrderHistorySchema {
  @override
  final String orderId;
  @override
  final String seller;
  @override
  final String buyer;
  @override
  final String code;
  @override
  final int quantity;
  @override
  final int price;
  @override
  final DateTime soldAt;

  factory _$GeOrderHistorySchema(
          [void Function(GeOrderHistorySchemaBuilder)? updates]) =>
      (new GeOrderHistorySchemaBuilder()..update(updates))._build();

  _$GeOrderHistorySchema._(
      {required this.orderId,
      required this.seller,
      required this.buyer,
      required this.code,
      required this.quantity,
      required this.price,
      required this.soldAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        orderId, r'GeOrderHistorySchema', 'orderId');
    BuiltValueNullFieldError.checkNotNull(
        seller, r'GeOrderHistorySchema', 'seller');
    BuiltValueNullFieldError.checkNotNull(
        buyer, r'GeOrderHistorySchema', 'buyer');
    BuiltValueNullFieldError.checkNotNull(
        code, r'GeOrderHistorySchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GeOrderHistorySchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GeOrderHistorySchema', 'price');
    BuiltValueNullFieldError.checkNotNull(
        soldAt, r'GeOrderHistorySchema', 'soldAt');
  }

  @override
  GeOrderHistorySchema rebuild(
          void Function(GeOrderHistorySchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeOrderHistorySchemaBuilder toBuilder() =>
      new GeOrderHistorySchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeOrderHistorySchema &&
        orderId == other.orderId &&
        seller == other.seller &&
        buyer == other.buyer &&
        code == other.code &&
        quantity == other.quantity &&
        price == other.price &&
        soldAt == other.soldAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, seller.hashCode);
    _$hash = $jc(_$hash, buyer.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, soldAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeOrderHistorySchema')
          ..add('orderId', orderId)
          ..add('seller', seller)
          ..add('buyer', buyer)
          ..add('code', code)
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('soldAt', soldAt))
        .toString();
  }
}

class GeOrderHistorySchemaBuilder
    implements Builder<GeOrderHistorySchema, GeOrderHistorySchemaBuilder> {
  _$GeOrderHistorySchema? _$v;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _seller;
  String? get seller => _$this._seller;
  set seller(String? seller) => _$this._seller = seller;

  String? _buyer;
  String? get buyer => _$this._buyer;
  set buyer(String? buyer) => _$this._buyer = buyer;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DateTime? _soldAt;
  DateTime? get soldAt => _$this._soldAt;
  set soldAt(DateTime? soldAt) => _$this._soldAt = soldAt;

  GeOrderHistorySchemaBuilder() {
    GeOrderHistorySchema._defaults(this);
  }

  GeOrderHistorySchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _seller = $v.seller;
      _buyer = $v.buyer;
      _code = $v.code;
      _quantity = $v.quantity;
      _price = $v.price;
      _soldAt = $v.soldAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeOrderHistorySchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeOrderHistorySchema;
  }

  @override
  void update(void Function(GeOrderHistorySchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeOrderHistorySchema build() => _build();

  _$GeOrderHistorySchema _build() {
    final _$result = _$v ??
        new _$GeOrderHistorySchema._(
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, r'GeOrderHistorySchema', 'orderId'),
            seller: BuiltValueNullFieldError.checkNotNull(
                seller, r'GeOrderHistorySchema', 'seller'),
            buyer: BuiltValueNullFieldError.checkNotNull(
                buyer, r'GeOrderHistorySchema', 'buyer'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GeOrderHistorySchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GeOrderHistorySchema', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'GeOrderHistorySchema', 'price'),
            soldAt: BuiltValueNullFieldError.checkNotNull(
                soldAt, r'GeOrderHistorySchema', 'soldAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
