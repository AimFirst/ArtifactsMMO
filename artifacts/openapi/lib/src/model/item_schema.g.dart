// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemSchema extends ItemSchema {
  @override
  final String name;
  @override
  final String code;
  @override
  final int level;
  @override
  final String type;
  @override
  final String subtype;
  @override
  final String description;
  @override
  final bool tradeable;
  @override
  final BuiltList<SimpleEffectSchema>? effects;
  @override
  final CraftSchema? craft;

  factory _$ItemSchema([void Function(ItemSchemaBuilder)? updates]) =>
      (new ItemSchemaBuilder()..update(updates))._build();

  _$ItemSchema._(
      {required this.name,
      required this.code,
      required this.level,
      required this.type,
      required this.subtype,
      required this.description,
      required this.tradeable,
      this.effects,
      this.craft})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ItemSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(code, r'ItemSchema', 'code');
    BuiltValueNullFieldError.checkNotNull(level, r'ItemSchema', 'level');
    BuiltValueNullFieldError.checkNotNull(type, r'ItemSchema', 'type');
    BuiltValueNullFieldError.checkNotNull(subtype, r'ItemSchema', 'subtype');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ItemSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(
        tradeable, r'ItemSchema', 'tradeable');
  }

  @override
  ItemSchema rebuild(void Function(ItemSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemSchemaBuilder toBuilder() => new ItemSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemSchema &&
        name == other.name &&
        code == other.code &&
        level == other.level &&
        type == other.type &&
        subtype == other.subtype &&
        description == other.description &&
        tradeable == other.tradeable &&
        effects == other.effects &&
        craft == other.craft;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, subtype.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, tradeable.hashCode);
    _$hash = $jc(_$hash, effects.hashCode);
    _$hash = $jc(_$hash, craft.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ItemSchema')
          ..add('name', name)
          ..add('code', code)
          ..add('level', level)
          ..add('type', type)
          ..add('subtype', subtype)
          ..add('description', description)
          ..add('tradeable', tradeable)
          ..add('effects', effects)
          ..add('craft', craft))
        .toString();
  }
}

class ItemSchemaBuilder implements Builder<ItemSchema, ItemSchemaBuilder> {
  _$ItemSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _subtype;
  String? get subtype => _$this._subtype;
  set subtype(String? subtype) => _$this._subtype = subtype;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _tradeable;
  bool? get tradeable => _$this._tradeable;
  set tradeable(bool? tradeable) => _$this._tradeable = tradeable;

  ListBuilder<SimpleEffectSchema>? _effects;
  ListBuilder<SimpleEffectSchema> get effects =>
      _$this._effects ??= new ListBuilder<SimpleEffectSchema>();
  set effects(ListBuilder<SimpleEffectSchema>? effects) =>
      _$this._effects = effects;

  CraftSchemaBuilder? _craft;
  CraftSchemaBuilder get craft => _$this._craft ??= new CraftSchemaBuilder();
  set craft(CraftSchemaBuilder? craft) => _$this._craft = craft;

  ItemSchemaBuilder() {
    ItemSchema._defaults(this);
  }

  ItemSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _level = $v.level;
      _type = $v.type;
      _subtype = $v.subtype;
      _description = $v.description;
      _tradeable = $v.tradeable;
      _effects = $v.effects?.toBuilder();
      _craft = $v.craft?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemSchema;
  }

  @override
  void update(void Function(ItemSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemSchema build() => _build();

  _$ItemSchema _build() {
    _$ItemSchema _$result;
    try {
      _$result = _$v ??
          new _$ItemSchema._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ItemSchema', 'name'),
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'ItemSchema', 'code'),
              level: BuiltValueNullFieldError.checkNotNull(
                  level, r'ItemSchema', 'level'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'ItemSchema', 'type'),
              subtype: BuiltValueNullFieldError.checkNotNull(
                  subtype, r'ItemSchema', 'subtype'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ItemSchema', 'description'),
              tradeable: BuiltValueNullFieldError.checkNotNull(
                  tradeable, r'ItemSchema', 'tradeable'),
              effects: _effects?.build(),
              craft: _craft?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'effects';
        _effects?.build();
        _$failedField = 'craft';
        _craft?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ItemSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
