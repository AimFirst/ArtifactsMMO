//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/skill_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill_response_schema.g.dart';

/// SkillResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class SkillResponseSchema
    implements Built<SkillResponseSchema, SkillResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  SkillDataSchema get data;

  SkillResponseSchema._();

  factory SkillResponseSchema([void updates(SkillResponseSchemaBuilder b)]) =
      _$SkillResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SkillResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SkillResponseSchema> get serializer =>
      _$SkillResponseSchemaSerializer();
}

class _$SkillResponseSchemaSerializer
    implements PrimitiveSerializer<SkillResponseSchema> {
  @override
  final Iterable<Type> types = const [
    SkillResponseSchema,
    _$SkillResponseSchema
  ];

  @override
  final String wireName = r'SkillResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SkillResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(SkillDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SkillResponseSchema object, {
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
    required SkillResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillDataSchema),
          ) as SkillDataSchema;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SkillResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SkillResponseSchemaBuilder();
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
