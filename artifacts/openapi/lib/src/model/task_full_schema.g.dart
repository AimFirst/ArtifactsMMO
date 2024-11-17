// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_full_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskFullSchema extends TaskFullSchema {
  @override
  final String code;
  @override
  final int level;
  @override
  final TaskType type;
  @override
  final int minQuantity;
  @override
  final int maxQuantity;
  @override
  final String? skill;
  @override
  final TaskRewardsSchema rewards;

  factory _$TaskFullSchema([void Function(TaskFullSchemaBuilder)? updates]) =>
      (new TaskFullSchemaBuilder()..update(updates))._build();

  _$TaskFullSchema._(
      {required this.code,
      required this.level,
      required this.type,
      required this.minQuantity,
      required this.maxQuantity,
      this.skill,
      required this.rewards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'TaskFullSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(level, r'TaskFullSchema', 'level');
    BuiltValueNullFieldError.checkNotNull(type, r'TaskFullSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(
        minQuantity, r'TaskFullSchema', 'minQuantity');
    BuiltValueNullFieldError.checkNotNull(
        maxQuantity, r'TaskFullSchema', 'maxQuantity');
    BuiltValueNullFieldError.checkNotNull(
        rewards, r'TaskFullSchema', 'rewards');
  }

  @override
  TaskFullSchema rebuild(void Function(TaskFullSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskFullSchemaBuilder toBuilder() =>
      new TaskFullSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskFullSchema &&
        code == other.code &&
        level == other.level &&
        type == other.type &&
        minQuantity == other.minQuantity &&
        maxQuantity == other.maxQuantity &&
        skill == other.skill &&
        rewards == other.rewards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, minQuantity.hashCode);
    _$hash = $jc(_$hash, maxQuantity.hashCode);
    _$hash = $jc(_$hash, skill.hashCode);
    _$hash = $jc(_$hash, rewards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskFullSchema')
          ..add('code', code)
          ..add('level', level)
          ..add('type', type)
          ..add('minQuantity', minQuantity)
          ..add('maxQuantity', maxQuantity)
          ..add('skill', skill)
          ..add('rewards', rewards))
        .toString();
  }
}

class TaskFullSchemaBuilder
    implements Builder<TaskFullSchema, TaskFullSchemaBuilder> {
  _$TaskFullSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  TaskType? _type;
  TaskType? get type => _$this._type;
  set type(TaskType? type) => _$this._type = type;

  int? _minQuantity;
  int? get minQuantity => _$this._minQuantity;
  set minQuantity(int? minQuantity) => _$this._minQuantity = minQuantity;

  int? _maxQuantity;
  int? get maxQuantity => _$this._maxQuantity;
  set maxQuantity(int? maxQuantity) => _$this._maxQuantity = maxQuantity;

  String? _skill;
  String? get skill => _$this._skill;
  set skill(String? skill) => _$this._skill = skill;

  TaskRewardsSchemaBuilder? _rewards;
  TaskRewardsSchemaBuilder get rewards =>
      _$this._rewards ??= new TaskRewardsSchemaBuilder();
  set rewards(TaskRewardsSchemaBuilder? rewards) => _$this._rewards = rewards;

  TaskFullSchemaBuilder() {
    TaskFullSchema._defaults(this);
  }

  TaskFullSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _level = $v.level;
      _type = $v.type;
      _minQuantity = $v.minQuantity;
      _maxQuantity = $v.maxQuantity;
      _skill = $v.skill;
      _rewards = $v.rewards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskFullSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskFullSchema;
  }

  @override
  void update(void Function(TaskFullSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskFullSchema build() => _build();

  _$TaskFullSchema _build() {
    _$TaskFullSchema _$result;
    try {
      _$result = _$v ??
          new _$TaskFullSchema._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'TaskFullSchema', 'code'),
              level: BuiltValueNullFieldError.checkNotNull(
                  level, r'TaskFullSchema', 'level'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'TaskFullSchema', 'type'),
              minQuantity: BuiltValueNullFieldError.checkNotNull(
                  minQuantity, r'TaskFullSchema', 'minQuantity'),
              maxQuantity: BuiltValueNullFieldError.checkNotNull(
                  maxQuantity, r'TaskFullSchema', 'maxQuantity'),
              skill: skill,
              rewards: rewards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rewards';
        rewards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskFullSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
