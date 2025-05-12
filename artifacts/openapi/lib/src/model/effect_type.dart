//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'effect_type.g.dart';

class EffectType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'equipment')
  static const EffectType equipment = _$equipment;
  @BuiltValueEnumConst(wireName: r'consumable')
  static const EffectType consumable = _$consumable;
  @BuiltValueEnumConst(wireName: r'combat')
  static const EffectType combat = _$combat;

  static Serializer<EffectType> get serializer => _$effectTypeSerializer;

  const EffectType._(String name) : super(name);

  static BuiltSet<EffectType> get values => _$values;
  static EffectType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class EffectTypeMixin = Object with _$EffectTypeMixin;
