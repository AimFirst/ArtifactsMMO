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
  final String currency;
  @override
  final int price;
  @override
  final int totalPrice;

  factory _$NpcItemTransactionSchema(
          [void Function(NpcItemTransactionSchemaBuilder)? updates]) =>
      (NpcItemTransactionSchemaBuilder()..update(updates))._build();

  _$NpcItemTransactionSchema._(
      {required this.code,
      required this.quantity,
      required this.currency,
      required this.price,
      required this.totalPrice})
      : super._();
  @override
  NpcItemTransactionSchema rebuild(
          void Function(NpcItemTransactionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NpcItemTransactionSchemaBuilder toBuilder() =>
      NpcItemTransactionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NpcItemTransactionSchema &&
        code == other.code &&
        quantity == other.quantity &&
        currency == other.currency &&
        price == other.price &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
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
          ..add('currency', currency)
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

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

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
      _currency = $v.currency;
      _price = $v.price;
      _totalPrice = $v.totalPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NpcItemTransactionSchema other) {
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
        _$NpcItemTransactionSchema._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'NpcItemTransactionSchema', 'code'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'NpcItemTransactionSchema', 'quantity'),
          currency: BuiltValueNullFieldError.checkNotNull(
              currency, r'NpcItemTransactionSchema', 'currency'),
          price: BuiltValueNullFieldError.checkNotNull(
              price, r'NpcItemTransactionSchema', 'price'),
          totalPrice: BuiltValueNullFieldError.checkNotNull(
              totalPrice, r'NpcItemTransactionSchema', 'totalPrice'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
