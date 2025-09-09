// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResourceResponseSchema extends ResourceResponseSchema {
  @override
  final ResourceSchema data;

  factory _$ResourceResponseSchema(
          [void Function(ResourceResponseSchemaBuilder)? updates]) =>
      (new ResourceResponseSchemaBuilder()..update(updates))._build();

  _$ResourceResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'ResourceResponseSchema', 'data');
  }

  @override
  ResourceResponseSchema rebuild(
          void Function(ResourceResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceResponseSchemaBuilder toBuilder() =>
      new ResourceResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ResourceResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class ResourceResponseSchemaBuilder
    implements Builder<ResourceResponseSchema, ResourceResponseSchemaBuilder> {
  _$ResourceResponseSchema? _$v;

  ResourceSchemaBuilder? _data;
  ResourceSchemaBuilder get data =>
      _$this._data ??= new ResourceSchemaBuilder();
  set data(ResourceSchemaBuilder? data) => _$this._data = data;

  ResourceResponseSchemaBuilder() {
    ResourceResponseSchema._defaults(this);
  }

  ResourceResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResourceResponseSchema;
  }

  @override
  void update(void Function(ResourceResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResourceResponseSchema build() => _build();

  _$ResourceResponseSchema _build() {
    _$ResourceResponseSchema _$result;
    try {
      _$result = _$v ?? new _$ResourceResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResourceResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
