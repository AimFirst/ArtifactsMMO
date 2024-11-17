// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_effect_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ItemEffectSchema extends ItemEffectSchema {
  @override
  final String name;
  @override
  final int value;

  factory _$ItemEffectSchema(
          [void Function(ItemEffectSchemaBuilder)? updates]) =>
      (new ItemEffectSchemaBuilder()..update(updates))._build();

  _$ItemEffectSchema._({required this.name, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ItemEffectSchema', 'name');
    BuiltValueNullFieldError.checkNotNull(value, r'ItemEffectSchema', 'value');
  }

  @override
  ItemEffectSchema rebuild(void Function(ItemEffectSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemEffectSchemaBuilder toBuilder() =>
      new ItemEffectSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemEffectSchema &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ItemEffectSchema')
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class ItemEffectSchemaBuilder
    implements Builder<ItemEffectSchema, ItemEffectSchemaBuilder> {
  _$ItemEffectSchema? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  ItemEffectSchemaBuilder() {
    ItemEffectSchema._defaults(this);
  }

  ItemEffectSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemEffectSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemEffectSchema;
  }

  @override
  void update(void Function(ItemEffectSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ItemEffectSchema build() => _build();

  _$ItemEffectSchema _build() {
    final _$result = _$v ??
        new _$ItemEffectSchema._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ItemEffectSchema', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'ItemEffectSchema', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
