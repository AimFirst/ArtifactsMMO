//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_slot.g.dart';

class ItemSlot extends EnumClass {
  @BuiltValueEnumConst(wireName: r'weapon')
  static const ItemSlot weapon = _$weapon;
  @BuiltValueEnumConst(wireName: r'shield')
  static const ItemSlot shield = _$shield;
  @BuiltValueEnumConst(wireName: r'helmet')
  static const ItemSlot helmet = _$helmet;
  @BuiltValueEnumConst(wireName: r'body_armor')
  static const ItemSlot bodyArmor = _$bodyArmor;
  @BuiltValueEnumConst(wireName: r'leg_armor')
  static const ItemSlot legArmor = _$legArmor;
  @BuiltValueEnumConst(wireName: r'boots')
  static const ItemSlot boots = _$boots;
  @BuiltValueEnumConst(wireName: r'ring1')
  static const ItemSlot ring1 = _$ring1;
  @BuiltValueEnumConst(wireName: r'ring2')
  static const ItemSlot ring2 = _$ring2;
  @BuiltValueEnumConst(wireName: r'amulet')
  static const ItemSlot amulet = _$amulet;
  @BuiltValueEnumConst(wireName: r'artifact1')
  static const ItemSlot artifact1 = _$artifact1;
  @BuiltValueEnumConst(wireName: r'artifact2')
  static const ItemSlot artifact2 = _$artifact2;
  @BuiltValueEnumConst(wireName: r'artifact3')
  static const ItemSlot artifact3 = _$artifact3;
  @BuiltValueEnumConst(wireName: r'utility1')
  static const ItemSlot utility1 = _$utility1;
  @BuiltValueEnumConst(wireName: r'utility2')
  static const ItemSlot utility2 = _$utility2;
  @BuiltValueEnumConst(wireName: r'bag')
  static const ItemSlot bag = _$bag;
  @BuiltValueEnumConst(wireName: r'rune')
  static const ItemSlot rune = _$rune;

  static Serializer<ItemSlot> get serializer => _$itemSlotSerializer;

  const ItemSlot._(String name) : super(name);

  static BuiltSet<ItemSlot> get values => _$values;
  static ItemSlot valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ItemSlotMixin = Object with _$ItemSlotMixin;
