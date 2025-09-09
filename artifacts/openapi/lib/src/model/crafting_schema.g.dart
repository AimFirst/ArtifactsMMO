// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crafting_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CraftingSchema extends CraftingSchema {
  @override
  final String code;
  @override
  final int? quantity;

  factory _$CraftingSchema([void Function(CraftingSchemaBuilder)? updates]) =>
      (new CraftingSchemaBuilder()..update(updates))._build();

  _$CraftingSchema._({required this.code, this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'CraftingSchema', 'code');
  }

  @override
  CraftingSchema rebuild(void Function(CraftingSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CraftingSchemaBuilder toBuilder() =>
      new CraftingSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CraftingSchema &&
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
    return (newBuiltValueToStringHelper(r'CraftingSchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class CraftingSchemaBuilder
    implements Builder<CraftingSchema, CraftingSchemaBuilder> {
  _$CraftingSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  CraftingSchemaBuilder() {
    CraftingSchema._defaults(this);
  }

  CraftingSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CraftingSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CraftingSchema;
  }

  @override
  void update(void Function(CraftingSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CraftingSchema build() => _build();

  _$CraftingSchema _build() {
    final _$result = _$v ??
        new _$CraftingSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'CraftingSchema', 'code'),
            quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
