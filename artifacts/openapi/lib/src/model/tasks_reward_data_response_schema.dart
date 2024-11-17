//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/tasks_reward_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tasks_reward_data_response_schema.g.dart';

/// TasksRewardDataResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class TasksRewardDataResponseSchema
    implements
        Built<TasksRewardDataResponseSchema,
            TasksRewardDataResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  TasksRewardDataSchema get data;

  TasksRewardDataResponseSchema._();

  factory TasksRewardDataResponseSchema(
          [void updates(TasksRewardDataResponseSchemaBuilder b)]) =
      _$TasksRewardDataResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TasksRewardDataResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TasksRewardDataResponseSchema> get serializer =>
      _$TasksRewardDataResponseSchemaSerializer();
}

class _$TasksRewardDataResponseSchemaSerializer
    implements PrimitiveSerializer<TasksRewardDataResponseSchema> {
  @override
  final Iterable<Type> types = const [
    TasksRewardDataResponseSchema,
    _$TasksRewardDataResponseSchema
  ];

  @override
  final String wireName = r'TasksRewardDataResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TasksRewardDataResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(TasksRewardDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TasksRewardDataResponseSchema object, {
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
    required TasksRewardDataResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TasksRewardDataSchema),
          ) as TasksRewardDataSchema;
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
  TasksRewardDataResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TasksRewardDataResponseSchemaBuilder();
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
