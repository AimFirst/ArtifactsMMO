//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/character_movement_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_movement_response_schema.g.dart';

/// CharacterMovementResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class CharacterMovementResponseSchema
    implements
        Built<CharacterMovementResponseSchema,
            CharacterMovementResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  CharacterMovementDataSchema get data;

  CharacterMovementResponseSchema._();

  factory CharacterMovementResponseSchema(
          [void updates(CharacterMovementResponseSchemaBuilder b)]) =
      _$CharacterMovementResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterMovementResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterMovementResponseSchema> get serializer =>
      _$CharacterMovementResponseSchemaSerializer();
}

class _$CharacterMovementResponseSchemaSerializer
    implements PrimitiveSerializer<CharacterMovementResponseSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterMovementResponseSchema,
    _$CharacterMovementResponseSchema
  ];

  @override
  final String wireName = r'CharacterMovementResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterMovementResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(CharacterMovementDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterMovementResponseSchema object, {
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
    required CharacterMovementResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterMovementDataSchema),
          ) as CharacterMovementDataSchema;
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
  CharacterMovementResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterMovementResponseSchemaBuilder();
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
