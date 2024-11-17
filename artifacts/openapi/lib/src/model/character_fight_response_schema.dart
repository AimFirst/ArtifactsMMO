//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/character_fight_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_fight_response_schema.g.dart';

/// CharacterFightResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class CharacterFightResponseSchema
    implements
        Built<CharacterFightResponseSchema,
            CharacterFightResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  CharacterFightDataSchema get data;

  CharacterFightResponseSchema._();

  factory CharacterFightResponseSchema(
          [void updates(CharacterFightResponseSchemaBuilder b)]) =
      _$CharacterFightResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterFightResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterFightResponseSchema> get serializer =>
      _$CharacterFightResponseSchemaSerializer();
}

class _$CharacterFightResponseSchemaSerializer
    implements PrimitiveSerializer<CharacterFightResponseSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterFightResponseSchema,
    _$CharacterFightResponseSchema
  ];

  @override
  final String wireName = r'CharacterFightResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterFightResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(CharacterFightDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterFightResponseSchema object, {
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
    required CharacterFightResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterFightDataSchema),
          ) as CharacterFightDataSchema;
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
  CharacterFightResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterFightResponseSchemaBuilder();
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
