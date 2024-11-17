//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'achievement_type.g.dart';

class AchievementType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'combat_kill')
  static const AchievementType combatKill = _$combatKill;
  @BuiltValueEnumConst(wireName: r'combat_drop')
  static const AchievementType combatDrop = _$combatDrop;
  @BuiltValueEnumConst(wireName: r'combat_level')
  static const AchievementType combatLevel = _$combatLevel;
  @BuiltValueEnumConst(wireName: r'gathering')
  static const AchievementType gathering = _$gathering;
  @BuiltValueEnumConst(wireName: r'crafting')
  static const AchievementType crafting = _$crafting;
  @BuiltValueEnumConst(wireName: r'recycling')
  static const AchievementType recycling = _$recycling;
  @BuiltValueEnumConst(wireName: r'task')
  static const AchievementType task = _$task;
  @BuiltValueEnumConst(wireName: r'other')
  static const AchievementType other = _$other;

  static Serializer<AchievementType> get serializer =>
      _$achievementTypeSerializer;

  const AchievementType._(String name) : super(name);

  static BuiltSet<AchievementType> get values => _$values;
  static AchievementType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AchievementTypeMixin = Object with _$AchievementTypeMixin;
