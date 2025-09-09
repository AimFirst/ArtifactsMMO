// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_merchant_buy_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NpcMerchantBuySchema extends NpcMerchantBuySchema {
  @override
  final String code;
  @override
  final int quantity;

  factory _$NpcMerchantBuySchema(
          [void Function(NpcMerchantBuySchemaBuilder)? updates]) =>
      (new NpcMerchantBuySchemaBuilder()..update(updates))._build();

  _$NpcMerchantBuySchema._({required this.code, required this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'NpcMerchantBuySchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'NpcMerchantBuySchema', 'quantity');
  }

  @override
  NpcMerchantBuySchema rebuild(
          void Function(NpcMerchantBuySchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NpcMerchantBuySchemaBuilder toBuilder() =>
      new NpcMerchantBuySchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NpcMerchantBuySchema &&
        code == other.code &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NpcMerchantBuySchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class NpcMerchantBuySchemaBuilder
    implements Builder<NpcMerchantBuySchema, NpcMerchantBuySchemaBuilder> {
  _$NpcMerchantBuySchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  NpcMerchantBuySchemaBuilder() {
    NpcMerchantBuySchema._defaults(this);
  }

  NpcMerchantBuySchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NpcMerchantBuySchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NpcMerchantBuySchema;
  }

  @override
  void update(void Function(NpcMerchantBuySchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NpcMerchantBuySchema build() => _build();

  _$NpcMerchantBuySchema _build() {
    final _$result = _$v ??
        new _$NpcMerchantBuySchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'NpcMerchantBuySchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'NpcMerchantBuySchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
