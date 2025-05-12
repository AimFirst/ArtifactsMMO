// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_item_transaction_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NpcItemTransactionSchema extends NpcItemTransactionSchema {
  @override
  final String code;
  @override
  final int quantity;
  @override
  final int price;
  @override
  final int totalPrice;

  factory _$NpcItemTransactionSchema(
          [void Function(NpcItemTransactionSchemaBuilder)? updates]) =>
      (new NpcItemTransactionSchemaBuilder()..update(updates))._build();

  _$NpcItemTransactionSchema._(
      {required this.code,
      required this.quantity,
      required this.price,
      required this.totalPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'NpcItemTransactionSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'NpcItemTransactionSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'NpcItemTransactionSchema', 'price');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, r'NpcItemTransactionSchema', 'totalPrice');
  }

  @override
  NpcItemTransactionSchema rebuild(
          void Function(NpcItemTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NpcItemTransactionSchemaBuilder toBuilder() =>
      new NpcItemTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NpcItemTransactionSchema &&
        code == other.code &&
        quantity == other.quantity &&
        price == other.price &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NpcItemTransactionSchema')
          ..add('code', code)
          ..add('quantity', quantity)
          ..add('price', price)
          ..add('totalPrice', totalPrice))
        .toString();
  }
}

class NpcItemTransactionSchemaBuilder
    implements
        Builder<NpcItemTransactionSchema, NpcItemTransactionSchemaBuilder> {
  _$NpcItemTransactionSchema? _$v;

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

  NpcItemTransactionSchemaBuilder() {
    NpcItemTransactionSchema._defaults(this);
  }

  NpcItemTransactionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _price = $v.price;
      _totalPrice = $v.totalPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NpcItemTransactionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NpcItemTransactionSchema;
  }

  @override
  void update(void Function(NpcItemTransactionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NpcItemTransactionSchema build() => _build();

  _$NpcItemTransactionSchema _build() {
    final _$result = _$v ??
        new _$NpcItemTransactionSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'NpcItemTransactionSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'NpcItemTransactionSchema', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'NpcItemTransactionSchema', 'price'),
            totalPrice: BuiltValueNullFieldError.checkNotNull(
                totalPrice, r'NpcItemTransactionSchema', 'totalPrice'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
