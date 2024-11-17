// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ge_order_creationr_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GEOrderCreationrSchema extends GEOrderCreationrSchema {
  @override
  final String code;
  @override
  final int quantity;
  @override
  final int price;

  factory _$GEOrderCreationrSchema(
          [void Function(GEOrderCreationrSchemaBuilder)? updates]) =>
      (new GEOrderCreationrSchemaBuilder()..update(updates))._build();

  _$GEOrderCreationrSchema._(
      {required this.code, required this.quantity, required this.price})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'GEOrderCreationrSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'GEOrderCreationrSchema', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GEOrderCreationrSchema', 'price');
  }

  @override
  GEOrderCreationrSchema rebuild(
          void Function(GEOrderCreationrSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEOrderCreationrSchemaBuilder toBuilder() =>
      new GEOrderCreationrSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEOrderCreationrSchema &&
        code == other.code &&
        quantity == other.quantity &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GEOrderCreationrSchema')
          ..add('code', code)
          ..add('quantity', quantity)
          ..add('price', price))
        .toString();
  }
}

class GEOrderCreationrSchemaBuilder
    implements Builder<GEOrderCreationrSchema, GEOrderCreationrSchemaBuilder> {
  _$GEOrderCreationrSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  GEOrderCreationrSchemaBuilder() {
    GEOrderCreationrSchema._defaults(this);
  }

  GEOrderCreationrSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEOrderCreationrSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GEOrderCreationrSchema;
  }

  @override
  void update(void Function(GEOrderCreationrSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GEOrderCreationrSchema build() => _build();

  _$GEOrderCreationrSchema _build() {
    final _$result = _$v ??
        new _$GEOrderCreationrSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GEOrderCreationrSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GEOrderCreationrSchema', 'quantity'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'GEOrderCreationrSchema', 'price'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
