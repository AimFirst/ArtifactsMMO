//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_type.g.dart';

class ItemType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'utility')
  static const ItemType utility = _$utility;
  @BuiltValueEnumConst(wireName: r'body_armor')
  static const ItemType bodyArmor = _$bodyArmor;
  @BuiltValueEnumConst(wireName: r'weapon')
  static const ItemType weapon = _$weapon;
  @BuiltValueEnumConst(wireName: r'resource')
  static const ItemType resource = _$resource;
  @BuiltValueEnumConst(wireName: r'leg_armor')
  static const ItemType legArmor = _$legArmor;
  @BuiltValueEnumConst(wireName: r'helmet')
  static const ItemType helmet = _$helmet;
  @BuiltValueEnumConst(wireName: r'boots')
  static const ItemType boots = _$boots;
  @BuiltValueEnumConst(wireName: r'shield')
  static const ItemType shield = _$shield;
  @BuiltValueEnumConst(wireName: r'amulet')
  static const ItemType amulet = _$amulet;
  @BuiltValueEnumConst(wireName: r'ring')
  static const ItemType ring = _$ring;
  @BuiltValueEnumConst(wireName: r'artifact')
  static const ItemType artifact = _$artifact;
  @BuiltValueEnumConst(wireName: r'currency')
  static const ItemType currency = _$currency;
  @BuiltValueEnumConst(wireName: r'consumable')
  static const ItemType consumable = _$consumable;

  static Serializer<ItemType> get serializer => _$itemTypeSerializer;

  const ItemType._(String name) : super(name);

  static BuiltSet<ItemType> get values => _$values;
  static ItemType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ItemTypeMixin = Object with _$ItemTypeMixin;
