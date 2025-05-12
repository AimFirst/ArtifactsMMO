//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'characters_list_schema.g.dart';

/// CharactersListSchema
///
/// Properties:
/// * [data] - List of your characters.
@BuiltValue()
abstract class CharactersListSchema
    implements Built<CharactersListSchema, CharactersListSchemaBuilder> {
  /// List of your characters.
  @BuiltValueField(wireName: r'data')
  BuiltList<CharacterSchema> get data;

  CharactersListSchema._();

  factory CharactersListSchema([void updates(CharactersListSchemaBuilder b)]) =
      _$CharactersListSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharactersListSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharactersListSchema> get serializer =>
      _$CharactersListSchemaSerializer();
}

class _$CharactersListSchemaSerializer
    implements PrimitiveSerializer<CharactersListSchema> {
  @override
  final Iterable<Type> types = const [
    CharactersListSchema,
    _$CharactersListSchema
  ];

  @override
  final String wireName = r'CharactersListSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharactersListSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(CharacterSchema)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharactersListSchema object, {
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
    required CharactersListSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(CharacterSchema)]),
          ) as BuiltList<CharacterSchema>;
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
  CharactersListSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharactersListSchemaBuilder();
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
