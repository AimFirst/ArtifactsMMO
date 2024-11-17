// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_item_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SimpleItemSchema extends SimpleItemSchema {
  @override
  final String code;
  @override
  final int quantity;

  factory _$SimpleItemSchema(
          [void Function(SimpleItemSchemaBuilder)? updates]) =>
      (new SimpleItemSchemaBuilder()..update(updates))._build();

  _$SimpleItemSchema._({required this.code, required this.quantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'SimpleItemSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        quantity, r'SimpleItemSchema', 'quantity');
  }

  @override
  SimpleItemSchema rebuild(void Function(SimpleItemSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleItemSchemaBuilder toBuilder() =>
      new SimpleItemSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleItemSchema &&
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
    return (newBuiltValueToStringHelper(r'SimpleItemSchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class SimpleItemSchemaBuilder
    implements Builder<SimpleItemSchema, SimpleItemSchemaBuilder> {
  _$SimpleItemSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  SimpleItemSchemaBuilder() {
    SimpleItemSchema._defaults(this);
  }

  SimpleItemSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleItemSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SimpleItemSchema;
  }

  @override
  void update(void Function(SimpleItemSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SimpleItemSchema build() => _build();

  _$SimpleItemSchema _build() {
    final _$result = _$v ??
        new _$SimpleItemSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'SimpleItemSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'SimpleItemSchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
