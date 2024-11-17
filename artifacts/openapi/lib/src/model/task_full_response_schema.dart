//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/task_full_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_full_response_schema.g.dart';

/// TaskFullResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class TaskFullResponseSchema
    implements Built<TaskFullResponseSchema, TaskFullResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  TaskFullSchema get data;

  TaskFullResponseSchema._();

  factory TaskFullResponseSchema(
          [void updates(TaskFullResponseSchemaBuilder b)]) =
      _$TaskFullResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskFullResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskFullResponseSchema> get serializer =>
      _$TaskFullResponseSchemaSerializer();
}

class _$TaskFullResponseSchemaSerializer
    implements PrimitiveSerializer<TaskFullResponseSchema> {
  @override
  final Iterable<Type> types = const [
    TaskFullResponseSchema,
    _$TaskFullResponseSchema
  ];

  @override
  final String wireName = r'TaskFullResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskFullResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(TaskFullSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskFullResponseSchema object, {
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
    required TaskFullResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskFullSchema),
          ) as TaskFullSchema;
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
  TaskFullResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskFullResponseSchemaBuilder();
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
