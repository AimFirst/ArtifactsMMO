// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycling_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecyclingSchema extends RecyclingSchema {
  @override
  final String code;
  @override
  final int? quantity;

  factory _$RecyclingSchema([void Function(RecyclingSchemaBuilder)? updates]) =>
      (new RecyclingSchemaBuilder()..update(updates))._build();

  _$RecyclingSchema._({required this.code, this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'RecyclingSchema', 'code');
  }

  @override
  RecyclingSchema rebuild(void Function(RecyclingSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecyclingSchemaBuilder toBuilder() =>
      new RecyclingSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecyclingSchema &&
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
    return (newBuiltValueToStringHelper(r'RecyclingSchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class RecyclingSchemaBuilder
    implements Builder<RecyclingSchema, RecyclingSchemaBuilder> {
  _$RecyclingSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  RecyclingSchemaBuilder() {
    RecyclingSchema._defaults(this);
  }

  RecyclingSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecyclingSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecyclingSchema;
  }

  @override
  void update(void Function(RecyclingSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecyclingSchema build() => _build();

  _$RecyclingSchema _build() {
    final _$result = _$v ??
        new _$RecyclingSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'RecyclingSchema', 'code'),
            quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
