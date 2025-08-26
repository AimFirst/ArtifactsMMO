// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_skin_character_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeSkinCharacterSchema extends ChangeSkinCharacterSchema {
  @override
  final CharacterSkin skin;

  factory _$ChangeSkinCharacterSchema(
          [void Function(ChangeSkinCharacterSchemaBuilder)? updates]) =>
      (ChangeSkinCharacterSchemaBuilder()..update(updates))._build();

  _$ChangeSkinCharacterSchema._({required this.skin}) : super._();
  @override
  ChangeSkinCharacterSchema rebuild(
          void Function(ChangeSkinCharacterSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeSkinCharacterSchemaBuilder toBuilder() =>
      ChangeSkinCharacterSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeSkinCharacterSchema && skin == other.skin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeSkinCharacterSchema')
          ..add('skin', skin))
        .toString();
  }
}

class ChangeSkinCharacterSchemaBuilder
    implements
        Builder<ChangeSkinCharacterSchema, ChangeSkinCharacterSchemaBuilder> {
  _$ChangeSkinCharacterSchema? _$v;

  CharacterSkin? _skin;
  CharacterSkin? get skin => _$this._skin;
  set skin(CharacterSkin? skin) => _$this._skin = skin;

  ChangeSkinCharacterSchemaBuilder() {
    ChangeSkinCharacterSchema._defaults(this);
  }

  ChangeSkinCharacterSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skin = $v.skin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeSkinCharacterSchema other) {
    _$v = other as _$ChangeSkinCharacterSchema;
  }

  @override
  void update(void Function(ChangeSkinCharacterSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeSkinCharacterSchema build() => _build();

  _$ChangeSkinCharacterSchema _build() {
    final _$result = _$v ??
        _$ChangeSkinCharacterSchema._(
          skin: BuiltValueNullFieldError.checkNotNull(
              skin, r'ChangeSkinCharacterSchema', 'skin'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
