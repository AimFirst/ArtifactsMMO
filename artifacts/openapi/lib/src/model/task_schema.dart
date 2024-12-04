//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/rewards_schema.dart';
import 'package:artifacts_api/src/model/task_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_schema.g.dart';

/// TaskSchema
///
/// Properties:
/// * [code] - Task objective.
/// * [type] - The type of task.
/// * [total] - The total required to complete the task.
/// * [rewards] - Rewards for completing the task.
@BuiltValue()
abstract class TaskSchema implements Built<TaskSchema, TaskSchemaBuilder> {
  /// Task objective.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// The type of task.
  @BuiltValueField(wireName: r'type')
  TaskType get type;
  // enum typeEnum {  monsters,  items,  };

  /// The total required to complete the task.
  @BuiltValueField(wireName: r'total')
  int get total;

  /// Rewards for completing the task.
  @BuiltValueField(wireName: r'rewards')
  RewardsSchema get rewards;

  TaskSchema._();

  factory TaskSchema([void updates(TaskSchemaBuilder b)]) = _$TaskSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskSchema> get serializer => _$TaskSchemaSerializer();
}

class _$TaskSchemaSerializer implements PrimitiveSerializer<TaskSchema> {
  @override
  final Iterable<Type> types = const [TaskSchema, _$TaskSchema];

  @override
  final String wireName = r'TaskSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(TaskType),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'rewards';
    yield serializers.serialize(
      object.rewards,
      specifiedType: const FullType(RewardsSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskSchema object, {
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
    required TaskSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskType),
          ) as TaskType;
          result.type = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'rewards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RewardsSchema),
          ) as RewardsSchema;
          result.rewards.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TaskSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskSchemaBuilder();
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
