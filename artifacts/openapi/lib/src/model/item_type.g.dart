// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ItemType _$utility = const ItemType._('utility');
const ItemType _$bodyArmor = const ItemType._('bodyArmor');
const ItemType _$weapon = const ItemType._('weapon');
const ItemType _$resource = const ItemType._('resource');
const ItemType _$legArmor = const ItemType._('legArmor');
const ItemType _$helmet = const ItemType._('helmet');
const ItemType _$boots = const ItemType._('boots');
const ItemType _$shield = const ItemType._('shield');
const ItemType _$amulet = const ItemType._('amulet');
const ItemType _$ring = const ItemType._('ring');
const ItemType _$artifact = const ItemType._('artifact');
const ItemType _$currency = const ItemType._('currency');
const ItemType _$consumable = const ItemType._('consumable');
const ItemType _$rune = const ItemType._('rune');
const ItemType _$bag = const ItemType._('bag');

ItemType _$valueOf(String name) {
  switch (name) {
    case 'utility':
      return _$utility;
    case 'bodyArmor':
      return _$bodyArmor;
    case 'weapon':
      return _$weapon;
    case 'resource':
      return _$resource;
    case 'legArmor':
      return _$legArmor;
    case 'helmet':
      return _$helmet;
    case 'boots':
      return _$boots;
    case 'shield':
      return _$shield;
    case 'amulet':
      return _$amulet;
    case 'ring':
      return _$ring;
    case 'artifact':
      return _$artifact;
    case 'currency':
      return _$currency;
    case 'consumable':
      return _$consumable;
    case 'rune':
      return _$rune;
    case 'bag':
      return _$bag;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ItemType> _$values = new BuiltSet<ItemType>(const <ItemType>[
  _$utility,
  _$bodyArmor,
  _$weapon,
  _$resource,
  _$legArmor,
  _$helmet,
  _$boots,
  _$shield,
  _$amulet,
  _$ring,
  _$artifact,
  _$currency,
  _$consumable,
  _$rune,
  _$bag,
]);

class _$ItemTypeMeta {
  const _$ItemTypeMeta();
  ItemType get utility => _$utility;
  ItemType get bodyArmor => _$bodyArmor;
  ItemType get weapon => _$weapon;
  ItemType get resource => _$resource;
  ItemType get legArmor => _$legArmor;
  ItemType get helmet => _$helmet;
  ItemType get boots => _$boots;
  ItemType get shield => _$shield;
  ItemType get amulet => _$amulet;
  ItemType get ring => _$ring;
  ItemType get artifact => _$artifact;
  ItemType get currency => _$currency;
  ItemType get consumable => _$consumable;
  ItemType get rune => _$rune;
  ItemType get bag => _$bag;
  ItemType valueOf(String name) => _$valueOf(name);
  BuiltSet<ItemType> get values => _$values;
}

abstract class _$ItemTypeMixin {
  // ignore: non_constant_identifier_names
  _$ItemTypeMeta get ItemType => const _$ItemTypeMeta();
}

Serializer<ItemType> _$itemTypeSerializer = new _$ItemTypeSerializer();

class _$ItemTypeSerializer implements PrimitiveSerializer<ItemType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'utility': 'utility',
    'bodyArmor': 'body_armor',
    'weapon': 'weapon',
    'resource': 'resource',
    'legArmor': 'leg_armor',
    'helmet': 'helmet',
    'boots': 'boots',
    'shield': 'shield',
    'amulet': 'amulet',
    'ring': 'ring',
    'artifact': 'artifact',
    'currency': 'currency',
    'consumable': 'consumable',
    'rune': 'rune',
    'bag': 'bag',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'utility': 'utility',
    'body_armor': 'bodyArmor',
    'weapon': 'weapon',
    'resource': 'resource',
    'leg_armor': 'legArmor',
    'helmet': 'helmet',
    'boots': 'boots',
    'shield': 'shield',
    'amulet': 'amulet',
    'ring': 'ring',
    'artifact': 'artifact',
    'currency': 'currency',
    'consumable': 'consumable',
    'rune': 'rune',
    'bag': 'bag',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemType];
  @override
  final String wireName = 'ItemType';

  @override
  Object serialize(Serializers serializers, ItemType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
