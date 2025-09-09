// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskSchema extends TaskSchema {
  @override
  final String code;
  @override
  final TaskType type;
  @override
  final int total;
  @override
  final RewardsSchema rewards;

  factory _$TaskSchema([void Function(TaskSchemaBuilder)? updates]) =>
      (new TaskSchemaBuilder()..update(updates))._build();

  _$TaskSchema._(
      {required this.code,
      required this.type,
      required this.total,
      required this.rewards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'TaskSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(type, r'TaskSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(total, r'TaskSchema', 'total');
    BuiltValueNullFieldError.checkNotNull(rewards, r'TaskSchema', 'rewards');
  }

  @override
  TaskSchema rebuild(void Function(TaskSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskSchemaBuilder toBuilder() => new TaskSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskSchema &&
        code == other.code &&
        type == other.type &&
        total == other.total &&
        rewards == other.rewards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, rewards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskSchema')
          ..add('code', code)
          ..add('type', type)
          ..add('total', total)
          ..add('rewards', rewards))
        .toString();
  }
}

class TaskSchemaBuilder implements Builder<TaskSchema, TaskSchemaBuilder> {
  _$TaskSchema? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  TaskType? _type;
  TaskType? get type => _$this._type;
  set type(TaskType? type) => _$this._type = type;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  RewardsSchemaBuilder? _rewards;
  RewardsSchemaBuilder get rewards =>
      _$this._rewards ??= new RewardsSchemaBuilder();
  set rewards(RewardsSchemaBuilder? rewards) => _$this._rewards = rewards;

  TaskSchemaBuilder() {
    TaskSchema._defaults(this);
  }

  TaskSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _type = $v.type;
      _total = $v.total;
      _rewards = $v.rewards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskSchema;
  }

  @override
  void update(void Function(TaskSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskSchema build() => _build();

  _$TaskSchema _build() {
    _$TaskSchema _$result;
    try {
      _$result = _$v ??
          new _$TaskSchema._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'TaskSchema', 'code'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'TaskSchema', 'type'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'TaskSchema', 'total'),
              rewards: rewards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rewards';
        rewards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TaskSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
