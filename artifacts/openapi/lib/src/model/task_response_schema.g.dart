// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskResponseSchema extends TaskResponseSchema {
  @override
  final TaskDataSchema data;

  factory _$TaskResponseSchema(
          [void Function(TaskResponseSchemaBuilder)? updates]) =>
      (new TaskResponseSchemaBuilder()..update(updates))._build();

  _$TaskResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'TaskResponseSchema', 'data');
  }

  @override
  TaskResponseSchema rebuild(
          void Function(TaskResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskResponseSchemaBuilder toBuilder() =>
      new TaskResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TaskResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class TaskResponseSchemaBuilder
    implements Builder<TaskResponseSchema, TaskResponseSchemaBuilder> {
  _$TaskResponseSchema? _$v;

  TaskDataSchemaBuilder? _data;
  TaskDataSchemaBuilder get data =>
      _$this._data ??= new TaskDataSchemaBuilder();
  set data(TaskDataSchemaBuilder? data) => _$this._data = data;

  TaskResponseSchemaBuilder() {
    TaskResponseSchema._defaults(this);
  }

  TaskResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskResponseSchema;
  }

  @override
  void update(void Function(TaskResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskResponseSchema build() => _build();

  _$TaskResponseSchema _build() {
    _$TaskResponseSchema _$result;
    try {
      _$result = _$v ?? new _$TaskResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
