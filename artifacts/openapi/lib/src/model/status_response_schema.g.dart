// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StatusResponseSchema extends StatusResponseSchema {
  @override
  final StatusSchema data;

  factory _$StatusResponseSchema(
          [void Function(StatusResponseSchemaBuilder)? updates]) =>
      (new StatusResponseSchemaBuilder()..update(updates))._build();

  _$StatusResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'StatusResponseSchema', 'data');
  }

  @override
  StatusResponseSchema rebuild(
          void Function(StatusResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusResponseSchemaBuilder toBuilder() =>
      new StatusResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'StatusResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class StatusResponseSchemaBuilder
    implements Builder<StatusResponseSchema, StatusResponseSchemaBuilder> {
  _$StatusResponseSchema? _$v;

  StatusSchemaBuilder? _data;
  StatusSchemaBuilder get data => _$this._data ??= new StatusSchemaBuilder();
  set data(StatusSchemaBuilder? data) => _$this._data = data;

  StatusResponseSchemaBuilder() {
    StatusResponseSchema._defaults(this);
  }

  StatusResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatusResponseSchema;
  }

  @override
  void update(void Function(StatusResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusResponseSchema build() => _build();

  _$StatusResponseSchema _build() {
    _$StatusResponseSchema _$result;
    try {
      _$result = _$v ?? new _$StatusResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StatusResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
