//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/task_type.dart';
import 'package:artifacts_api/src/model/task_rewards_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_full_schema.g.dart';

/// TaskFullSchema
///
/// Properties:
/// * [code] - Task objective.
/// * [level] - Task level.
/// * [type] - The type of task.
/// * [minQuantity] - Minimum amount of task.
/// * [maxQuantity] - Maximum amount of task.
/// * [skill]
/// * [rewards] - Rewards.
@BuiltValue()
abstract class TaskFullSchema
    implements Built<TaskFullSchema, TaskFullSchemaBuilder> {
  /// Task objective.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Task level.
  @BuiltValueField(wireName: r'level')
  int get level;

  /// The type of task.
  @BuiltValueField(wireName: r'type')
  TaskType get type;
  // enum typeEnum {  monsters,  items,  };

  /// Minimum amount of task.
  @BuiltValueField(wireName: r'min_quantity')
  int get minQuantity;

  /// Maximum amount of task.
  @BuiltValueField(wireName: r'max_quantity')
  int get maxQuantity;

  @BuiltValueField(wireName: r'skill')
  String? get skill;

  /// Rewards.
  @BuiltValueField(wireName: r'rewards')
  TaskRewardsSchema get rewards;

  TaskFullSchema._();

  factory TaskFullSchema([void updates(TaskFullSchemaBuilder b)]) =
      _$TaskFullSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskFullSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskFullSchema> get serializer =>
      _$TaskFullSchemaSerializer();
}

class _$TaskFullSchemaSerializer
    implements PrimitiveSerializer<TaskFullSchema> {
  @override
  final Iterable<Type> types = const [TaskFullSchema, _$TaskFullSchema];

  @override
  final String wireName = r'TaskFullSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskFullSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(TaskType),
    );
    yield r'min_quantity';
    yield serializers.serialize(
      object.minQuantity,
      specifiedType: const FullType(int),
    );
    yield r'max_quantity';
    yield serializers.serialize(
      object.maxQuantity,
      specifiedType: const FullType(int),
    );
    yield r'skill';
    yield object.skill == null
        ? null
        : serializers.serialize(
            object.skill,
            specifiedType: const FullType.nullable(String),
          );
    yield r'rewards';
    yield serializers.serialize(
      object.rewards,
      specifiedType: const FullType(TaskRewardsSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaskFullSchema object, {
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
    required TaskFullSchemaBuilder result,
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
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskType),
          ) as TaskType;
          result.type = valueDes;
          break;
        case r'min_quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.minQuantity = valueDes;
          break;
        case r'max_quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxQuantity = valueDes;
          break;
        case r'skill':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.skill = valueDes;
          break;
        case r'rewards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskRewardsSchema),
          ) as TaskRewardsSchema;
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
  TaskFullSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskFullSchemaBuilder();
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
