// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_rate_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DropRateSchema extends DropRateSchema {
  @override
  final String code;
  @override
  final int rate;
  @override
  final int minQuantity;
  @override
  final int maxQuantity;

  factory _$DropRateSchema([void Function(DropRateSchemaBuilder)? updates]) =>
      (new DropRateSchemaBuilder()..update(updates))._build();

  _$DropRateSchema._(
      {required this.code,
      required this.rate,
      required this.minQuantity,
      required this.maxQuantity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'DropRateSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(rate, r'DropRateSchema', 'rate');
    BuiltValueNullFieldError.checkNotNull(
        minQuantity, r'DropRateSchema', 'minQuantity');
    BuiltValueNullFieldError.checkNotNull(
        maxQuantity, r'DropRateSchema', 'maxQuantity');
  }

  @override
  DropRateSchema rebuild(void Function(DropRateSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DropRateSchemaBuilder toBuilder() =>
      new DropRateSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DropRateSchema &&
        code == other.code &&
        rate == other.rate &&
        minQuantity == other.minQuantity &&
        maxQuantity == other.maxQuantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, minQuantity.hashCode);
    _$hash = $jc(_$hash, maxQuantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DropRateSchema')
          ..add('code', code)
          ..add('rate', rate)
          ..add('minQuantity', minQuantity)
          ..add('maxQuantity', maxQuantity))
        .toString();
  }
}

class DropRateSchemaBuilder
    implements Builder<DropRateSchema, DropRateSchemaBuilder> {
  _$DropRateSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  int? _minQuantity;
  int? get minQuantity => _$this._minQuantity;
  set minQuantity(int? minQuantity) => _$this._minQuantity = minQuantity;

  int? _maxQuantity;
  int? get maxQuantity => _$this._maxQuantity;
  set maxQuantity(int? maxQuantity) => _$this._maxQuantity = maxQuantity;

  DropRateSchemaBuilder() {
    DropRateSchema._defaults(this);
  }

  DropRateSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _rate = $v.rate;
      _minQuantity = $v.minQuantity;
      _maxQuantity = $v.maxQuantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DropRateSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DropRateSchema;
  }

  @override
  void update(void Function(DropRateSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DropRateSchema build() => _build();

  _$DropRateSchema _build() {
    final _$result = _$v ??
        new _$DropRateSchema._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'DropRateSchema', 'code'),
            rate: BuiltValueNullFieldError.checkNotNull(
                rate, r'DropRateSchema', 'rate'),
            minQuantity: BuiltValueNullFieldError.checkNotNull(
                minQuantity, r'DropRateSchema', 'minQuantity'),
            maxQuantity: BuiltValueNullFieldError.checkNotNull(
                maxQuantity, r'DropRateSchema', 'maxQuantity'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
