//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/character_rest_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_rest_response_schema.g.dart';

/// CharacterRestResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class CharacterRestResponseSchema
    implements
        Built<CharacterRestResponseSchema, CharacterRestResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  CharacterRestDataSchema get data;

  CharacterRestResponseSchema._();

  factory CharacterRestResponseSchema(
          [void updates(CharacterRestResponseSchemaBuilder b)]) =
      _$CharacterRestResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterRestResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterRestResponseSchema> get serializer =>
      _$CharacterRestResponseSchemaSerializer();
}

class _$CharacterRestResponseSchemaSerializer
    implements PrimitiveSerializer<CharacterRestResponseSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterRestResponseSchema,
    _$CharacterRestResponseSchema
  ];

  @override
  final String wireName = r'CharacterRestResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterRestResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(CharacterRestDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterRestResponseSchema object, {
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
    required CharacterRestResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterRestDataSchema),
          ) as CharacterRestDataSchema;
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
  CharacterRestResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterRestResponseSchemaBuilder();
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
