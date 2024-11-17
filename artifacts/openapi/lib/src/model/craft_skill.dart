//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'craft_skill.g.dart';

class CraftSkill extends EnumClass {
  @BuiltValueEnumConst(wireName: r'weaponcrafting')
  static const CraftSkill weaponcrafting = _$weaponcrafting;
  @BuiltValueEnumConst(wireName: r'gearcrafting')
  static const CraftSkill gearcrafting = _$gearcrafting;
  @BuiltValueEnumConst(wireName: r'jewelrycrafting')
  static const CraftSkill jewelrycrafting = _$jewelrycrafting;
  @BuiltValueEnumConst(wireName: r'cooking')
  static const CraftSkill cooking = _$cooking;
  @BuiltValueEnumConst(wireName: r'woodcutting')
  static const CraftSkill woodcutting = _$woodcutting;
  @BuiltValueEnumConst(wireName: r'mining')
  static const CraftSkill mining = _$mining;
  @BuiltValueEnumConst(wireName: r'alchemy')
  static const CraftSkill alchemy = _$alchemy;

  static Serializer<CraftSkill> get serializer => _$craftSkillSerializer;

  const CraftSkill._(String name) : super(name);

  static BuiltSet<CraftSkill> get values => _$values;
  static CraftSkill valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CraftSkillMixin = Object with _$CraftSkillMixin;
