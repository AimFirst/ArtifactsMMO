// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craft_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CraftSchema extends CraftSchema {
  @override
  final CraftSkill? skill;
  @override
  final int? level;
  @override
  final BuiltList<SimpleItemSchema>? items;
  @override
  final int? quantity;

  factory _$CraftSchema([void Function(CraftSchemaBuilder)? updates]) =>
      (new CraftSchemaBuilder()..update(updates))._build();

  _$CraftSchema._({this.skill, this.level, this.items, this.quantity})
      : super._();

  @override
  CraftSchema rebuild(void Function(CraftSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CraftSchemaBuilder toBuilder() => new CraftSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CraftSchema &&
        skill == other.skill &&
        level == other.level &&
        items == other.items &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skill.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CraftSchema')
          ..add('skill', skill)
          ..add('level', level)
          ..add('items', items)
          ..add('quantity', quantity))
        .toString();
  }
}

class CraftSchemaBuilder implements Builder<CraftSchema, CraftSchemaBuilder> {
  _$CraftSchema? _$v;

  CraftSkill? _skill;
  CraftSkill? get skill => _$this._skill;
  set skill(CraftSkill? skill) => _$this._skill = skill;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  ListBuilder<SimpleItemSchema>? _items;
  ListBuilder<SimpleItemSchema> get items =>
      _$this._items ??= new ListBuilder<SimpleItemSchema>();
  set items(ListBuilder<SimpleItemSchema>? items) => _$this._items = items;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  CraftSchemaBuilder() {
    CraftSchema._defaults(this);
  }

  CraftSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skill = $v.skill;
      _level = $v.level;
      _items = $v.items?.toBuilder();
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CraftSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CraftSchema;
  }

  @override
  void update(void Function(CraftSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CraftSchema build() => _build();

  _$CraftSchema _build() {
    _$CraftSchema _$result;
    try {
      _$result = _$v ??
          new _$CraftSchema._(
              skill: skill,
              level: level,
              items: _items?.build(),
              quantity: quantity);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CraftSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
