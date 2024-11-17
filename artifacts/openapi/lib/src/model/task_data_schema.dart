//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/task_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_data_schema.g.dart';

/// TaskDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [task] - Task details.
/// * [character] - Player details.
@BuiltValue()
abstract class TaskDataSchema
    implements Built<TaskDataSchema, TaskDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Task details.
  @BuiltValueField(wireName: r'task')
  TaskSchema get task;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  TaskDataSchema._();

  factory TaskDataSchema([void updates(TaskDataSchemaBuilder b)]) =
      _$TaskDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskDataSchema> get serializer =>
      _$TaskDataSchemaSerializer();
}

class _$TaskDataSchemaSerializer
    implements PrimitiveSerializer<TaskDataSchema> {
  @override
  final Iterable<Type> types = const [TaskDataSchema, _$TaskDataSchema];

  @override
  final String wireName = r'TaskDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'task';
    yield serializers.serialize(
      object.task,
      specifiedType: const FullType(TaskSchema),
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
    TaskDataSchema object, {
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
    required TaskDataSchemaBuilder result,
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
        case r'task':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TaskSchema),
          ) as TaskSchema;
          result.task.replace(valueDes);
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
  TaskDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskDataSchemaBuilder();
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
