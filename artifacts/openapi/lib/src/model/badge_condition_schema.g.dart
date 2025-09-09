// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_condition_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BadgeConditionSchema extends BadgeConditionSchema {
  @override
  final String code;
  @override
  final int? quantity;

  factory _$BadgeConditionSchema(
          [void Function(BadgeConditionSchemaBuilder)? updates]) =>
      (new BadgeConditionSchemaBuilder()..update(updates))._build();

  _$BadgeConditionSchema._({required this.code, this.quantity}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'BadgeConditionSchema', 'code');
  }

  @override
  BadgeConditionSchema rebuild(
          void Function(BadgeConditionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BadgeConditionSchemaBuilder toBuilder() =>
      new BadgeConditionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BadgeConditionSchema &&
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
    return (newBuiltValueToStringHelper(r'BadgeConditionSchema')
          ..add('code', code)
          ..add('quantity', quantity))
        .toString();
  }
}

class BadgeConditionSchemaBuilder
    implements Builder<BadgeConditionSchema, BadgeConditionSchemaBuilder> {
  _$BadgeConditionSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  BadgeConditionSchemaBuilder() {
    BadgeConditionSchema._defaults(this);
  }

  BadgeConditionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BadgeConditionSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BadgeConditionSchema;
  }

  @override
  void update(void Function(BadgeConditionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BadgeConditionSchema build() => _build();

  _$BadgeConditionSchema _build() {
    final _$result = _$v ??
        new _$BadgeConditionSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'BadgeConditionSchema', 'code'),
            quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
