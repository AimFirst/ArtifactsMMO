// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_data_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RewardDataSchema extends RewardDataSchema {
  @override
  final CooldownSchema cooldown;
  @override
  final RewardsSchema rewards;
  @override
  final CharacterSchema character;

  factory _$RewardDataSchema(
          [void Function(RewardDataSchemaBuilder)? updates]) =>
      (new RewardDataSchemaBuilder()..update(updates))._build();

  _$RewardDataSchema._(
      {required this.cooldown, required this.rewards, required this.character})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cooldown, r'RewardDataSchema', 'cooldown');
    BuiltValueNullFieldError.checkNotNull(
        rewards, r'RewardDataSchema', 'rewards');
    BuiltValueNullFieldError.checkNotNull(
        character, r'RewardDataSchema', 'character');
  }

  @override
  RewardDataSchema rebuild(void Function(RewardDataSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RewardDataSchemaBuilder toBuilder() =>
      new RewardDataSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardDataSchema &&
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
    return (newBuiltValueToStringHelper(r'RewardDataSchema')
          ..add('cooldown', cooldown)
          ..add('rewards', rewards)
          ..add('character', character))
        .toString();
  }
}

class RewardDataSchemaBuilder
    implements Builder<RewardDataSchema, RewardDataSchemaBuilder> {
  _$RewardDataSchema? _$v;

  CooldownSchemaBuilder? _cooldown;
  CooldownSchemaBuilder get cooldown =>
      _$this._cooldown ??= new CooldownSchemaBuilder();
  set cooldown(CooldownSchemaBuilder? cooldown) => _$this._cooldown = cooldown;

  RewardsSchemaBuilder? _rewards;
  RewardsSchemaBuilder get rewards =>
      _$this._rewards ??= new RewardsSchemaBuilder();
  set rewards(RewardsSchemaBuilder? rewards) => _$this._rewards = rewards;

  CharacterSchemaBuilder? _character;
  CharacterSchemaBuilder get character =>
      _$this._character ??= new CharacterSchemaBuilder();
  set character(CharacterSchemaBuilder? character) =>
      _$this._character = character;

  RewardDataSchemaBuilder() {
    RewardDataSchema._defaults(this);
  }

  RewardDataSchemaBuilder get _$this {
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
  void replace(RewardDataSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RewardDataSchema;
  }

  @override
  void update(void Function(RewardDataSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RewardDataSchema build() => _build();

  _$RewardDataSchema _build() {
    _$RewardDataSchema _$result;
    try {
      _$result = _$v ??
          new _$RewardDataSchema._(
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
            r'RewardDataSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
