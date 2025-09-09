// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycling_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecyclingResponseSchema extends RecyclingResponseSchema {
  @override
  final RecyclingDataSchema data;

  factory _$RecyclingResponseSchema(
          [void Function(RecyclingResponseSchemaBuilder)? updates]) =>
      (new RecyclingResponseSchemaBuilder()..update(updates))._build();

  _$RecyclingResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'RecyclingResponseSchema', 'data');
  }

  @override
  RecyclingResponseSchema rebuild(
          void Function(RecyclingResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecyclingResponseSchemaBuilder toBuilder() =>
      new RecyclingResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecyclingResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'RecyclingResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class RecyclingResponseSchemaBuilder
    implements
        Builder<RecyclingResponseSchema, RecyclingResponseSchemaBuilder> {
  _$RecyclingResponseSchema? _$v;

  RecyclingDataSchemaBuilder? _data;
  RecyclingDataSchemaBuilder get data =>
      _$this._data ??= new RecyclingDataSchemaBuilder();
  set data(RecyclingDataSchemaBuilder? data) => _$this._data = data;

  RecyclingResponseSchemaBuilder() {
    RecyclingResponseSchema._defaults(this);
  }

  RecyclingResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecyclingResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecyclingResponseSchema;
  }

  @override
  void update(void Function(RecyclingResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecyclingResponseSchema build() => _build();

  _$RecyclingResponseSchema _build() {
    _$RecyclingResponseSchema _$result;
    try {
      _$result = _$v ?? new _$RecyclingResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecyclingResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
