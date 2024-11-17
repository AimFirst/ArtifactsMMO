//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:artifacts_api/src/model/task_rewards_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tasks_reward_data_schema.g.dart';

/// TasksRewardDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [rewards] - Reward details.
/// * [character] - Player details.
@BuiltValue()
abstract class TasksRewardDataSchema
    implements Built<TasksRewardDataSchema, TasksRewardDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Reward details.
  @BuiltValueField(wireName: r'rewards')
  TaskRewardsSchema get rewards;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  TasksRewardDataSchema._();

  factory TasksRewardDataSchema(
      [void updates(TasksRewardDataSchemaBuilder b)]) = _$TasksRewardDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TasksRewardDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TasksRewardDataSchema> get serializer =>
      _$TasksRewardDataSchemaSerializer();
}

class _$TasksRewardDataSchemaSerializer
    implements PrimitiveSerializer<TasksRewardDataSchema> {
  @override
  final Iterable<Type> types = const [
    TasksRewardDataSchema,
    _$TasksRewardDataSchema
  ];

  @override
  final String wireName = r'TasksRewardDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TasksRewardDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'rewards';
    yield serializers.serialize(
      object.rewards,
      specifiedType: const FullType(TaskRewardsSchema),
    );
    yield r'character';
    yield serializers.serialize(
      object.character,
      specifiedType: const FullType(CharacterSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TasksRewardDataSchema object, {
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
    required TasksRewardDataSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cooldown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CooldownSchema),
          ) as CooldownSchema;
          result.cooldown.replace(valueDes);
          break;
        case r'rewards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskRewardsSchema),
          ) as TaskRewardsSchema;
          result.rewards.replace(valueDes);
          break;
        case r'character':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterSchema),
          ) as CharacterSchema;
          result.character.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TasksRewardDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TasksRewardDataSchemaBuilder();
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
