// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_fight_response_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterFightResponseSchema extends CharacterFightResponseSchema {
  @override
  final CharacterFightDataSchema data;

  factory _$CharacterFightResponseSchema(
          [void Function(CharacterFightResponseSchemaBuilder)? updates]) =>
      (new CharacterFightResponseSchemaBuilder()..update(updates))._build();

  _$CharacterFightResponseSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CharacterFightResponseSchema', 'data');
  }

  @override
  CharacterFightResponseSchema rebuild(
          void Function(CharacterFightResponseSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterFightResponseSchemaBuilder toBuilder() =>
      new CharacterFightResponseSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterFightResponseSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'CharacterFightResponseSchema')
          ..add('data', data))
        .toString();
  }
}

class CharacterFightResponseSchemaBuilder
    implements
        Builder<CharacterFightResponseSchema,
            CharacterFightResponseSchemaBuilder> {
  _$CharacterFightResponseSchema? _$v;

  CharacterFightDataSchemaBuilder? _data;
  CharacterFightDataSchemaBuilder get data =>
      _$this._data ??= new CharacterFightDataSchemaBuilder();
  set data(CharacterFightDataSchemaBuilder? data) => _$this._data = data;

  CharacterFightResponseSchemaBuilder() {
    CharacterFightResponseSchema._defaults(this);
  }

  CharacterFightResponseSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterFightResponseSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterFightResponseSchema;
  }

  @override
  void update(void Function(CharacterFightResponseSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterFightResponseSchema build() => _build();

  _$CharacterFightResponseSchema _build() {
    _$CharacterFightResponseSchema _$result;
    try {
      _$result =
          _$v ?? new _$CharacterFightResponseSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterFightResponseSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
