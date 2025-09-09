// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharactersListSchema extends CharactersListSchema {
  @override
  final BuiltList<CharacterSchema> data;

  factory _$CharactersListSchema(
          [void Function(CharactersListSchemaBuilder)? updates]) =>
      (new CharactersListSchemaBuilder()..update(updates))._build();

  _$CharactersListSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'CharactersListSchema', 'data');
  }

  @override
  CharactersListSchema rebuild(
          void Function(CharactersListSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharactersListSchemaBuilder toBuilder() =>
      new CharactersListSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharactersListSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'CharactersListSchema')
          ..add('data', data))
        .toString();
  }
}

class CharactersListSchemaBuilder
    implements Builder<CharactersListSchema, CharactersListSchemaBuilder> {
  _$CharactersListSchema? _$v;

  ListBuilder<CharacterSchema>? _data;
  ListBuilder<CharacterSchema> get data =>
      _$this._data ??= new ListBuilder<CharacterSchema>();
  set data(ListBuilder<CharacterSchema>? data) => _$this._data = data;

  CharactersListSchemaBuilder() {
    CharactersListSchema._defaults(this);
  }

  CharactersListSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharactersListSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharactersListSchema;
  }

  @override
  void update(void Function(CharactersListSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharactersListSchema build() => _build();

  _$CharactersListSchema _build() {
    _$CharactersListSchema _$result;
    try {
      _$result = _$v ?? new _$CharactersListSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharactersListSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
