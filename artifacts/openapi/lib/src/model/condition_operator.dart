//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'condition_operator.g.dart';

class ConditionOperator extends EnumClass {
  @BuiltValueEnumConst(wireName: r'eq')
  static const ConditionOperator eq = _$eq;
  @BuiltValueEnumConst(wireName: r'ne')
  static const ConditionOperator ne = _$ne;
  @BuiltValueEnumConst(wireName: r'gt')
  static const ConditionOperator gt = _$gt;
  @BuiltValueEnumConst(wireName: r'lt')
  static const ConditionOperator lt = _$lt;

  static Serializer<ConditionOperator> get serializer =>
      _$conditionOperatorSerializer;

  const ConditionOperator._(String name) : super(name);

  static BuiltSet<ConditionOperator> get values => _$values;
  static ConditionOperator valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ConditionOperatorMixin = Object with _$ConditionOperatorMixin;
