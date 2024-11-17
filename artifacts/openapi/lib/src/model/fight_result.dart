//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fight_result.g.dart';

class FightResult extends EnumClass {
  @BuiltValueEnumConst(wireName: r'win')
  static const FightResult win = _$win;
  @BuiltValueEnumConst(wireName: r'loss')
  static const FightResult loss = _$loss;

  static Serializer<FightResult> get serializer => _$fightResultSerializer;

  const FightResult._(String name) : super(name);

  static BuiltSet<FightResult> get values => _$values;
  static FightResult valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FightResultMixin = Object with _$FightResultMixin;
