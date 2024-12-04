//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/drop_rate_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reward_response_schema.g.dart';

/// RewardResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class RewardResponseSchema
    implements Built<RewardResponseSchema, RewardResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  DropRateSchema get data;

  RewardResponseSchema._();

  factory RewardResponseSchema([void updates(RewardResponseSchemaBuilder b)]) =
      _$RewardResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RewardResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RewardResponseSchema> get serializer =>
      _$RewardResponseSchemaSerializer();
}

class _$RewardResponseSchemaSerializer
    implements PrimitiveSerializer<RewardResponseSchema> {
  @override
  final Iterable<Type> types = const [
    RewardResponseSchema,
    _$RewardResponseSchema
  ];

  @override
  final String wireName = r'RewardResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RewardResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(DropRateSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RewardResponseSchema object, {
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
    required RewardResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DropRateSchema),
          ) as DropRateSchema;
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
  RewardResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RewardResponseSchemaBuilder();
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
