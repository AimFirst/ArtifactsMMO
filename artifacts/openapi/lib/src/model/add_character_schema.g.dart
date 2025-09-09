// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_character_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddCharacterSchema extends AddCharacterSchema {
  @override
  final String name;
  @override
  final CharacterSkin skin;

  factory _$AddCharacterSchema(
          [void Function(AddCharacterSchemaBuilder)? updates]) =>
      (new AddCharacterSchemaBuilder()..update(updates))._build();

  _$AddCharacterSchema._({required this.name, required this.skin}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'AddCharacterSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(skin, r'AddCharacterSchema', 'skin');
  }

  @override
  AddCharacterSchema rebuild(
          void Function(AddCharacterSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddCharacterSchemaBuilder toBuilder() =>
      new AddCharacterSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddCharacterSchema &&
        name == other.name &&
        skin == other.skin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, skin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddCharacterSchema')
          ..add('name', name)
          ..add('skin', skin))
        .toString();
  }
}

class AddCharacterSchemaBuilder
    implements Builder<AddCharacterSchema, AddCharacterSchemaBuilder> {
  _$AddCharacterSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CharacterSkin? _skin;
  CharacterSkin? get skin => _$this._skin;
  set skin(CharacterSkin? skin) => _$this._skin = skin;

  AddCharacterSchemaBuilder() {
    AddCharacterSchema._defaults(this);
  }

  AddCharacterSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _skin = $v.skin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddCharacterSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddCharacterSchema;
  }

  @override
  void update(void Function(AddCharacterSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddCharacterSchema build() => _build();

  _$AddCharacterSchema _build() {
    final _$result = _$v ??
        new _$AddCharacterSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'AddCharacterSchema', 'name'),
            skin: BuiltValueNullFieldError.checkNotNull(
                skin, r'AddCharacterSchema', 'skin'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
