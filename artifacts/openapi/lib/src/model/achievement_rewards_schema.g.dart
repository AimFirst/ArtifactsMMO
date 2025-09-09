// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_rewards_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AchievementRewardsSchema extends AchievementRewardsSchema {
  @override
  final int gold;

  factory _$AchievementRewardsSchema(
          [void Function(AchievementRewardsSchemaBuilder)? updates]) =>
      (new AchievementRewardsSchemaBuilder()..update(updates))._build();

  _$AchievementRewardsSchema._({required this.gold}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        gold, r'AchievementRewardsSchema', 'gold');
  }

  @override
  AchievementRewardsSchema rebuild(
          void Function(AchievementRewardsSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AchievementRewardsSchemaBuilder toBuilder() =>
      new AchievementRewardsSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AchievementRewardsSchema && gold == other.gold;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gold.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AchievementRewardsSchema')
          ..add('gold', gold))
        .toString();
  }
}

class AchievementRewardsSchemaBuilder
    implements
        Builder<AchievementRewardsSchema, AchievementRewardsSchemaBuilder> {
  _$AchievementRewardsSchema? _$v;

  int? _gold;
  int? get gold => _$this._gold;
  set gold(int? gold) => _$this._gold = gold;

  AchievementRewardsSchemaBuilder() {
    AchievementRewardsSchema._defaults(this);
  }

  AchievementRewardsSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gold = $v.gold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AchievementRewardsSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AchievementRewardsSchema;
  }

  @override
  void update(void Function(AchievementRewardsSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AchievementRewardsSchema build() => _build();

  _$AchievementRewardsSchema _build() {
    final _$result = _$v ??
        new _$AchievementRewardsSchema._(
            gold: BuiltValueNullFieldError.checkNotNull(
                gold, r'AchievementRewardsSchema', 'gold'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
