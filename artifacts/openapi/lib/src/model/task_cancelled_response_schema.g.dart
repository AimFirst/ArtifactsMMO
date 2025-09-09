// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_cancelled_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskCancelledResponseSchema extends TaskCancelledResponseSchema {
  @override
  final TaskCancelledSchema data;

  factory _$TaskCancelledResponseSchema(
          [void Function(TaskCancelledResponseSchemaBuilder)? updates]) =>
      (new TaskCancelledResponseSchemaBuilder()..update(updates))._build();

  _$TaskCancelledResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'TaskCancelledResponseSchema', 'data');
  }

  @override
  TaskCancelledResponseSchema rebuild(
          void Function(TaskCancelledResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskCancelledResponseSchemaBuilder toBuilder() =>
      new TaskCancelledResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskCancelledResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TaskCancelledResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class TaskCancelledResponseSchemaBuilder
    implements
        Builder<TaskCancelledResponseSchema,
            TaskCancelledResponseSchemaBuilder> {
  _$TaskCancelledResponseSchema? _$v;

  TaskCancelledSchemaBuilder? _data;
  TaskCancelledSchemaBuilder get data =>
      _$this._data ??= new TaskCancelledSchemaBuilder();
  set data(TaskCancelledSchemaBuilder? data) => _$this._data = data;

  TaskCancelledResponseSchemaBuilder() {
    TaskCancelledResponseSchema._defaults(this);
  }

  TaskCancelledResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskCancelledResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskCancelledResponseSchema;
  }

  @override
  void update(void Function(TaskCancelledResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskCancelledResponseSchema build() => _build();

  _$TaskCancelledResponseSchema _build() {
    _$TaskCancelledResponseSchema _$result;
    try {
      _$result = _$v ?? new _$TaskCancelledResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskCancelledResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
