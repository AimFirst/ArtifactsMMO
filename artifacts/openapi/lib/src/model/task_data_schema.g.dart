// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskDataSchema extends TaskDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final TaskSchema task;
  @override
  final CharacterSchema character;

  factory _$TaskDataSchema([void Function(TaskDataSchemaBuilder)? updates]) =>
      (new TaskDataSchemaBuilder()..update(updates))._build();

  _$TaskDataSchema._(
      {required this.cooldown, required this.task, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'TaskDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(task, r'TaskDataSchema', 'task');
    BuiltValueNullFieldError.checkNotNull(
        character, r'TaskDataSchema', 'character');
  }

  @override
  TaskDataSchema rebuild(void Function(TaskDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskDataSchemaBuilder toBuilder() =>
      new TaskDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskDataSchema &&
        cooldown == other.cooldown &&
        task == other.task &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskDataSchema')
          ..add('cooldown', cooldown)
          ..add('task', task)
          ..add('character', character))
        .toString();
  }
}

class TaskDataSchemaBuilder
    implements Builder<TaskDataSchema, TaskDataSchemaBuilder> {
  _$TaskDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  TaskSchemaBuilder? _task;
  TaskSchemaBuilder get task => _$this._task ??= new TaskSchemaBuilder();
  set task(TaskSchemaBuilder? task) => _$this._task = task;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  TaskDataSchemaBuilder() {
    TaskDataSchema._defaults(this);
  }

  TaskDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _task = $v.task.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskDataSchema;
  }

  @override
  void update(void Function(TaskDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskDataSchema build() => _build();

  _$TaskDataSchema _build() {
    _$TaskDataSchema _$result;
    try {
      _$result = _$v ??
          new _$TaskDataSchema._(
              cooldown: cooldown.build(),
              task: task.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'task';
        task.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
