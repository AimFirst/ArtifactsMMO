// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_leaderboard_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountLeaderboardSchema extends AccountLeaderboardSchema {
  @override
  final int position;
  @override
  final String account;
  @override
  final AccountStatus status;
  @override
  final int achievementsPoints;
  @override
  final int gold;

  factory _$AccountLeaderboardSchema(
          [void Function(AccountLeaderboardSchemaBuilder)? updates]) =>
      (new AccountLeaderboardSchemaBuilder()..update(updates))._build();

  _$AccountLeaderboardSchema._(
      {required this.position,
      required this.account,
      required this.status,
      required this.achievementsPoints,
      required this.gold})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        position, r'AccountLeaderboardSchema', 'position');
    BuiltValueNullFieldError.checkNotNull(
        account, r'AccountLeaderboardSchema', 'account');
    BuiltValueNullFieldError.checkNotNull(
        status, r'AccountLeaderboardSchema', 'status');
    BuiltValueNullFieldError.checkNotNull(
        achievementsPoints, r'AccountLeaderboardSchema', 'achievementsPoints');
    BuiltValueNullFieldError.checkNotNull(
        gold, r'AccountLeaderboardSchema', 'gold');
  }

  @override
  AccountLeaderboardSchema rebuild(
          void Function(AccountLeaderboardSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountLeaderboardSchemaBuilder toBuilder() =>
      new AccountLeaderboardSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountLeaderboardSchema &&
        position == other.position &&
        account == other.account &&
        status == other.status &&
        achievementsPoints == other.achievementsPoints &&
        gold == other.gold;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, account.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, achievementsPoints.hashCode);
    _$hash = $jc(_$hash, gold.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountLeaderboardSchema')
          ..add('position', position)
          ..add('account', account)
          ..add('status', status)
          ..add('achievementsPoints', achievementsPoints)
          ..add('gold', gold))
        .toString();
  }
}

class AccountLeaderboardSchemaBuilder
    implements
        Builder<AccountLeaderboardSchema, AccountLeaderboardSchemaBuilder> {
  _$AccountLeaderboardSchema? _$v;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _account;
  String? get account => _$this._account;
  set account(String? account) => _$this._account = account;

  AccountStatus? _status;
  AccountStatus? get status => _$this._status;
  set status(AccountStatus? status) => _$this._status = status;

  int? _achievementsPoints;
  int? get achievementsPoints => _$this._achievementsPoints;
  set achievementsPoints(int? achievementsPoints) =>
      _$this._achievementsPoints = achievementsPoints;

  int? _gold;
  int? get gold => _$this._gold;
  set gold(int? gold) => _$this._gold = gold;

  AccountLeaderboardSchemaBuilder() {
    AccountLeaderboardSchema._defaults(this);
  }

  AccountLeaderboardSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _position = $v.position;
      _account = $v.account;
      _status = $v.status;
      _achievementsPoints = $v.achievementsPoints;
      _gold = $v.gold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountLeaderboardSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountLeaderboardSchema;
  }

  @override
  void update(void Function(AccountLeaderboardSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountLeaderboardSchema build() => _build();

  _$AccountLeaderboardSchema _build() {
    final _$result = _$v ??
        new _$AccountLeaderboardSchema._(
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'AccountLeaderboardSchema', 'position'),
            account: BuiltValueNullFieldError.checkNotNull(
                account, r'AccountLeaderboardSchema', 'account'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AccountLeaderboardSchema', 'status'),
            achievementsPoints: BuiltValueNullFieldError.checkNotNull(
                achievementsPoints,
                r'AccountLeaderboardSchema',
                'achievementsPoints'),
            gold: BuiltValueNullFieldError.checkNotNull(
                gold, r'AccountLeaderboardSchema', 'gold'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
