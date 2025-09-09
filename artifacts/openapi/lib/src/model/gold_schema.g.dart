// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GoldSchema extends GoldSchema {
  @override
  final int quantity;

  factory _$GoldSchema([void Function(GoldSchemaBuilder)? updates]) =>
      (new GoldSchemaBuilder()..update(updates))._build();

  _$GoldSchema._({required this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(quantity, r'GoldSchema', 'quantity');
  }

  @override
  GoldSchema rebuild(void Function(GoldSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoldSchemaBuilder toBuilder() => new GoldSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoldSchema && quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GoldSchema')
          ..add('quantity', quantity))
        .toString();
  }
}

class GoldSchemaBuilder implements Builder<GoldSchema, GoldSchemaBuilder> {
  _$GoldSchema? _$v;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  GoldSchemaBuilder() {
    GoldSchema._defaults(this);
  }

  GoldSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoldSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GoldSchema;
  }

  @override
  void update(void Function(GoldSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GoldSchema build() => _build();

  _$GoldSchema _build() {
    final _$result = _$v ??
        new _$GoldSchema._(
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'GoldSchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
