// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_reward_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TasksRewardResponseSchema extends TasksRewardResponseSchema {
  @override
  final DropRateSchema data;

  factory _$TasksRewardResponseSchema(
          [void Function(TasksRewardResponseSchemaBuilder)? updates]) =>
      (new TasksRewardResponseSchemaBuilder()..update(updates))._build();

  _$TasksRewardResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'TasksRewardResponseSchema', 'data');
  }

  @override
  TasksRewardResponseSchema rebuild(
          void Function(TasksRewardResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRewardResponseSchemaBuilder toBuilder() =>
      new TasksRewardResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRewardResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TasksRewardResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class TasksRewardResponseSchemaBuilder
    implements
        Builder<TasksRewardResponseSchema, TasksRewardResponseSchemaBuilder> {
  _$TasksRewardResponseSchema? _$v;

  DropRateSchemaBuilder? _data;
  DropRateSchemaBuilder get data =>
      _$this._data ??= new DropRateSchemaBuilder();
  set data(DropRateSchemaBuilder? data) => _$this._data = data;

  TasksRewardResponseSchemaBuilder() {
    TasksRewardResponseSchema._defaults(this);
  }

  TasksRewardResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRewardResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRewardResponseSchema;
  }

  @override
  void update(void Function(TasksRewardResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TasksRewardResponseSchema build() => _build();

  _$TasksRewardResponseSchema _build() {
    _$TasksRewardResponseSchema _$result;
    try {
      _$result = _$v ?? new _$TasksRewardResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TasksRewardResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
