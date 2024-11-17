// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_character_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteCharacterSchema extends DeleteCharacterSchema {
  @override
  final String name;

  factory _$DeleteCharacterSchema(
          [void Function(DeleteCharacterSchemaBuilder)? updates]) =>
      (new DeleteCharacterSchemaBuilder()..update(updates))._build();

  _$DeleteCharacterSchema._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'DeleteCharacterSchema', 'name');
  }

  @override
  DeleteCharacterSchema rebuild(
          void Function(DeleteCharacterSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteCharacterSchemaBuilder toBuilder() =>
      new DeleteCharacterSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteCharacterSchema && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteCharacterSchema')
          ..add('name', name))
        .toString();
  }
}

class DeleteCharacterSchemaBuilder
    implements Builder<DeleteCharacterSchema, DeleteCharacterSchemaBuilder> {
  _$DeleteCharacterSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DeleteCharacterSchemaBuilder() {
    DeleteCharacterSchema._defaults(this);
  }

  DeleteCharacterSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteCharacterSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteCharacterSchema;
  }

  @override
  void update(void Function(DeleteCharacterSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteCharacterSchema build() => _build();

  _$DeleteCharacterSchema _build() {
    final _$result = _$v ??
        new _$DeleteCharacterSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'DeleteCharacterSchema', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
