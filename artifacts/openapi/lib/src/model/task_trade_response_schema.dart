//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/task_trade_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_trade_response_schema.g.dart';

/// TaskTradeResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class TaskTradeResponseSchema
    implements Built<TaskTradeResponseSchema, TaskTradeResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  TaskTradeDataSchema get data;

  TaskTradeResponseSchema._();

  factory TaskTradeResponseSchema(
          [void updates(TaskTradeResponseSchemaBuilder b)]) =
      _$TaskTradeResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskTradeResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskTradeResponseSchema> get serializer =>
      _$TaskTradeResponseSchemaSerializer();
}

class _$TaskTradeResponseSchemaSerializer
    implements PrimitiveSerializer<TaskTradeResponseSchema> {
  @override
  final Iterable<Type> types = const [
    TaskTradeResponseSchema,
    _$TaskTradeResponseSchema
  ];

  @override
  final String wireName = r'TaskTradeResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskTradeResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(TaskTradeDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskTradeResponseSchema object, {
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
    required TaskTradeResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskTradeDataSchema),
          ) as TaskTradeDataSchema;
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
  TaskTradeResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskTradeResponseSchemaBuilder();
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
