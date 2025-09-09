// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MonsterResponseSchema extends MonsterResponseSchema {
  @override
  final MonsterSchema data;

  factory _$MonsterResponseSchema(
          [void Function(MonsterResponseSchemaBuilder)? updates]) =>
      (new MonsterResponseSchemaBuilder()..update(updates))._build();

  _$MonsterResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'MonsterResponseSchema', 'data');
  }

  @override
  MonsterResponseSchema rebuild(
          void Function(MonsterResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonsterResponseSchemaBuilder toBuilder() =>
      new MonsterResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonsterResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'MonsterResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class MonsterResponseSchemaBuilder
    implements Builder<MonsterResponseSchema, MonsterResponseSchemaBuilder> {
  _$MonsterResponseSchema? _$v;

  MonsterSchemaBuilder? _data;
  MonsterSchemaBuilder get data => _$this._data ??= new MonsterSchemaBuilder();
  set data(MonsterSchemaBuilder? data) => _$this._data = data;

  MonsterResponseSchemaBuilder() {
    MonsterResponseSchema._defaults(this);
  }

  MonsterResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonsterResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonsterResponseSchema;
  }

  @override
  void update(void Function(MonsterResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonsterResponseSchema build() => _build();

  _$MonsterResponseSchema _build() {
    _$MonsterResponseSchema _$result;
    try {
      _$result = _$v ?? new _$MonsterResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MonsterResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
