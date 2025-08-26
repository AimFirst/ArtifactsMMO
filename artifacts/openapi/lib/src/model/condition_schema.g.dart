// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConditionSchema extends ConditionSchema {
  @override
  final String code;
  @override
  final ConditionOperator operator_;
  @override
  final int value;

  factory _$ConditionSchema([void Function(ConditionSchemaBuilder)? updates]) =>
      (ConditionSchemaBuilder()..update(updates))._build();

  _$ConditionSchema._(
      {required this.code, required this.operator_, required this.value})
      : super._();
  @override
  ConditionSchema rebuild(void Function(ConditionSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConditionSchemaBuilder toBuilder() => ConditionSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConditionSchema &&
        code == other.code &&
        operator_ == other.operator_ &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, operator_.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConditionSchema')
          ..add('code', code)
          ..add('operator_', operator_)
          ..add('value', value))
        .toString();
  }
}

class ConditionSchemaBuilder
    implements Builder<ConditionSchema, ConditionSchemaBuilder> {
  _$ConditionSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  ConditionOperator? _operator_;
  ConditionOperator? get operator_ => _$this._operator_;
  set operator_(ConditionOperator? operator_) => _$this._operator_ = operator_;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  ConditionSchemaBuilder() {
    ConditionSchema._defaults(this);
  }

  ConditionSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _operator_ = $v.operator_;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConditionSchema other) {
    _$v = other as _$ConditionSchema;
  }

  @override
  void update(void Function(ConditionSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConditionSchema build() => _build();

  _$ConditionSchema _build() {
    final _$result = _$v ??
        _$ConditionSchema._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'ConditionSchema', 'code'),
          operator_: BuiltValueNullFieldError.checkNotNull(
              operator_, r'ConditionSchema', 'operator_'),
          value: BuiltValueNullFieldError.checkNotNull(
              value, r'ConditionSchema', 'value'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
