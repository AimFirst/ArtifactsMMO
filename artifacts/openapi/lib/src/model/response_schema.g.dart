// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResponseSchema extends ResponseSchema {
  @override
  final String message;

  factory _$ResponseSchema([void Function(ResponseSchemaBuilder)? updates]) =>
      (new ResponseSchemaBuilder()..update(updates))._build();

  _$ResponseSchema._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'ResponseSchema', 'message');
  }

  @override
  ResponseSchema rebuild(void Function(ResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseSchemaBuilder toBuilder() =>
      new ResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseSchema && message == other.message;
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
    return (newBuiltValueToStringHelper(r'ResponseSchema')
          ..add('message', message))
        .toString();
  }
}

class ResponseSchemaBuilder
    implements Builder<ResponseSchema, ResponseSchemaBuilder> {
  _$ResponseSchema? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ResponseSchemaBuilder() {
    ResponseSchema._defaults(this);
  }

  ResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseSchema;
  }

  @override
  void update(void Function(ResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseSchema build() => _build();

  _$ResponseSchema _build() {
    final _$result = _$v ??
        new _$ResponseSchema._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ResponseSchema', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
