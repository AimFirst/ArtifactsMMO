// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_extension_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BankExtensionSchema extends BankExtensionSchema {
  @override
  final int price;

  factory _$BankExtensionSchema(
          [void Function(BankExtensionSchemaBuilder)? updates]) =>
      (new BankExtensionSchemaBuilder()..update(updates))._build();

  _$BankExtensionSchema._({required this.price}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        price, r'BankExtensionSchema', 'price');
  }

  @override
  BankExtensionSchema rebuild(
          void Function(BankExtensionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BankExtensionSchemaBuilder toBuilder() =>
      new BankExtensionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BankExtensionSchema && price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BankExtensionSchema')
          ..add('price', price))
        .toString();
  }
}

class BankExtensionSchemaBuilder
    implements Builder<BankExtensionSchema, BankExtensionSchemaBuilder> {
  _$BankExtensionSchema? _$v;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  BankExtensionSchemaBuilder() {
    BankExtensionSchema._defaults(this);
  }

  BankExtensionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BankExtensionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BankExtensionSchema;
  }

  @override
  void update(void Function(BankExtensionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BankExtensionSchema build() => _build();

  _$BankExtensionSchema _build() {
    final _$result = _$v ??
        new _$BankExtensionSchema._(
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'BankExtensionSchema', 'price'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
