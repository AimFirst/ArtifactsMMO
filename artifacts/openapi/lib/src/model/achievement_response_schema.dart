//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/achievement_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'achievement_response_schema.g.dart';

/// AchievementResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class AchievementResponseSchema
    implements
        Built<AchievementResponseSchema, AchievementResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  AchievementSchema get data;

  AchievementResponseSchema._();

  factory AchievementResponseSchema(
          [void updates(AchievementResponseSchemaBuilder b)]) =
      _$AchievementResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AchievementResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AchievementResponseSchema> get serializer =>
      _$AchievementResponseSchemaSerializer();
}

class _$AchievementResponseSchemaSerializer
    implements PrimitiveSerializer<AchievementResponseSchema> {
  @override
  final Iterable<Type> types = const [
    AchievementResponseSchema,
    _$AchievementResponseSchema
  ];

  @override
  final String wireName = r'AchievementResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AchievementResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(AchievementSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AchievementResponseSchema object, {
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
    required AchievementResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AchievementSchema),
          ) as AchievementSchema;
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
  AchievementResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AchievementResponseSchemaBuilder();
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
