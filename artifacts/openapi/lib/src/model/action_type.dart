//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'action_type.g.dart';

class ActionType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'movement')
  static const ActionType movement = _$movement;
  @BuiltValueEnumConst(wireName: r'fight')
  static const ActionType fight = _$fight;
  @BuiltValueEnumConst(wireName: r'crafting')
  static const ActionType crafting = _$crafting;
  @BuiltValueEnumConst(wireName: r'gathering')
  static const ActionType gathering = _$gathering;
  @BuiltValueEnumConst(wireName: r'buy_ge')
  static const ActionType buyGe = _$buyGe;
  @BuiltValueEnumConst(wireName: r'sell_ge')
  static const ActionType sellGe = _$sellGe;
  @BuiltValueEnumConst(wireName: r'buy_npc')
  static const ActionType buyNpc = _$buyNpc;
  @BuiltValueEnumConst(wireName: r'sell_npc')
  static const ActionType sellNpc = _$sellNpc;
  @BuiltValueEnumConst(wireName: r'cancel_ge')
  static const ActionType cancelGe = _$cancelGe;
  @BuiltValueEnumConst(wireName: r'delete_item')
  static const ActionType deleteItem = _$deleteItem;
  @BuiltValueEnumConst(wireName: r'deposit_item')
  static const ActionType depositItem = _$depositItem;
  @BuiltValueEnumConst(wireName: r'withdraw_item')
  static const ActionType withdrawItem = _$withdrawItem;
  @BuiltValueEnumConst(wireName: r'deposit_gold')
  static const ActionType depositGold = _$depositGold;
  @BuiltValueEnumConst(wireName: r'withdraw_gold')
  static const ActionType withdrawGold = _$withdrawGold;
  @BuiltValueEnumConst(wireName: r'equip')
  static const ActionType equip = _$equip;
  @BuiltValueEnumConst(wireName: r'unequip')
  static const ActionType unequip = _$unequip;
  @BuiltValueEnumConst(wireName: r'task')
  static const ActionType task = _$task;
  @BuiltValueEnumConst(wireName: r'christmas_exchange')
  static const ActionType christmasExchange = _$christmasExchange;
  @BuiltValueEnumConst(wireName: r'recycling')
  static const ActionType recycling = _$recycling;
  @BuiltValueEnumConst(wireName: r'rest')
  static const ActionType rest = _$rest;
  @BuiltValueEnumConst(wireName: r'use')
  static const ActionType use = _$use;
  @BuiltValueEnumConst(wireName: r'buy_bank_expansion')
  static const ActionType buyBankExpansion = _$buyBankExpansion;
  @BuiltValueEnumConst(wireName: r'give_item')
  static const ActionType giveItem = _$giveItem;
  @BuiltValueEnumConst(wireName: r'give_gold')
  static const ActionType giveGold = _$giveGold;
  @BuiltValueEnumConst(wireName: r'change_skin')
  static const ActionType changeSkin = _$changeSkin;
  @BuiltValueEnumConst(wireName: r'rename')
  static const ActionType rename = _$rename;

  static Serializer<ActionType> get serializer => _$actionTypeSerializer;

  const ActionType._(String name) : super(name);

  static BuiltSet<ActionType> get values => _$values;
  static ActionType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ActionTypeMixin = Object with _$ActionTypeMixin;
