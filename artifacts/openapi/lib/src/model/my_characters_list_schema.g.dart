// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_characters_list_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyCharactersListSchema extends MyCharactersListSchema {
  @override
  final BuiltList<CharacterSchema> data;

  factory _$MyCharactersListSchema(
          [void Function(MyCharactersListSchemaBuilder)? updates]) =>
      (new MyCharactersListSchemaBuilder()..update(updates))._build();

  _$MyCharactersListSchema._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'MyCharactersListSchema', 'data');
  }

  @override
  MyCharactersListSchema rebuild(
          void Function(MyCharactersListSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyCharactersListSchemaBuilder toBuilder() =>
      new MyCharactersListSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyCharactersListSchema && data == other.data;
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
    return (newBuiltValueToStringHelper(r'MyCharactersListSchema')
          ..add('data', data))
        .toString();
  }
}

class MyCharactersListSchemaBuilder
    implements Builder<MyCharactersListSchema, MyCharactersListSchemaBuilder> {
  _$MyCharactersListSchema? _$v;

  ListBuilder<CharacterSchema>? _data;
  ListBuilder<CharacterSchema> get data =>
      _$this._data ??= new ListBuilder<CharacterSchema>();
  set data(ListBuilder<CharacterSchema>? data) => _$this._data = data;

  MyCharactersListSchemaBuilder() {
    MyCharactersListSchema._defaults(this);
  }

  MyCharactersListSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyCharactersListSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyCharactersListSchema;
  }

  @override
  void update(void Function(MyCharactersListSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyCharactersListSchema build() => _build();

  _$MyCharactersListSchema _build() {
    _$MyCharactersListSchema _$result;
    try {
      _$result = _$v ?? new _$MyCharactersListSchema._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyCharactersListSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
