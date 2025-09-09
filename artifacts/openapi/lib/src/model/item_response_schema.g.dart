// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemResponseSchema extends ItemResponseSchema {
  @override
  final ItemSchema data;

  factory _$ItemResponseSchema(
          [void Function(ItemResponseSchemaBuilder)? updates]) =>
      (new ItemResponseSchemaBuilder()..update(updates))._build();

  _$ItemResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ItemResponseSchema', 'data');
  }

  @override
  ItemResponseSchema rebuild(
          void Function(ItemResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemResponseSchemaBuilder toBuilder() =>
      new ItemResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ItemResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class ItemResponseSchemaBuilder
    implements Builder<ItemResponseSchema, ItemResponseSchemaBuilder> {
  _$ItemResponseSchema? _$v;

  ItemSchemaBuilder? _data;
  ItemSchemaBuilder get data => _$this._data ??= new ItemSchemaBuilder();
  set data(ItemSchemaBuilder? data) => _$this._data = data;

  ItemResponseSchemaBuilder() {
    ItemResponseSchema._defaults(this);
  }

  ItemResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemResponseSchema;
  }

  @override
  void update(void Function(ItemResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemResponseSchema build() => _build();

  _$ItemResponseSchema _build() {
    _$ItemResponseSchema _$result;
    try {
      _$result = _$v ?? new _$ItemResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ItemResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
