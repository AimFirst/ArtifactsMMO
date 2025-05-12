// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EffectResponseSchema extends EffectResponseSchema {
  @override
  final EffectSchema data;

  factory _$EffectResponseSchema(
          [void Function(EffectResponseSchemaBuilder)? updates]) =>
      (new EffectResponseSchemaBuilder()..update(updates))._build();

  _$EffectResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'EffectResponseSchema', 'data');
  }

  @override
  EffectResponseSchema rebuild(
          void Function(EffectResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EffectResponseSchemaBuilder toBuilder() =>
      new EffectResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EffectResponseSchema && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EffectResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class EffectResponseSchemaBuilder
    implements Builder<EffectResponseSchema, EffectResponseSchemaBuilder> {
  _$EffectResponseSchema? _$v;

  EffectSchemaBuilder? _data;
  EffectSchemaBuilder get data => _$this._data ??= new EffectSchemaBuilder();
  set data(EffectSchemaBuilder? data) => _$this._data = data;

  EffectResponseSchemaBuilder() {
    EffectResponseSchema._defaults(this);
  }

  EffectResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EffectResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EffectResponseSchema;
  }

  @override
  void update(void Function(EffectResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EffectResponseSchema build() => _build();

  _$EffectResponseSchema _build() {
    _$EffectResponseSchema _$result;
    try {
      _$result = _$v ?? new _$EffectResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EffectResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
