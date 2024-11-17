//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/task_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_response_schema.g.dart';

/// TaskResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class TaskResponseSchema
    implements Built<TaskResponseSchema, TaskResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  TaskDataSchema get data;

  TaskResponseSchema._();

  factory TaskResponseSchema([void updates(TaskResponseSchemaBuilder b)]) =
      _$TaskResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskResponseSchema> get serializer =>
      _$TaskResponseSchemaSerializer();
}

class _$TaskResponseSchemaSerializer
    implements PrimitiveSerializer<TaskResponseSchema> {
  @override
  final Iterable<Type> types = const [TaskResponseSchema, _$TaskResponseSchema];

  @override
  final String wireName = r'TaskResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(TaskDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskResponseSchema object, {
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
    required TaskResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskDataSchema),
          ) as TaskDataSchema;
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
  TaskResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskResponseSchemaBuilder();
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
