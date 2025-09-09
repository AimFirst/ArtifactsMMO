// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_cancelled_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskCancelledSchema extends TaskCancelledSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final CharacterSchema character;

  factory _$TaskCancelledSchema(
          [void Function(TaskCancelledSchemaBuilder)? updates]) =>
      (new TaskCancelledSchemaBuilder()..update(updates))._build();

  _$TaskCancelledSchema._({required this.cooldown, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'TaskCancelledSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        character, r'TaskCancelledSchema', 'character');
  }

  @override
  TaskCancelledSchema rebuild(
          void Function(TaskCancelledSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskCancelledSchemaBuilder toBuilder() =>
      new TaskCancelledSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskCancelledSchema &&
        cooldown == other.cooldown &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskCancelledSchema')
          ..add('cooldown', cooldown)
          ..add('character', character))
        .toString();
  }
}

class TaskCancelledSchemaBuilder
    implements Builder<TaskCancelledSchema, TaskCancelledSchemaBuilder> {
  _$TaskCancelledSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  TaskCancelledSchemaBuilder() {
    TaskCancelledSchema._defaults(this);
  }

  TaskCancelledSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskCancelledSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskCancelledSchema;
  }

  @override
  void update(void Function(TaskCancelledSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskCancelledSchema build() => _build();

  _$TaskCancelledSchema _build() {
    _$TaskCancelledSchema _$result;
    try {
      _$result = _$v ??
          new _$TaskCancelledSchema._(
              cooldown: cooldown.build(), character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskCancelledSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
