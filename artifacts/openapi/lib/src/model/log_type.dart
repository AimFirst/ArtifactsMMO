//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'log_type.g.dart';

class LogType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'spawn')
  static const LogType spawn = _$spawn;
  @BuiltValueEnumConst(wireName: r'movement')
  static const LogType movement = _$movement;
  @BuiltValueEnumConst(wireName: r'fight')
  static const LogType fight = _$fight;
  @BuiltValueEnumConst(wireName: r'crafting')
  static const LogType crafting = _$crafting;
  @BuiltValueEnumConst(wireName: r'gathering')
  static const LogType gathering = _$gathering;
  @BuiltValueEnumConst(wireName: r'buy_ge')
  static const LogType buyGe = _$buyGe;
  @BuiltValueEnumConst(wireName: r'sell_ge')
  static const LogType sellGe = _$sellGe;
  @BuiltValueEnumConst(wireName: r'buy_npc')
  static const LogType buyNpc = _$buyNpc;
  @BuiltValueEnumConst(wireName: r'sell_npc')
  static const LogType sellNpc = _$sellNpc;
  @BuiltValueEnumConst(wireName: r'cancel_ge')
  static const LogType cancelGe = _$cancelGe;
  @BuiltValueEnumConst(wireName: r'delete_item')
  static const LogType deleteItem = _$deleteItem;
  @BuiltValueEnumConst(wireName: r'deposit_item')
  static const LogType depositItem = _$depositItem;
  @BuiltValueEnumConst(wireName: r'withdraw_item')
  static const LogType withdrawItem = _$withdrawItem;
  @BuiltValueEnumConst(wireName: r'deposit_gold')
  static const LogType depositGold = _$depositGold;
  @BuiltValueEnumConst(wireName: r'withdraw_gold')
  static const LogType withdrawGold = _$withdrawGold;
  @BuiltValueEnumConst(wireName: r'equip')
  static const LogType equip = _$equip;
  @BuiltValueEnumConst(wireName: r'unequip')
  static const LogType unequip = _$unequip;
  @BuiltValueEnumConst(wireName: r'new_task')
  static const LogType newTask = _$newTask;
  @BuiltValueEnumConst(wireName: r'task_exchange')
  static const LogType taskExchange = _$taskExchange;
  @BuiltValueEnumConst(wireName: r'task_cancelled')
  static const LogType taskCancelled = _$taskCancelled;
  @BuiltValueEnumConst(wireName: r'task_completed')
  static const LogType taskCompleted = _$taskCompleted;
  @BuiltValueEnumConst(wireName: r'task_trade')
  static const LogType taskTrade = _$taskTrade;
  @BuiltValueEnumConst(wireName: r'christmas_exchange')
  static const LogType christmasExchange = _$christmasExchange;
  @BuiltValueEnumConst(wireName: r'recycling')
  static const LogType recycling = _$recycling;
  @BuiltValueEnumConst(wireName: r'rest')
  static const LogType rest = _$rest;
  @BuiltValueEnumConst(wireName: r'use')
  static const LogType use = _$use;
  @BuiltValueEnumConst(wireName: r'buy_bank_expansion')
  static const LogType buyBankExpansion = _$buyBankExpansion;
  @BuiltValueEnumConst(wireName: r'achievement')
  static const LogType achievement = _$achievement;
  @BuiltValueEnumConst(wireName: r'give_item')
  static const LogType giveItem = _$giveItem;
  @BuiltValueEnumConst(wireName: r'give_gold')
  static const LogType giveGold = _$giveGold;
  @BuiltValueEnumConst(wireName: r'receive_item')
  static const LogType receiveItem = _$receiveItem;
  @BuiltValueEnumConst(wireName: r'receive_gold')
  static const LogType receiveGold = _$receiveGold;
  @BuiltValueEnumConst(wireName: r'change_skin')
  static const LogType changeSkin = _$changeSkin;
  @BuiltValueEnumConst(wireName: r'rename')
  static const LogType rename = _$rename;

  static Serializer<LogType> get serializer => _$logTypeSerializer;

  const LogType._(String name) : super(name);

  static BuiltSet<LogType> get values => _$values;
  static LogType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class LogTypeMixin = Object with _$LogTypeMixin;
