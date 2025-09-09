// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_item_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UseItemResponseSchema extends UseItemResponseSchema {
  @override
  final UseItemSchema data;

  factory _$UseItemResponseSchema(
          [void Function(UseItemResponseSchemaBuilder)? updates]) =>
      (new UseItemResponseSchemaBuilder()..update(updates))._build();

  _$UseItemResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'UseItemResponseSchema', 'data');
  }

  @override
  UseItemResponseSchema rebuild(
          void Function(UseItemResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UseItemResponseSchemaBuilder toBuilder() =>
      new UseItemResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UseItemResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UseItemResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class UseItemResponseSchemaBuilder
    implements Builder<UseItemResponseSchema, UseItemResponseSchemaBuilder> {
  _$UseItemResponseSchema? _$v;

  UseItemSchemaBuilder? _data;
  UseItemSchemaBuilder get data => _$this._data ??= new UseItemSchemaBuilder();
  set data(UseItemSchemaBuilder? data) => _$this._data = data;

  UseItemResponseSchemaBuilder() {
    UseItemResponseSchema._defaults(this);
  }

  UseItemResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UseItemResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UseItemResponseSchema;
  }

  @override
  void update(void Function(UseItemResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UseItemResponseSchema build() => _build();

  _$UseItemResponseSchema _build() {
    _$UseItemResponseSchema _$result;
    try {
      _$result = _$v ?? new _$UseItemResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UseItemResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
