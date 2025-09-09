// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterResponseSchema extends CharacterResponseSchema {
  @override
  final CharacterSchema data;

  factory _$CharacterResponseSchema(
          [void Function(CharacterResponseSchemaBuilder)? updates]) =>
      (new CharacterResponseSchemaBuilder()..update(updates))._build();

  _$CharacterResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CharacterResponseSchema', 'data');
  }

  @override
  CharacterResponseSchema rebuild(
          void Function(CharacterResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterResponseSchemaBuilder toBuilder() =>
      new CharacterResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterResponseSchema && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class CharacterResponseSchemaBuilder
    implements
        Builder<CharacterResponseSchema, CharacterResponseSchemaBuilder> {
  _$CharacterResponseSchema? _$v;

  CharacterSchemaBuilder? _data;
  CharacterSchemaBuilder get data =>
      _$this._data ??= new CharacterSchemaBuilder();
  set data(CharacterSchemaBuilder? data) => _$this._data = data;

  CharacterResponseSchemaBuilder() {
    CharacterResponseSchema._defaults(this);
  }

  CharacterResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterResponseSchema;
  }

  @override
  void update(void Function(CharacterResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterResponseSchema build() => _build();

  _$CharacterResponseSchema _build() {
    _$CharacterResponseSchema _$result;
    try {
      _$result = _$v ?? new _$CharacterResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
