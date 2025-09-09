// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EffectSchema extends EffectSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final String description;
  @override
  final EffectType type;
  @override
  final EffectSubtype subtype;

  factory _$EffectSchema([void Function(EffectSchemaBuilder)? updates]) =>
      (new EffectSchemaBuilder()..update(updates))._build();

  _$EffectSchema._(
      {required this.name,
      required this.code,
      required this.description,
      required this.type,
      required this.subtype})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'EffectSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'EffectSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(
        description, r'EffectSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(type, r'EffectSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(subtype, r'EffectSchema', 'subtype');
  }

  @override
  EffectSchema rebuild(void Function(EffectSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EffectSchemaBuilder toBuilder() => new EffectSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EffectSchema &&
        name == other.name &&
        code == other.code &&
        description == other.description &&
        type == other.type &&
        subtype == other.subtype;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, subtype.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EffectSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('description', description)
          ..add('type', type)
          ..add('subtype', subtype))
        .toString();
  }
}

class EffectSchemaBuilder
    implements Builder<EffectSchema, EffectSchemaBuilder> {
  _$EffectSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  EffectType? _type;
  EffectType? get type => _$this._type;
  set type(EffectType? type) => _$this._type = type;

  EffectSubtype? _subtype;
  EffectSubtype? get subtype => _$this._subtype;
  set subtype(EffectSubtype? subtype) => _$this._subtype = subtype;

  EffectSchemaBuilder() {
    EffectSchema._defaults(this);
  }

  EffectSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _description = $v.description;
      _type = $v.type;
      _subtype = $v.subtype;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EffectSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EffectSchema;
  }

  @override
  void update(void Function(EffectSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EffectSchema build() => _build();

  _$EffectSchema _build() {
    final _$result = _$v ??
        new _$EffectSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'EffectSchema', 'name'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'EffectSchema', 'code'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'EffectSchema', 'description'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'EffectSchema', 'type'),
            subtype: BuiltValueNullFieldError.checkNotNull(
                subtype, r'EffectSchema', 'subtype'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
