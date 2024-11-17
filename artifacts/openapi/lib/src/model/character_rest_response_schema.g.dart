// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_rest_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterRestResponseSchema extends CharacterRestResponseSchema {
  @override
  final CharacterRestDataSchema data;

  factory _$CharacterRestResponseSchema(
          [void Function(CharacterRestResponseSchemaBuilder)? updates]) =>
      (new CharacterRestResponseSchemaBuilder()..update(updates))._build();

  _$CharacterRestResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CharacterRestResponseSchema', 'data');
  }

  @override
  CharacterRestResponseSchema rebuild(
          void Function(CharacterRestResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterRestResponseSchemaBuilder toBuilder() =>
      new CharacterRestResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterRestResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'CharacterRestResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class CharacterRestResponseSchemaBuilder
    implements
        Builder<CharacterRestResponseSchema,
            CharacterRestResponseSchemaBuilder> {
  _$CharacterRestResponseSchema? _$v;

  CharacterRestDataSchemaBuilder? _data;
  CharacterRestDataSchemaBuilder get data =>
      _$this._data ??= new CharacterRestDataSchemaBuilder();
  set data(CharacterRestDataSchemaBuilder? data) => _$this._data = data;

  CharacterRestResponseSchemaBuilder() {
    CharacterRestResponseSchema._defaults(this);
  }

  CharacterRestResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterRestResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterRestResponseSchema;
  }

  @override
  void update(void Function(CharacterRestResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterRestResponseSchema build() => _build();

  _$CharacterRestResponseSchema _build() {
    _$CharacterRestResponseSchema _$result;
    try {
      _$result = _$v ?? new _$CharacterRestResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterRestResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
