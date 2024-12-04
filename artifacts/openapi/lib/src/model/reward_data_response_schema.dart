//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/reward_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reward_data_response_schema.g.dart';

/// RewardDataResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class RewardDataResponseSchema
    implements
        Built<RewardDataResponseSchema, RewardDataResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  RewardDataSchema get data;

  RewardDataResponseSchema._();

  factory RewardDataResponseSchema(
          [void updates(RewardDataResponseSchemaBuilder b)]) =
      _$RewardDataResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RewardDataResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RewardDataResponseSchema> get serializer =>
      _$RewardDataResponseSchemaSerializer();
}

class _$RewardDataResponseSchemaSerializer
    implements PrimitiveSerializer<RewardDataResponseSchema> {
  @override
  final Iterable<Type> types = const [
    RewardDataResponseSchema,
    _$RewardDataResponseSchema
  ];

  @override
  final String wireName = r'RewardDataResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RewardDataResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(RewardDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RewardDataResponseSchema object, {
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
    required RewardDataResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RewardDataSchema),
          ) as RewardDataSchema;
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
  RewardDataResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RewardDataResponseSchemaBuilder();
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
