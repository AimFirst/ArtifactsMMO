//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/task_cancelled_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_cancelled_response_schema.g.dart';

/// TaskCancelledResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class TaskCancelledResponseSchema
    implements
        Built<TaskCancelledResponseSchema, TaskCancelledResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  TaskCancelledSchema get data;

  TaskCancelledResponseSchema._();

  factory TaskCancelledResponseSchema(
          [void updates(TaskCancelledResponseSchemaBuilder b)]) =
      _$TaskCancelledResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskCancelledResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskCancelledResponseSchema> get serializer =>
      _$TaskCancelledResponseSchemaSerializer();
}

class _$TaskCancelledResponseSchemaSerializer
    implements PrimitiveSerializer<TaskCancelledResponseSchema> {
  @override
  final Iterable<Type> types = const [
    TaskCancelledResponseSchema,
    _$TaskCancelledResponseSchema
  ];

  @override
  final String wireName = r'TaskCancelledResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskCancelledResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(TaskCancelledSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskCancelledResponseSchema object, {
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
    required TaskCancelledResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskCancelledSchema),
          ) as TaskCancelledSchema;
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
  TaskCancelledResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskCancelledResponseSchemaBuilder();
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
