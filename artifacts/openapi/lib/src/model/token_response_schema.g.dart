// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenResponseSchema extends TokenResponseSchema {
  @override
  final String token;

  factory _$TokenResponseSchema(
          [void Function(TokenResponseSchemaBuilder)? updates]) =>
      (new TokenResponseSchemaBuilder()..update(updates))._build();

  _$TokenResponseSchema._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'TokenResponseSchema', 'token');
  }

  @override
  TokenResponseSchema rebuild(
          void Function(TokenResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenResponseSchemaBuilder toBuilder() =>
      new TokenResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenResponseSchema && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenResponseSchema')
          ..add('token', token))
        .toString();
  }
}

class TokenResponseSchemaBuilder
    implements Builder<TokenResponseSchema, TokenResponseSchemaBuilder> {
  _$TokenResponseSchema? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  TokenResponseSchemaBuilder() {
    TokenResponseSchema._defaults(this);
  }

  TokenResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenResponseSchema;
  }

  @override
  void update(void Function(TokenResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenResponseSchema build() => _build();

  _$TokenResponseSchema _build() {
    final _$result = _$v ??
        new _$TokenResponseSchema._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'TokenResponseSchema', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
