//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill.g.dart';

class Skill extends EnumClass {
  @BuiltValueEnumConst(wireName: r'weaponcrafting')
  static const Skill weaponcrafting = _$weaponcrafting;
  @BuiltValueEnumConst(wireName: r'gearcrafting')
  static const Skill gearcrafting = _$gearcrafting;
  @BuiltValueEnumConst(wireName: r'jewelrycrafting')
  static const Skill jewelrycrafting = _$jewelrycrafting;
  @BuiltValueEnumConst(wireName: r'cooking')
  static const Skill cooking = _$cooking;
  @BuiltValueEnumConst(wireName: r'woodcutting')
  static const Skill woodcutting = _$woodcutting;
  @BuiltValueEnumConst(wireName: r'mining')
  static const Skill mining = _$mining;
  @BuiltValueEnumConst(wireName: r'alchemy')
  static const Skill alchemy = _$alchemy;
  @BuiltValueEnumConst(wireName: r'fishing')
  static const Skill fishing = _$fishing;

  static Serializer<Skill> get serializer => _$skillSerializer;

  const Skill._(String name) : super(name);

  static BuiltSet<Skill> get values => _$values;
  static Skill valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SkillMixin = Object with _$SkillMixin;
