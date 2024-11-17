//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/drop_rate_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tasks_reward_response_schema.g.dart';

/// TasksRewardResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class TasksRewardResponseSchema
    implements
        Built<TasksRewardResponseSchema, TasksRewardResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  DropRateSchema get data;

  TasksRewardResponseSchema._();

  factory TasksRewardResponseSchema(
          [void updates(TasksRewardResponseSchemaBuilder b)]) =
      _$TasksRewardResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TasksRewardResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TasksRewardResponseSchema> get serializer =>
      _$TasksRewardResponseSchemaSerializer();
}

class _$TasksRewardResponseSchemaSerializer
    implements PrimitiveSerializer<TasksRewardResponseSchema> {
  @override
  final Iterable<Type> types = const [
    TasksRewardResponseSchema,
    _$TasksRewardResponseSchema
  ];

  @override
  final String wireName = r'TasksRewardResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TasksRewardResponseSchema object, {
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
    TasksRewardResponseSchema object, {
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
    required TasksRewardResponseSchemaBuilder result,
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
  TasksRewardResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TasksRewardResponseSchemaBuilder();
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
