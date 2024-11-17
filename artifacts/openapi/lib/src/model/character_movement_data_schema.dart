//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/map_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_movement_data_schema.g.dart';

/// CharacterMovementDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details
/// * [destination] - Destination details.
/// * [character] - Character details.
@BuiltValue()
abstract class CharacterMovementDataSchema
    implements
        Built<CharacterMovementDataSchema, CharacterMovementDataSchemaBuilder> {
  /// Cooldown details
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Destination details.
  @BuiltValueField(wireName: r'destination')
  MapSchema get destination;

  /// Character details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  CharacterMovementDataSchema._();

  factory CharacterMovementDataSchema(
          [void updates(CharacterMovementDataSchemaBuilder b)]) =
      _$CharacterMovementDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterMovementDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterMovementDataSchema> get serializer =>
      _$CharacterMovementDataSchemaSerializer();
}

class _$CharacterMovementDataSchemaSerializer
    implements PrimitiveSerializer<CharacterMovementDataSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterMovementDataSchema,
    _$CharacterMovementDataSchema
  ];

  @override
  final String wireName = r'CharacterMovementDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterMovementDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'destination';
    yield serializers.serialize(
      object.destination,
      specifiedType: const FullType(MapSchema),
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
    CharacterMovementDataSchema object, {
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
    required CharacterMovementDataSchemaBuilder result,
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
        case r'destination':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MapSchema),
          ) as MapSchema;
          result.destination.replace(valueDes);
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
  CharacterMovementDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterMovementDataSchemaBuilder();
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
