// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SkillResponseSchema extends SkillResponseSchema {
  @override
  final SkillDataSchema data;

  factory _$SkillResponseSchema(
          [void Function(SkillResponseSchemaBuilder)? updates]) =>
      (new SkillResponseSchemaBuilder()..update(updates))._build();

  _$SkillResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'SkillResponseSchema', 'data');
  }

  @override
  SkillResponseSchema rebuild(
          void Function(SkillResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillResponseSchemaBuilder toBuilder() =>
      new SkillResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'SkillResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class SkillResponseSchemaBuilder
    implements Builder<SkillResponseSchema, SkillResponseSchemaBuilder> {
  _$SkillResponseSchema? _$v;

  SkillDataSchemaBuilder? _data;
  SkillDataSchemaBuilder get data =>
      _$this._data ??= new SkillDataSchemaBuilder();
  set data(SkillDataSchemaBuilder? data) => _$this._data = data;

  SkillResponseSchemaBuilder() {
    SkillResponseSchema._defaults(this);
  }

  SkillResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillResponseSchema;
  }

  @override
  void update(void Function(SkillResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillResponseSchema build() => _build();

  _$SkillResponseSchema _build() {
    _$SkillResponseSchema _$result;
    try {
      _$result = _$v ?? new _$SkillResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SkillResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
