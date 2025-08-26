// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddAccountSchema extends AddAccountSchema {
  @override
  final String username;
  @override
  final String password;
  @override
  final String email;

  factory _$AddAccountSchema(
          [void Function(AddAccountSchemaBuilder)? updates]) =>
      (AddAccountSchemaBuilder()..update(updates))._build();

  _$AddAccountSchema._(
      {required this.username, required this.password, required this.email})
      : super._();
  @override
  AddAccountSchema rebuild(void Function(AddAccountSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddAccountSchemaBuilder toBuilder() =>
      AddAccountSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddAccountSchema &&
        username == other.username &&
        password == other.password &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddAccountSchema')
          ..add('username', username)
          ..add('password', password)
          ..add('email', email))
        .toString();
  }
}

class AddAccountSchemaBuilder
    implements Builder<AddAccountSchema, AddAccountSchemaBuilder> {
  _$AddAccountSchema? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  AddAccountSchemaBuilder() {
    AddAccountSchema._defaults(this);
  }

  AddAccountSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddAccountSchema other) {
    _$v = other as _$AddAccountSchema;
  }

  @override
  void update(void Function(AddAccountSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddAccountSchema build() => _build();

  _$AddAccountSchema _build() {
    final _$result = _$v ??
        _$AddAccountSchema._(
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'AddAccountSchema', 'username'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'AddAccountSchema', 'password'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'AddAccountSchema', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
