// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_trade_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskTradeResponseSchema extends TaskTradeResponseSchema {
  @override
  final TaskTradeDataSchema data;

  factory _$TaskTradeResponseSchema(
          [void Function(TaskTradeResponseSchemaBuilder)? updates]) =>
      (new TaskTradeResponseSchemaBuilder()..update(updates))._build();

  _$TaskTradeResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'TaskTradeResponseSchema', 'data');
  }

  @override
  TaskTradeResponseSchema rebuild(
          void Function(TaskTradeResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskTradeResponseSchemaBuilder toBuilder() =>
      new TaskTradeResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskTradeResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TaskTradeResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class TaskTradeResponseSchemaBuilder
    implements
        Builder<TaskTradeResponseSchema, TaskTradeResponseSchemaBuilder> {
  _$TaskTradeResponseSchema? _$v;

  TaskTradeDataSchemaBuilder? _data;
  TaskTradeDataSchemaBuilder get data =>
      _$this._data ??= new TaskTradeDataSchemaBuilder();
  set data(TaskTradeDataSchemaBuilder? data) => _$this._data = data;

  TaskTradeResponseSchemaBuilder() {
    TaskTradeResponseSchema._defaults(this);
  }

  TaskTradeResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskTradeResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskTradeResponseSchema;
  }

  @override
  void update(void Function(TaskTradeResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskTradeResponseSchema build() => _build();

  _$TaskTradeResponseSchema _build() {
    _$TaskTradeResponseSchema _$result;
    try {
      _$result = _$v ?? new _$TaskTradeResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskTradeResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
