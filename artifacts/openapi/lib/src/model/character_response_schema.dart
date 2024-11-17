//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_response_schema.g.dart';

/// CharacterResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class CharacterResponseSchema
    implements Built<CharacterResponseSchema, CharacterResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  CharacterSchema get data;

  CharacterResponseSchema._();

  factory CharacterResponseSchema(
          [void updates(CharacterResponseSchemaBuilder b)]) =
      _$CharacterResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterResponseSchema> get serializer =>
      _$CharacterResponseSchemaSerializer();
}

class _$CharacterResponseSchemaSerializer
    implements PrimitiveSerializer<CharacterResponseSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterResponseSchema,
    _$CharacterResponseSchema
  ];

  @override
  final String wireName = r'CharacterResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(CharacterSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterResponseSchema object, {
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
    required CharacterResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterSchema),
          ) as CharacterSchema;
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
  CharacterResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterResponseSchemaBuilder();
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
