// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LogType _$spawn = const LogType._('spawn');
const LogType _$movement = const LogType._('movement');
const LogType _$fight = const LogType._('fight');
const LogType _$crafting = const LogType._('crafting');
const LogType _$gathering = const LogType._('gathering');
const LogType _$buyGe = const LogType._('buyGe');
const LogType _$sellGe = const LogType._('sellGe');
const LogType _$cancelGe = const LogType._('cancelGe');
const LogType _$deleteItem = const LogType._('deleteItem');
const LogType _$deposit = const LogType._('deposit');
const LogType _$withdraw = const LogType._('withdraw');
const LogType _$depositGold = const LogType._('depositGold');
const LogType _$withdrawGold = const LogType._('withdrawGold');
const LogType _$equip = const LogType._('equip');
const LogType _$unequip = const LogType._('unequip');
const LogType _$newTask = const LogType._('newTask');
const LogType _$taskExchange = const LogType._('taskExchange');
const LogType _$taskCancelled = const LogType._('taskCancelled');
const LogType _$taskCompleted = const LogType._('taskCompleted');
const LogType _$taskTrade = const LogType._('taskTrade');
const LogType _$christmasExchange = const LogType._('christmasExchange');
const LogType _$recycling = const LogType._('recycling');
const LogType _$rest = const LogType._('rest');
const LogType _$use = const LogType._('use');
const LogType _$buyBankExpansion = const LogType._('buyBankExpansion');
const LogType _$achievement = const LogType._('achievement');

LogType _$valueOf(String name) {
  switch (name) {
    case 'spawn':
      return _$spawn;
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
    case 'newTask':
      return _$newTask;
    case 'taskExchange':
      return _$taskExchange;
    case 'taskCancelled':
      return _$taskCancelled;
    case 'taskCompleted':
      return _$taskCompleted;
    case 'taskTrade':
      return _$taskTrade;
    case 'christmasExchange':
      return _$christmasExchange;
    case 'recycling':
      return _$recycling;
    case 'rest':
      return _$rest;
    case 'use':
      return _$use;
    case 'buyBankExpansion':
      return _$buyBankExpansion;
    case 'achievement':
      return _$achievement;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LogType> _$values = new BuiltSet<LogType>(const <LogType>[
  _$spawn,
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
  _$newTask,
  _$taskExchange,
  _$taskCancelled,
  _$taskCompleted,
  _$taskTrade,
  _$christmasExchange,
  _$recycling,
  _$rest,
  _$use,
  _$buyBankExpansion,
  _$achievement,
]);

class _$LogTypeMeta {
  const _$LogTypeMeta();
  LogType get spawn => _$spawn;
  LogType get movement => _$movement;
  LogType get fight => _$fight;
  LogType get crafting => _$crafting;
  LogType get gathering => _$gathering;
  LogType get buyGe => _$buyGe;
  LogType get sellGe => _$sellGe;
  LogType get cancelGe => _$cancelGe;
  LogType get deleteItem => _$deleteItem;
  LogType get deposit => _$deposit;
  LogType get withdraw => _$withdraw;
  LogType get depositGold => _$depositGold;
  LogType get withdrawGold => _$withdrawGold;
  LogType get equip => _$equip;
  LogType get unequip => _$unequip;
  LogType get newTask => _$newTask;
  LogType get taskExchange => _$taskExchange;
  LogType get taskCancelled => _$taskCancelled;
  LogType get taskCompleted => _$taskCompleted;
  LogType get taskTrade => _$taskTrade;
  LogType get christmasExchange => _$christmasExchange;
  LogType get recycling => _$recycling;
  LogType get rest => _$rest;
  LogType get use => _$use;
  LogType get buyBankExpansion => _$buyBankExpansion;
  LogType get achievement => _$achievement;
  LogType valueOf(String name) => _$valueOf(name);
  BuiltSet<LogType> get values => _$values;
}

abstract class _$LogTypeMixin {
  // ignore: non_constant_identifier_names
  _$LogTypeMeta get LogType => const _$LogTypeMeta();
}

Serializer<LogType> _$logTypeSerializer = new _$LogTypeSerializer();

class _$LogTypeSerializer implements PrimitiveSerializer<LogType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'spawn': 'spawn',
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
    'newTask': 'new_task',
    'taskExchange': 'task_exchange',
    'taskCancelled': 'task_cancelled',
    'taskCompleted': 'task_completed',
    'taskTrade': 'task_trade',
    'christmasExchange': 'christmas_exchange',
    'recycling': 'recycling',
    'rest': 'rest',
    'use': 'use',
    'buyBankExpansion': 'buy_bank_expansion',
    'achievement': 'achievement',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'spawn': 'spawn',
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
    'new_task': 'newTask',
    'task_exchange': 'taskExchange',
    'task_cancelled': 'taskCancelled',
    'task_completed': 'taskCompleted',
    'task_trade': 'taskTrade',
    'christmas_exchange': 'christmasExchange',
    'recycling': 'recycling',
    'rest': 'rest',
    'use': 'use',
    'buy_bank_expansion': 'buyBankExpansion',
    'achievement': 'achievement',
  };

  @override
  final Iterable<Type> types = const <Type>[LogType];
  @override
  final String wireName = 'LogType';

  @override
  Object serialize(Serializers serializers, LogType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LogType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LogType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
