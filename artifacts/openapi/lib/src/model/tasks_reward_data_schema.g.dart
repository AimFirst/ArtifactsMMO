// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_reward_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TasksRewardDataSchema extends TasksRewardDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final TaskRewardsSchema rewards;
  @override
  final CharacterSchema character;

  factory _$TasksRewardDataSchema(
          [void Function(TasksRewardDataSchemaBuilder)? updates]) =>
      (new TasksRewardDataSchemaBuilder()..update(updates))._build();

  _$TasksRewardDataSchema._(
      {required this.cooldown, required this.rewards, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'TasksRewardDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        rewards, r'TasksRewardDataSchema', 'rewards');
    BuiltValueNullFieldError.checkNotNull(
        character, r'TasksRewardDataSchema', 'character');
  }

  @override
  TasksRewardDataSchema rebuild(
          void Function(TasksRewardDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRewardDataSchemaBuilder toBuilder() =>
      new TasksRewardDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRewardDataSchema &&
        cooldown == other.cooldown &&
        rewards == other.rewards &&
        character == other.character;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cooldown.hashCode);
    _$hash = $jc(_$hash, rewards.hashCode);
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TasksRewardDataSchema')
          ..add('cooldown', cooldown)
          ..add('rewards', rewards)
          ..add('character', character))
        .toString();
  }
}

class TasksRewardDataSchemaBuilder
    implements Builder<TasksRewardDataSchema, TasksRewardDataSchemaBuilder> {
  _$TasksRewardDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  TaskRewardsSchemaBuilder? _rewards;
  TaskRewardsSchemaBuilder get rewards =>
      _$this._rewards ??= new TaskRewardsSchemaBuilder();
  set rewards(TaskRewardsSchemaBuilder? rewards) => _$this._rewards = rewards;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  TasksRewardDataSchemaBuilder() {
    TasksRewardDataSchema._defaults(this);
  }

  TasksRewardDataSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cooldown = $v.cooldown.toBuilder();
      _rewards = $v.rewards.toBuilder();
      _character = $v.character.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRewardDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRewardDataSchema;
  }

  @override
  void update(void Function(TasksRewardDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TasksRewardDataSchema build() => _build();

  _$TasksRewardDataSchema _build() {
    _$TasksRewardDataSchema _$result;
    try {
      _$result = _$v ??
          new _$TasksRewardDataSchema._(
              cooldown: cooldown.build(),
              rewards: rewards.build(),
              character: character.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cooldown';
        cooldown.build();
        _$failedField = 'rewards';
        rewards.build();
        _$failedField = 'character';
        character.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TasksRewardDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
