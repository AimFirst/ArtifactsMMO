//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'gathering_skill.g.dart';

class GatheringSkill extends EnumClass {
  @BuiltValueEnumConst(wireName: r'mining')
  static const GatheringSkill mining = _$mining;
  @BuiltValueEnumConst(wireName: r'woodcutting')
  static const GatheringSkill woodcutting = _$woodcutting;
  @BuiltValueEnumConst(wireName: r'fishing')
  static const GatheringSkill fishing = _$fishing;
  @BuiltValueEnumConst(wireName: r'alchemy')
  static const GatheringSkill alchemy = _$alchemy;

  static Serializer<GatheringSkill> get serializer =>
      _$gatheringSkillSerializer;

  const GatheringSkill._(String name) : super(name);

  static BuiltSet<GatheringSkill> get values => _$values;
  static GatheringSkill valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class GatheringSkillMixin = Object with _$GatheringSkillMixin;
