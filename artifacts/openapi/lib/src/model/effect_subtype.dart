//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'effect_subtype.g.dart';

class EffectSubtype extends EnumClass {
  @BuiltValueEnumConst(wireName: r'stat')
  static const EffectSubtype stat = _$stat;
  @BuiltValueEnumConst(wireName: r'other')
  static const EffectSubtype other = _$other;
  @BuiltValueEnumConst(wireName: r'heal')
  static const EffectSubtype heal = _$heal;
  @BuiltValueEnumConst(wireName: r'buff')
  static const EffectSubtype buff = _$buff;
  @BuiltValueEnumConst(wireName: r'debuff')
  static const EffectSubtype debuff = _$debuff;
  @BuiltValueEnumConst(wireName: r'special')
  static const EffectSubtype special = _$special;
  @BuiltValueEnumConst(wireName: r'gathering')
  static const EffectSubtype gathering = _$gathering;
  @BuiltValueEnumConst(wireName: r'teleport')
  static const EffectSubtype teleport = _$teleport;
  @BuiltValueEnumConst(wireName: r'gold')
  static const EffectSubtype gold = _$gold;

  static Serializer<EffectSubtype> get serializer => _$effectSubtypeSerializer;

  const EffectSubtype._(String name) : super(name);

  static BuiltSet<EffectSubtype> get values => _$values;
  static EffectSubtype valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class EffectSubtypeMixin = Object with _$EffectSubtypeMixin;
