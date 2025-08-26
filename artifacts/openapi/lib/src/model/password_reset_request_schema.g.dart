// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_request_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetRequestSchema extends PasswordResetRequestSchema {
  @override
  final String email;

  factory _$PasswordResetRequestSchema(
          [void Function(PasswordResetRequestSchemaBuilder)? updates]) =>
      (PasswordResetRequestSchemaBuilder()..update(updates))._build();

  _$PasswordResetRequestSchema._({required this.email}) : super._();
  @override
  PasswordResetRequestSchema rebuild(
          void Function(PasswordResetRequestSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordResetRequestSchemaBuilder toBuilder() =>
      PasswordResetRequestSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetRequestSchema && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetRequestSchema')
          ..add('email', email))
        .toString();
  }
}

class PasswordResetRequestSchemaBuilder
    implements
        Builder<PasswordResetRequestSchema, PasswordResetRequestSchemaBuilder> {
  _$PasswordResetRequestSchema? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  PasswordResetRequestSchemaBuilder() {
    PasswordResetRequestSchema._defaults(this);
  }

  PasswordResetRequestSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetRequestSchema other) {
    _$v = other as _$PasswordResetRequestSchema;
  }

  @override
  void update(void Function(PasswordResetRequestSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetRequestSchema build() => _build();

  _$PasswordResetRequestSchema _build() {
    final _$result = _$v ??
        _$PasswordResetRequestSchema._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'PasswordResetRequestSchema', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
