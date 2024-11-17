// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_item_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteItemResponseSchema extends DeleteItemResponseSchema {
  @override
  final DeleteItemSchema data;

  factory _$DeleteItemResponseSchema(
          [void Function(DeleteItemResponseSchemaBuilder)? updates]) =>
      (new DeleteItemResponseSchemaBuilder()..update(updates))._build();

  _$DeleteItemResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'DeleteItemResponseSchema', 'data');
  }

  @override
  DeleteItemResponseSchema rebuild(
          void Function(DeleteItemResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteItemResponseSchemaBuilder toBuilder() =>
      new DeleteItemResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteItemResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DeleteItemResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class DeleteItemResponseSchemaBuilder
    implements
        Builder<DeleteItemResponseSchema, DeleteItemResponseSchemaBuilder> {
  _$DeleteItemResponseSchema? _$v;

  DeleteItemSchemaBuilder? _data;
  DeleteItemSchemaBuilder get data =>
      _$this._data ??= new DeleteItemSchemaBuilder();
  set data(DeleteItemSchemaBuilder? data) => _$this._data = data;

  DeleteItemResponseSchemaBuilder() {
    DeleteItemResponseSchema._defaults(this);
  }

  DeleteItemResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteItemResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteItemResponseSchema;
  }

  @override
  void update(void Function(DeleteItemResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteItemResponseSchema build() => _build();

  _$DeleteItemResponseSchema _build() {
    _$DeleteItemResponseSchema _$result;
    try {
      _$result = _$v ?? new _$DeleteItemResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DeleteItemResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
