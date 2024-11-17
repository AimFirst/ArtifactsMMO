// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ActionType _$movement = const ActionType._('movement');
const ActionType _$fight = const ActionType._('fight');
const ActionType _$crafting = const ActionType._('crafting');
const ActionType _$gathering = const ActionType._('gathering');
const ActionType _$buyGe = const ActionType._('buyGe');
const ActionType _$sellGe = const ActionType._('sellGe');
const ActionType _$cancelGe = const ActionType._('cancelGe');
const ActionType _$deleteItem = const ActionType._('deleteItem');
const ActionType _$deposit = const ActionType._('deposit');
const ActionType _$withdraw = const ActionType._('withdraw');
const ActionType _$depositGold = const ActionType._('depositGold');
const ActionType _$withdrawGold = const ActionType._('withdrawGold');
const ActionType _$equip = const ActionType._('equip');
const ActionType _$unequip = const ActionType._('unequip');
const ActionType _$task = const ActionType._('task');
const ActionType _$recycling = const ActionType._('recycling');
const ActionType _$rest = const ActionType._('rest');
const ActionType _$use = const ActionType._('use');
const ActionType _$buyBankExpansion = const ActionType._('buyBankExpansion');

ActionType _$valueOf(String name) {
  switch (name) {
    case 'movement':
      return _$movement;
    case 'fight':
      return _$fight;
    case 'crafting':
      return _$crafting;
    case 'gathering':
      return _$gathering;
    case 'buyGe':
      return _$buyGe;
    case 'sellGe':
      return _$sellGe;
    case 'cancelGe':
      return _$cancelGe;
    case 'deleteItem':
      return _$deleteItem;
    case 'deposit':
      return _$deposit;
    case 'withdraw':
      return _$withdraw;
    case 'depositGold':
      return _$depositGold;
    case 'withdrawGold':
      return _$withdrawGold;
    case 'equip':
      return _$equip;
    case 'unequip':
      return _$unequip;
    case 'task':
      return _$task;
    case 'recycling':
      return _$recycling;
    case 'rest':
      return _$rest;
    case 'use':
      return _$use;
    case 'buyBankExpansion':
      return _$buyBankExpansion;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ActionType> _$values =
    new BuiltSet<ActionType>(const <ActionType>[
  _$movement,
  _$fight,
  _$crafting,
  _$gathering,
  _$buyGe,
  _$sellGe,
  _$cancelGe,
  _$deleteItem,
  _$deposit,
  _$withdraw,
  _$depositGold,
  _$withdrawGold,
  _$equip,
  _$unequip,
  _$task,
  _$recycling,
  _$rest,
  _$use,
  _$buyBankExpansion,
]);

class _$ActionTypeMeta {
  const _$ActionTypeMeta();
  ActionType get movement => _$movement;
  ActionType get fight => _$fight;
  ActionType get crafting => _$crafting;
  ActionType get gathering => _$gathering;
  ActionType get buyGe => _$buyGe;
  ActionType get sellGe => _$sellGe;
  ActionType get cancelGe => _$cancelGe;
  ActionType get deleteItem => _$deleteItem;
  ActionType get deposit => _$deposit;
  ActionType get withdraw => _$withdraw;
  ActionType get depositGold => _$depositGold;
  ActionType get withdrawGold => _$withdrawGold;
  ActionType get equip => _$equip;
  ActionType get unequip => _$unequip;
  ActionType get task => _$task;
  ActionType get recycling => _$recycling;
  ActionType get rest => _$rest;
  ActionType get use => _$use;
  ActionType get buyBankExpansion => _$buyBankExpansion;
  ActionType valueOf(String name) => _$valueOf(name);
  BuiltSet<ActionType> get values => _$values;
}

abstract class _$ActionTypeMixin {
  // ignore: non_constant_identifier_names
  _$ActionTypeMeta get ActionType => const _$ActionTypeMeta();
}

Serializer<ActionType> _$actionTypeSerializer = new _$ActionTypeSerializer();

class _$ActionTypeSerializer implements PrimitiveSerializer<ActionType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'movement': 'movement',
    'fight': 'fight',
    'crafting': 'crafting',
    'gathering': 'gathering',
    'buyGe': 'buy_ge',
    'sellGe': 'sell_ge',
    'cancelGe': 'cancel_ge',
    'deleteItem': 'delete_item',
    'deposit': 'deposit',
    'withdraw': 'withdraw',
    'depositGold': 'deposit_gold',
    'withdrawGold': 'withdraw_gold',
    'equip': 'equip',
    'unequip': 'unequip',
    'task': 'task',
    'recycling': 'recycling',
    'rest': 'rest',
    'use': 'use',
    'buyBankExpansion': 'buy_bank_expansion',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'movement': 'movement',
    'fight': 'fight',
    'crafting': 'crafting',
    'gathering': 'gathering',
    'buy_ge': 'buyGe',
    'sell_ge': 'sellGe',
    'cancel_ge': 'cancelGe',
    'delete_item': 'deleteItem',
    'deposit': 'deposit',
    'withdraw': 'withdraw',
    'deposit_gold': 'depositGold',
    'withdraw_gold': 'withdrawGold',
    'equip': 'equip',
    'unequip': 'unequip',
    'task': 'task',
    'recycling': 'recycling',
    'rest': 'rest',
    'use': 'use',
    'buy_bank_expansion': 'buyBankExpansion',
  };

  @override
  final Iterable<Type> types = const <Type>[ActionType];
  @override
  final String wireName = 'ActionType';

  @override
  Object serialize(Serializers serializers, ActionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ActionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ActionType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
