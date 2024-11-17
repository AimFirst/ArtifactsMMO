// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyAccountDetails extends MyAccountDetails {
  @override
  final String username;
  @override
  final String email;
  @override
  final bool subscribed;
  @override
  final AccountStatus status;
  @override
  final int gems;
  @override
  final int achievementsPoints;
  @override
  final bool banned;
  @override
  final BuiltList<JsonObject?>? badges;
  @override
  final String? banReason;

  factory _$MyAccountDetails(
          [void Function(MyAccountDetailsBuilder)? updates]) =>
      (new MyAccountDetailsBuilder()..update(updates))._build();

  _$MyAccountDetails._(
      {required this.username,
      required this.email,
      required this.subscribed,
      required this.status,
      required this.gems,
      required this.achievementsPoints,
      required this.banned,
      this.badges,
      this.banReason})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        username, r'MyAccountDetails', 'username');
    BuiltValueNullFieldError.checkNotNull(email, r'MyAccountDetails', 'email');
    BuiltValueNullFieldError.checkNotNull(
        subscribed, r'MyAccountDetails', 'subscribed');
    BuiltValueNullFieldError.checkNotNull(
        status, r'MyAccountDetails', 'status');
    BuiltValueNullFieldError.checkNotNull(gems, r'MyAccountDetails', 'gems');
    BuiltValueNullFieldError.checkNotNull(
        achievementsPoints, r'MyAccountDetails', 'achievementsPoints');
    BuiltValueNullFieldError.checkNotNull(
        banned, r'MyAccountDetails', 'banned');
  }

  @override
  MyAccountDetails rebuild(void Function(MyAccountDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyAccountDetailsBuilder toBuilder() =>
      new MyAccountDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyAccountDetails &&
        username == other.username &&
        email == other.email &&
        subscribed == other.subscribed &&
        status == other.status &&
        gems == other.gems &&
        achievementsPoints == other.achievementsPoints &&
        banned == other.banned &&
        badges == other.badges &&
        banReason == other.banReason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, subscribed.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, gems.hashCode);
    _$hash = $jc(_$hash, achievementsPoints.hashCode);
    _$hash = $jc(_$hash, banned.hashCode);
    _$hash = $jc(_$hash, badges.hashCode);
    _$hash = $jc(_$hash, banReason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyAccountDetails')
          ..add('username', username)
          ..add('email', email)
          ..add('subscribed', subscribed)
          ..add('status', status)
          ..add('gems', gems)
          ..add('achievementsPoints', achievementsPoints)
          ..add('banned', banned)
          ..add('badges', badges)
          ..add('banReason', banReason))
        .toString();
  }
}

class MyAccountDetailsBuilder
    implements Builder<MyAccountDetails, MyAccountDetailsBuilder> {
  _$MyAccountDetails? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _subscribed;
  bool? get subscribed => _$this._subscribed;
  set subscribed(bool? subscribed) => _$this._subscribed = subscribed;

  AccountStatus? _status;
  AccountStatus? get status => _$this._status;
  set status(AccountStatus? status) => _$this._status = status;

  int? _gems;
  int? get gems => _$this._gems;
  set gems(int? gems) => _$this._gems = gems;

  int? _achievementsPoints;
  int? get achievementsPoints => _$this._achievementsPoints;
  set achievementsPoints(int? achievementsPoints) =>
      _$this._achievementsPoints = achievementsPoints;

  bool? _banned;
  bool? get banned => _$this._banned;
  set banned(bool? banned) => _$this._banned = banned;

  ListBuilder<JsonObject?>? _badges;
  ListBuilder<JsonObject?> get badges =>
      _$this._badges ??= new ListBuilder<JsonObject?>();
  set badges(ListBuilder<JsonObject?>? badges) => _$this._badges = badges;

  String? _banReason;
  String? get banReason => _$this._banReason;
  set banReason(String? banReason) => _$this._banReason = banReason;

  MyAccountDetailsBuilder() {
    MyAccountDetails._defaults(this);
  }

  MyAccountDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _email = $v.email;
      _subscribed = $v.subscribed;
      _status = $v.status;
      _gems = $v.gems;
      _achievementsPoints = $v.achievementsPoints;
      _banned = $v.banned;
      _badges = $v.badges?.toBuilder();
      _banReason = $v.banReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyAccountDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyAccountDetails;
  }

  @override
  void update(void Function(MyAccountDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyAccountDetails build() => _build();

  _$MyAccountDetails _build() {
    _$MyAccountDetails _$result;
    try {
      _$result = _$v ??
          new _$MyAccountDetails._(
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'MyAccountDetails', 'username'),
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'MyAccountDetails', 'email'),
              subscribed: BuiltValueNullFieldError.checkNotNull(
                  subscribed, r'MyAccountDetails', 'subscribed'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'MyAccountDetails', 'status'),
              gems: BuiltValueNullFieldError.checkNotNull(
                  gems, r'MyAccountDetails', 'gems'),
              achievementsPoints: BuiltValueNullFieldError.checkNotNull(
                  achievementsPoints,
                  r'MyAccountDetails',
                  'achievementsPoints'),
              banned: BuiltValueNullFieldError.checkNotNull(
                  banned, r'MyAccountDetails', 'banned'),
              badges: _badges?.build(),
              banReason: banReason);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'badges';
        _badges?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyAccountDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
