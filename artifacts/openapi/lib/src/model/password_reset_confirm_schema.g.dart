// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetConfirmSchema extends PasswordResetConfirmSchema {
  @override
  final String token;
  @override
  final String newPassword;

  factory _$PasswordResetConfirmSchema(
          [void Function(PasswordResetConfirmSchemaBuilder)? updates]) =>
      (new PasswordResetConfirmSchemaBuilder()..update(updates))._build();

  _$PasswordResetConfirmSchema._(
      {required this.token, required this.newPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'PasswordResetConfirmSchema', 'token');
    BuiltValueNullFieldError.checkNotNull(
        newPassword, r'PasswordResetConfirmSchema', 'newPassword');
  }

  @override
  PasswordResetConfirmSchema rebuild(
          void Function(PasswordResetConfirmSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordResetConfirmSchemaBuilder toBuilder() =>
      new PasswordResetConfirmSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetConfirmSchema &&
        token == other.token &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetConfirmSchema')
          ..add('token', token)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class PasswordResetConfirmSchemaBuilder
    implements
        Builder<PasswordResetConfirmSchema, PasswordResetConfirmSchemaBuilder> {
  _$PasswordResetConfirmSchema? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  PasswordResetConfirmSchemaBuilder() {
    PasswordResetConfirmSchema._defaults(this);
  }

  PasswordResetConfirmSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetConfirmSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasswordResetConfirmSchema;
  }

  @override
  void update(void Function(PasswordResetConfirmSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetConfirmSchema build() => _build();

  _$PasswordResetConfirmSchema _build() {
    final _$result = _$v ??
        new _$PasswordResetConfirmSchema._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'PasswordResetConfirmSchema', 'token'),
            newPassword: BuiltValueNullFieldError.checkNotNull(
                newPassword, r'PasswordResetConfirmSchema', 'newPassword'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
