// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangePassword extends ChangePassword {
  @override
  final String currentPassword;
  @override
  final String newPassword;

  factory _$ChangePassword([void Function(ChangePasswordBuilder)? updates]) =>
      (new ChangePasswordBuilder()..update(updates))._build();

  _$ChangePassword._({required this.currentPassword, required this.newPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currentPassword, r'ChangePassword', 'currentPassword');
    BuiltValueNullFieldError.checkNotNull(
        newPassword, r'ChangePassword', 'newPassword');
  }

  @override
  ChangePassword rebuild(void Function(ChangePasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangePasswordBuilder toBuilder() =>
      new ChangePasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangePassword &&
        currentPassword == other.currentPassword &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentPassword.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangePassword')
          ..add('currentPassword', currentPassword)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class ChangePasswordBuilder
    implements Builder<ChangePassword, ChangePasswordBuilder> {
  _$ChangePassword? _$v;

  String? _currentPassword;
  String? get currentPassword => _$this._currentPassword;
  set currentPassword(String? currentPassword) =>
      _$this._currentPassword = currentPassword;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  ChangePasswordBuilder() {
    ChangePassword._defaults(this);
  }

  ChangePasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPassword = $v.currentPassword;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangePassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangePassword;
  }

  @override
  void update(void Function(ChangePasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangePassword build() => _build();

  _$ChangePassword _build() {
    final _$result = _$v ??
        new _$ChangePassword._(
            currentPassword: BuiltValueNullFieldError.checkNotNull(
                currentPassword, r'ChangePassword', 'currentPassword'),
            newPassword: BuiltValueNullFieldError.checkNotNull(
                newPassword, r'ChangePassword', 'newPassword'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
