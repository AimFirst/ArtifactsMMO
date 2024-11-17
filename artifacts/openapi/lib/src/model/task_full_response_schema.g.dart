// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_full_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskFullResponseSchema extends TaskFullResponseSchema {
  @override
  final TaskFullSchema data;

  factory _$TaskFullResponseSchema(
          [void Function(TaskFullResponseSchemaBuilder)? updates]) =>
      (new TaskFullResponseSchemaBuilder()..update(updates))._build();

  _$TaskFullResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'TaskFullResponseSchema', 'data');
  }

  @override
  TaskFullResponseSchema rebuild(
          void Function(TaskFullResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskFullResponseSchemaBuilder toBuilder() =>
      new TaskFullResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskFullResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TaskFullResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class TaskFullResponseSchemaBuilder
    implements Builder<TaskFullResponseSchema, TaskFullResponseSchemaBuilder> {
  _$TaskFullResponseSchema? _$v;

  TaskFullSchemaBuilder? _data;
  TaskFullSchemaBuilder get data =>
      _$this._data ??= new TaskFullSchemaBuilder();
  set data(TaskFullSchemaBuilder? data) => _$this._data = data;

  TaskFullResponseSchemaBuilder() {
    TaskFullResponseSchema._defaults(this);
  }

  TaskFullResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskFullResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskFullResponseSchema;
  }

  @override
  void update(void Function(TaskFullResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskFullResponseSchema build() => _build();

  _$TaskFullResponseSchema _build() {
    _$TaskFullResponseSchema _$result;
    try {
      _$result = _$v ?? new _$TaskFullResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskFullResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
