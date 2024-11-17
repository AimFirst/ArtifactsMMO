// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_achievement_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountAchievementSchema extends AccountAchievementSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final String description;
  @override
  final int points;
  @override
  final AchievementType type;
  @override
  final String? target;
  @override
  final int total;
  @override
  final AchievementRewardsSchema rewards;
  @override
  final int current;
  @override
  final DateTime? completedAt;

  factory _$AccountAchievementSchema(
          [void Function(AccountAchievementSchemaBuilder)? updates]) =>
      (new AccountAchievementSchemaBuilder()..update(updates))._build();

  _$AccountAchievementSchema._(
      {required this.name,
      required this.code,
      required this.description,
      required this.points,
      required this.type,
      this.target,
      required this.total,
      required this.rewards,
      required this.current,
      this.completedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'AccountAchievementSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(
        code, r'AccountAchievementSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        description, r'AccountAchievementSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(
        points, r'AccountAchievementSchema', 'points');
    BuiltValueNullFieldError.checkNotNull(
        type, r'AccountAchievementSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(
        total, r'AccountAchievementSchema', 'total');
    BuiltValueNullFieldError.checkNotNull(
        rewards, r'AccountAchievementSchema', 'rewards');
    BuiltValueNullFieldError.checkNotNull(
        current, r'AccountAchievementSchema', 'current');
  }

  @override
  AccountAchievementSchema rebuild(
          void Function(AccountAchievementSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountAchievementSchemaBuilder toBuilder() =>
      new AccountAchievementSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountAchievementSchema &&
        name == other.name &&
        code == other.code &&
        description == other.description &&
        points == other.points &&
        type == other.type &&
        target == other.target &&
        total == other.total &&
        rewards == other.rewards &&
        current == other.current &&
        completedAt == other.completedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, points.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, target.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, rewards.hashCode);
    _$hash = $jc(_$hash, current.hashCode);
    _$hash = $jc(_$hash, completedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountAchievementSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('description', description)
          ..add('points', points)
          ..add('type', type)
          ..add('target', target)
          ..add('total', total)
          ..add('rewards', rewards)
          ..add('current', current)
          ..add('completedAt', completedAt))
        .toString();
  }
}

class AccountAchievementSchemaBuilder
    implements
        Builder<AccountAchievementSchema, AccountAchievementSchemaBuilder> {
  _$AccountAchievementSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _points;
  int? get points => _$this._points;
  set points(int? points) => _$this._points = points;

  AchievementType? _type;
  AchievementType? get type => _$this._type;
  set type(AchievementType? type) => _$this._type = type;

  String? _target;
  String? get target => _$this._target;
  set target(String? target) => _$this._target = target;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  AchievementRewardsSchemaBuilder? _rewards;
  AchievementRewardsSchemaBuilder get rewards =>
      _$this._rewards ??= new AchievementRewardsSchemaBuilder();
  set rewards(AchievementRewardsSchemaBuilder? rewards) =>
      _$this._rewards = rewards;

  int? _current;
  int? get current => _$this._current;
  set current(int? current) => _$this._current = current;

  DateTime? _completedAt;
  DateTime? get completedAt => _$this._completedAt;
  set completedAt(DateTime? completedAt) => _$this._completedAt = completedAt;

  AccountAchievementSchemaBuilder() {
    AccountAchievementSchema._defaults(this);
  }

  AccountAchievementSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _description = $v.description;
      _points = $v.points;
      _type = $v.type;
      _target = $v.target;
      _total = $v.total;
      _rewards = $v.rewards.toBuilder();
      _current = $v.current;
      _completedAt = $v.completedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountAchievementSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountAchievementSchema;
  }

  @override
  void update(void Function(AccountAchievementSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountAchievementSchema build() => _build();

  _$AccountAchievementSchema _build() {
    _$AccountAchievementSchema _$result;
    try {
      _$result = _$v ??
          new _$AccountAchievementSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'AccountAchievementSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'AccountAchievementSchema', 'code'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'AccountAchievementSchema', 'description'),
              points: BuiltValueNullFieldError.checkNotNull(
                  points, r'AccountAchievementSchema', 'points'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'AccountAchievementSchema', 'type'),
              target: target,
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'AccountAchievementSchema', 'total'),
              rewards: rewards.build(),
              current: BuiltValueNullFieldError.checkNotNull(
                  current, r'AccountAchievementSchema', 'current'),
              completedAt: completedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rewards';
        rewards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AccountAchievementSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
