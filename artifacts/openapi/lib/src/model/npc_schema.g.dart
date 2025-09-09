// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NPCSchema extends NPCSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final String description;
  @override
  final NPCType type;

  factory _$NPCSchema([void Function(NPCSchemaBuilder)? updates]) =>
      (new NPCSchemaBuilder()..update(updates))._build();

  _$NPCSchema._(
      {required this.name,
      required this.code,
      required this.description,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'NPCSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'NPCSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        description, r'NPCSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(type, r'NPCSchema', 'type');
  }

  @override
  NPCSchema rebuild(void Function(NPCSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NPCSchemaBuilder toBuilder() => new NPCSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NPCSchema &&
        name == other.name &&
        code == other.code &&
        description == other.description &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NPCSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('description', description)
          ..add('type', type))
        .toString();
  }
}

class NPCSchemaBuilder implements Builder<NPCSchema, NPCSchemaBuilder> {
  _$NPCSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  NPCType? _type;
  NPCType? get type => _$this._type;
  set type(NPCType? type) => _$this._type = type;

  NPCSchemaBuilder() {
    NPCSchema._defaults(this);
  }

  NPCSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _description = $v.description;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NPCSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NPCSchema;
  }

  @override
  void update(void Function(NPCSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NPCSchema build() => _build();

  _$NPCSchema _build() {
    final _$result = _$v ??
        new _$NPCSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'NPCSchema', 'name'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'NPCSchema', 'code'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'NPCSchema', 'description'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'NPCSchema', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
