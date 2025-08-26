// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountDetails extends AccountDetails {
  @override
  final String username;
  @override
  final bool member;
  @override
  final AccountStatus status;
  @override
  final BuiltList<JsonObject?> skins;
  @override
  final int achievementsPoints;
  @override
  final bool banned;
  @override
  final BuiltList<JsonObject?>? badges;
  @override
  final String? banReason;

  factory _$AccountDetails([void Function(AccountDetailsBuilder)? updates]) =>
      (AccountDetailsBuilder()..update(updates))._build();

  _$AccountDetails._(
      {required this.username,
      required this.member,
      required this.status,
      required this.skins,
      required this.achievementsPoints,
      required this.banned,
      this.badges,
      this.banReason})
      : super._();
  @override
  AccountDetails rebuild(void Function(AccountDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountDetailsBuilder toBuilder() => AccountDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountDetails &&
        username == other.username &&
        member == other.member &&
        status == other.status &&
        skins == other.skins &&
        achievementsPoints == other.achievementsPoints &&
        banned == other.banned &&
        badges == other.badges &&
        banReason == other.banReason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, member.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, skins.hashCode);
    _$hash = $jc(_$hash, achievementsPoints.hashCode);
    _$hash = $jc(_$hash, banned.hashCode);
    _$hash = $jc(_$hash, badges.hashCode);
    _$hash = $jc(_$hash, banReason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountDetails')
          ..add('username', username)
          ..add('member', member)
          ..add('status', status)
          ..add('skins', skins)
          ..add('achievementsPoints', achievementsPoints)
          ..add('banned', banned)
          ..add('badges', badges)
          ..add('banReason', banReason))
        .toString();
  }
}

class AccountDetailsBuilder
    implements Builder<AccountDetails, AccountDetailsBuilder> {
  _$AccountDetails? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  bool? _member;
  bool? get member => _$this._member;
  set member(bool? member) => _$this._member = member;

  AccountStatus? _status;
  AccountStatus? get status => _$this._status;
  set status(AccountStatus? status) => _$this._status = status;

  ListBuilder<JsonObject?>? _skins;
  ListBuilder<JsonObject?> get skins =>
      _$this._skins ??= ListBuilder<JsonObject?>();
  set skins(ListBuilder<JsonObject?>? skins) => _$this._skins = skins;

  int? _achievementsPoints;
  int? get achievementsPoints => _$this._achievementsPoints;
  set achievementsPoints(int? achievementsPoints) =>
      _$this._achievementsPoints = achievementsPoints;

  bool? _banned;
  bool? get banned => _$this._banned;
  set banned(bool? banned) => _$this._banned = banned;

  ListBuilder<JsonObject?>? _badges;
  ListBuilder<JsonObject?> get badges =>
      _$this._badges ??= ListBuilder<JsonObject?>();
  set badges(ListBuilder<JsonObject?>? badges) => _$this._badges = badges;

  String? _banReason;
  String? get banReason => _$this._banReason;
  set banReason(String? banReason) => _$this._banReason = banReason;

  AccountDetailsBuilder() {
    AccountDetails._defaults(this);
  }

  AccountDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _member = $v.member;
      _status = $v.status;
      _skins = $v.skins.toBuilder();
      _achievementsPoints = $v.achievementsPoints;
      _banned = $v.banned;
      _badges = $v.badges?.toBuilder();
      _banReason = $v.banReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountDetails other) {
    _$v = other as _$AccountDetails;
  }

  @override
  void update(void Function(AccountDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountDetails build() => _build();

  _$AccountDetails _build() {
    _$AccountDetails _$result;
    try {
      _$result = _$v ??
          _$AccountDetails._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'AccountDetails', 'username'),
            member: BuiltValueNullFieldError.checkNotNull(
                member, r'AccountDetails', 'member'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AccountDetails', 'status'),
            skins: skins.build(),
            achievementsPoints: BuiltValueNullFieldError.checkNotNull(
                achievementsPoints, r'AccountDetails', 'achievementsPoints'),
            banned: BuiltValueNullFieldError.checkNotNull(
                banned, r'AccountDetails', 'banned'),
            badges: _badges?.build(),
            banReason: banReason,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skins';
        skins.build();

        _$failedField = 'badges';
        _badges?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AccountDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
