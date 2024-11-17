// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_slot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ItemSlot _$weapon = const ItemSlot._('weapon');
const ItemSlot _$shield = const ItemSlot._('shield');
const ItemSlot _$helmet = const ItemSlot._('helmet');
const ItemSlot _$bodyArmor = const ItemSlot._('bodyArmor');
const ItemSlot _$legArmor = const ItemSlot._('legArmor');
const ItemSlot _$boots = const ItemSlot._('boots');
const ItemSlot _$ring1 = const ItemSlot._('ring1');
const ItemSlot _$ring2 = const ItemSlot._('ring2');
const ItemSlot _$amulet = const ItemSlot._('amulet');
const ItemSlot _$artifact1 = const ItemSlot._('artifact1');
const ItemSlot _$artifact2 = const ItemSlot._('artifact2');
const ItemSlot _$artifact3 = const ItemSlot._('artifact3');
const ItemSlot _$utility1 = const ItemSlot._('utility1');
const ItemSlot _$utility2 = const ItemSlot._('utility2');

ItemSlot _$valueOf(String name) {
  switch (name) {
    case 'weapon':
      return _$weapon;
    case 'shield':
      return _$shield;
    case 'helmet':
      return _$helmet;
    case 'bodyArmor':
      return _$bodyArmor;
    case 'legArmor':
      return _$legArmor;
    case 'boots':
      return _$boots;
    case 'ring1':
      return _$ring1;
    case 'ring2':
      return _$ring2;
    case 'amulet':
      return _$amulet;
    case 'artifact1':
      return _$artifact1;
    case 'artifact2':
      return _$artifact2;
    case 'artifact3':
      return _$artifact3;
    case 'utility1':
      return _$utility1;
    case 'utility2':
      return _$utility2;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ItemSlot> _$values = new BuiltSet<ItemSlot>(const <ItemSlot>[
  _$weapon,
  _$shield,
  _$helmet,
  _$bodyArmor,
  _$legArmor,
  _$boots,
  _$ring1,
  _$ring2,
  _$amulet,
  _$artifact1,
  _$artifact2,
  _$artifact3,
  _$utility1,
  _$utility2,
]);

class _$ItemSlotMeta {
  const _$ItemSlotMeta();
  ItemSlot get weapon => _$weapon;
  ItemSlot get shield => _$shield;
  ItemSlot get helmet => _$helmet;
  ItemSlot get bodyArmor => _$bodyArmor;
  ItemSlot get legArmor => _$legArmor;
  ItemSlot get boots => _$boots;
  ItemSlot get ring1 => _$ring1;
  ItemSlot get ring2 => _$ring2;
  ItemSlot get amulet => _$amulet;
  ItemSlot get artifact1 => _$artifact1;
  ItemSlot get artifact2 => _$artifact2;
  ItemSlot get artifact3 => _$artifact3;
  ItemSlot get utility1 => _$utility1;
  ItemSlot get utility2 => _$utility2;
  ItemSlot valueOf(String name) => _$valueOf(name);
  BuiltSet<ItemSlot> get values => _$values;
}

abstract class _$ItemSlotMixin {
  // ignore: non_constant_identifier_names
  _$ItemSlotMeta get ItemSlot => const _$ItemSlotMeta();
}

Serializer<ItemSlot> _$itemSlotSerializer = new _$ItemSlotSerializer();

class _$ItemSlotSerializer implements PrimitiveSerializer<ItemSlot> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'weapon': 'weapon',
    'shield': 'shield',
    'helmet': 'helmet',
    'bodyArmor': 'body_armor',
    'legArmor': 'leg_armor',
    'boots': 'boots',
    'ring1': 'ring1',
    'ring2': 'ring2',
    'amulet': 'amulet',
    'artifact1': 'artifact1',
    'artifact2': 'artifact2',
    'artifact3': 'artifact3',
    'utility1': 'utility1',
    'utility2': 'utility2',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'weapon': 'weapon',
    'shield': 'shield',
    'helmet': 'helmet',
    'body_armor': 'bodyArmor',
    'leg_armor': 'legArmor',
    'boots': 'boots',
    'ring1': 'ring1',
    'ring2': 'ring2',
    'amulet': 'amulet',
    'artifact1': 'artifact1',
    'artifact2': 'artifact2',
    'artifact3': 'artifact3',
    'utility1': 'utility1',
    'utility2': 'utility2',
  };

  @override
  final Iterable<Type> types = const <Type>[ItemSlot];
  @override
  final String wireName = 'ItemSlot';

  @override
  Object serialize(Serializers serializers, ItemSlot object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ItemSlot deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ItemSlot.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
