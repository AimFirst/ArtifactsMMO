// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_effect_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SimpleEffectSchema extends SimpleEffectSchema {
  @override
  final String code;
  @override
  final int value;
  @override
  final String description;

  factory _$SimpleEffectSchema(
          [void Function(SimpleEffectSchemaBuilder)? updates]) =>
      (SimpleEffectSchemaBuilder()..update(updates))._build();

  _$SimpleEffectSchema._(
      {required this.code, required this.value, required this.description})
      : super._();
  @override
  SimpleEffectSchema rebuild(
          void Function(SimpleEffectSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleEffectSchemaBuilder toBuilder() =>
      SimpleEffectSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleEffectSchema &&
        code == other.code &&
        value == other.value &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SimpleEffectSchema')
          ..add('code', code)
          ..add('value', value)
          ..add('description', description))
        .toString();
  }
}

class SimpleEffectSchemaBuilder
    implements Builder<SimpleEffectSchema, SimpleEffectSchemaBuilder> {
  _$SimpleEffectSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  SimpleEffectSchemaBuilder() {
    SimpleEffectSchema._defaults(this);
  }

  SimpleEffectSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _value = $v.value;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleEffectSchema other) {
    _$v = other as _$SimpleEffectSchema;
  }

  @override
  void update(void Function(SimpleEffectSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SimpleEffectSchema build() => _build();

  _$SimpleEffectSchema _build() {
    final _$result = _$v ??
        _$SimpleEffectSchema._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'SimpleEffectSchema', 'code'),
          value: BuiltValueNullFieldError.checkNotNull(
              value, r'SimpleEffectSchema', 'value'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'SimpleEffectSchema', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
