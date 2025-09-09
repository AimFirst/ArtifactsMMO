// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DropSchema extends DropSchema {
  @override
  final String code;
  @override
  final int quantity;

  factory _$DropSchema([void Function(DropSchemaBuilder)? updates]) =>
      (new DropSchemaBuilder()..update(updates))._build();

  _$DropSchema._({required this.code, required this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'DropSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(quantity, r'DropSchema', 'quantity');
  }

  @override
  DropSchema rebuild(void Function(DropSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DropSchemaBuilder toBuilder() => new DropSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DropSchema &&
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
    return (newBuiltValueToStringHelper(r'DropSchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class DropSchemaBuilder implements Builder<DropSchema, DropSchemaBuilder> {
  _$DropSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  DropSchemaBuilder() {
    DropSchema._defaults(this);
  }

  DropSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DropSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DropSchema;
  }

  @override
  void update(void Function(DropSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DropSchema build() => _build();

  _$DropSchema _build() {
    final _$result = _$v ??
        new _$DropSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'DropSchema', 'code'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'DropSchema', 'quantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
