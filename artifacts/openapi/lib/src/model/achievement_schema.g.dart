// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AchievementSchema extends AchievementSchema {
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

  factory _$AchievementSchema(
          [void Function(AchievementSchemaBuilder)? updates]) =>
      (new AchievementSchemaBuilder()..update(updates))._build();

  _$AchievementSchema._(
      {required this.name,
      required this.code,
      required this.description,
      required this.points,
      required this.type,
      this.target,
      required this.total,
      required this.rewards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'AchievementSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'AchievementSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        description, r'AchievementSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(
        points, r'AchievementSchema', 'points');
    BuiltValueNullFieldError.checkNotNull(type, r'AchievementSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(total, r'AchievementSchema', 'total');
    BuiltValueNullFieldError.checkNotNull(
        rewards, r'AchievementSchema', 'rewards');
  }

  @override
  AchievementSchema rebuild(void Function(AchievementSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AchievementSchemaBuilder toBuilder() =>
      new AchievementSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AchievementSchema &&
        name == other.name &&
        code == other.code &&
        description == other.description &&
        points == other.points &&
        type == other.type &&
        target == other.target &&
        total == other.total &&
        rewards == other.rewards;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AchievementSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('description', description)
          ..add('points', points)
          ..add('type', type)
          ..add('target', target)
          ..add('total', total)
          ..add('rewards', rewards))
        .toString();
  }
}

class AchievementSchemaBuilder
    implements Builder<AchievementSchema, AchievementSchemaBuilder> {
  _$AchievementSchema? _$v;

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

  AchievementSchemaBuilder() {
    AchievementSchema._defaults(this);
  }

  AchievementSchemaBuilder get _$this {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AchievementSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AchievementSchema;
  }

  @override
  void update(void Function(AchievementSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AchievementSchema build() => _build();

  _$AchievementSchema _build() {
    _$AchievementSchema _$result;
    try {
      _$result = _$v ??
          new _$AchievementSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'AchievementSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'AchievementSchema', 'code'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'AchievementSchema', 'description'),
              points: BuiltValueNullFieldError.checkNotNull(
                  points, r'AchievementSchema', 'points'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'AchievementSchema', 'type'),
              target: target,
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'AchievementSchema', 'total'),
              rewards: rewards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rewards';
        rewards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AchievementSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
