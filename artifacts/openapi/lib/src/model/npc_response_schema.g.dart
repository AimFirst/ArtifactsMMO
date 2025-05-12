// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NPCResponseSchema extends NPCResponseSchema {
  @override
  final NPCSchema data;

  factory _$NPCResponseSchema(
          [void Function(NPCResponseSchemaBuilder)? updates]) =>
      (new NPCResponseSchemaBuilder()..update(updates))._build();

  _$NPCResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NPCResponseSchema', 'data');
  }

  @override
  NPCResponseSchema rebuild(void Function(NPCResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NPCResponseSchemaBuilder toBuilder() =>
      new NPCResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NPCResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NPCResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class NPCResponseSchemaBuilder
    implements Builder<NPCResponseSchema, NPCResponseSchemaBuilder> {
  _$NPCResponseSchema? _$v;

  NPCSchemaBuilder? _data;
  NPCSchemaBuilder get data => _$this._data ??= new NPCSchemaBuilder();
  set data(NPCSchemaBuilder? data) => _$this._data = data;

  NPCResponseSchemaBuilder() {
    NPCResponseSchema._defaults(this);
  }

  NPCResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NPCResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NPCResponseSchema;
  }

  @override
  void update(void Function(NPCResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NPCResponseSchema build() => _build();

  _$NPCResponseSchema _build() {
    _$NPCResponseSchema _$result;
    try {
      _$result = _$v ?? new _$NPCResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NPCResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
