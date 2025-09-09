// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetResponseSchema extends PasswordResetResponseSchema {
  @override
  final String message;

  factory _$PasswordResetResponseSchema(
          [void Function(PasswordResetResponseSchemaBuilder)? updates]) =>
      (new PasswordResetResponseSchemaBuilder()..update(updates))._build();

  _$PasswordResetResponseSchema._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'PasswordResetResponseSchema', 'message');
  }

  @override
  PasswordResetResponseSchema rebuild(
          void Function(PasswordResetResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordResetResponseSchemaBuilder toBuilder() =>
      new PasswordResetResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetResponseSchema && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetResponseSchema')
          ..add('message', message))
        .toString();
  }
}

class PasswordResetResponseSchemaBuilder
    implements
        Builder<PasswordResetResponseSchema,
            PasswordResetResponseSchemaBuilder> {
  _$PasswordResetResponseSchema? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PasswordResetResponseSchemaBuilder() {
    PasswordResetResponseSchema._defaults(this);
  }

  PasswordResetResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasswordResetResponseSchema;
  }

  @override
  void update(void Function(PasswordResetResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetResponseSchema build() => _build();

  _$PasswordResetResponseSchema _build() {
    final _$result = _$v ??
        new _$PasswordResetResponseSchema._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'PasswordResetResponseSchema', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
