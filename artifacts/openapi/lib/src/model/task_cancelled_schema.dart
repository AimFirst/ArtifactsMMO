//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_cancelled_schema.g.dart';

/// TaskCancelledSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [character] - Player details.
@BuiltValue()
abstract class TaskCancelledSchema
    implements Built<TaskCancelledSchema, TaskCancelledSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  TaskCancelledSchema._();

  factory TaskCancelledSchema([void updates(TaskCancelledSchemaBuilder b)]) =
      _$TaskCancelledSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskCancelledSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskCancelledSchema> get serializer =>
      _$TaskCancelledSchemaSerializer();
}

class _$TaskCancelledSchemaSerializer
    implements PrimitiveSerializer<TaskCancelledSchema> {
  @override
  final Iterable<Type> types = const [
    TaskCancelledSchema,
    _$TaskCancelledSchema
  ];

  @override
  final String wireName = r'TaskCancelledSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskCancelledSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
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
    TaskCancelledSchema object, {
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
    required TaskCancelledSchemaBuilder result,
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
  TaskCancelledSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskCancelledSchemaBuilder();
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
