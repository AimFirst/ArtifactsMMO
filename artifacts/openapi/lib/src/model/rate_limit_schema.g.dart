// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_limit_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RateLimitSchema extends RateLimitSchema {
  @override
  final String type;
  @override
  final String value;

  factory _$RateLimitSchema([void Function(RateLimitSchemaBuilder)? updates]) =>
      (new RateLimitSchemaBuilder()..update(updates))._build();

  _$RateLimitSchema._({required this.type, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'RateLimitSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(value, r'RateLimitSchema', 'value');
  }

  @override
  RateLimitSchema rebuild(void Function(RateLimitSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RateLimitSchemaBuilder toBuilder() =>
      new RateLimitSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RateLimitSchema &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RateLimitSchema')
          ..add('type', type)
          ..add('value', value))
        .toString();
  }
}

class RateLimitSchemaBuilder
    implements Builder<RateLimitSchema, RateLimitSchemaBuilder> {
  _$RateLimitSchema? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  RateLimitSchemaBuilder() {
    RateLimitSchema._defaults(this);
  }

  RateLimitSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RateLimitSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RateLimitSchema;
  }

  @override
  void update(void Function(RateLimitSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RateLimitSchema build() => _build();

  _$RateLimitSchema _build() {
    final _$result = _$v ??
        new _$RateLimitSchema._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'RateLimitSchema', 'type'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'RateLimitSchema', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
