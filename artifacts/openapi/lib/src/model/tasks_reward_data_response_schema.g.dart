// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_reward_data_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TasksRewardDataResponseSchema extends TasksRewardDataResponseSchema {
  @override
  final TasksRewardDataSchema data;

  factory _$TasksRewardDataResponseSchema(
          [void Function(TasksRewardDataResponseSchemaBuilder)? updates]) =>
      (new TasksRewardDataResponseSchemaBuilder()..update(updates))._build();

  _$TasksRewardDataResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'TasksRewardDataResponseSchema', 'data');
  }

  @override
  TasksRewardDataResponseSchema rebuild(
          void Function(TasksRewardDataResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRewardDataResponseSchemaBuilder toBuilder() =>
      new TasksRewardDataResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRewardDataResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TasksRewardDataResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class TasksRewardDataResponseSchemaBuilder
    implements
        Builder<TasksRewardDataResponseSchema,
            TasksRewardDataResponseSchemaBuilder> {
  _$TasksRewardDataResponseSchema? _$v;

  TasksRewardDataSchemaBuilder? _data;
  TasksRewardDataSchemaBuilder get data =>
      _$this._data ??= new TasksRewardDataSchemaBuilder();
  set data(TasksRewardDataSchemaBuilder? data) => _$this._data = data;

  TasksRewardDataResponseSchemaBuilder() {
    TasksRewardDataResponseSchema._defaults(this);
  }

  TasksRewardDataResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRewardDataResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRewardDataResponseSchema;
  }

  @override
  void update(void Function(TasksRewardDataResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TasksRewardDataResponseSchema build() => _build();

  _$TasksRewardDataResponseSchema _build() {
    _$TasksRewardDataResponseSchema _$result;
    try {
      _$result =
          _$v ?? new _$TasksRewardDataResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TasksRewardDataResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
