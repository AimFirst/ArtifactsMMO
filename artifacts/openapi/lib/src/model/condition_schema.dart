//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/condition_operator.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'condition_schema.g.dart';

/// ConditionSchema
///
/// Properties:
/// * [code] - Condition code.
/// * [operator_] - Condition operator.
/// * [value] - Condition value.
@BuiltValue()
abstract class ConditionSchema
    implements Built<ConditionSchema, ConditionSchemaBuilder> {
  /// Condition code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Condition operator.
  @BuiltValueField(wireName: r'operator')
  ConditionOperator get operator_;
  // enum operator_Enum {  eq,  ne,  gt,  lt,  };

  /// Condition value.
  @BuiltValueField(wireName: r'value')
  int get value;

  ConditionSchema._();

  factory ConditionSchema([void updates(ConditionSchemaBuilder b)]) =
      _$ConditionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConditionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConditionSchema> get serializer =>
      _$ConditionSchemaSerializer();
}

class _$ConditionSchemaSerializer
    implements PrimitiveSerializer<ConditionSchema> {
  @override
  final Iterable<Type> types = const [ConditionSchema, _$ConditionSchema];

  @override
  final String wireName = r'ConditionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConditionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'operator';
    yield serializers.serialize(
      object.operator_,
      specifiedType: const FullType(ConditionOperator),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConditionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConditionSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'operator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConditionOperator),
          ) as ConditionOperator;
          result.operator_ = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConditionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConditionSchemaBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
