//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'my_characters_list_schema.g.dart';

/// MyCharactersListSchema
///
/// Properties:
/// * [data] - List of your characters.
@BuiltValue()
abstract class MyCharactersListSchema
    implements Built<MyCharactersListSchema, MyCharactersListSchemaBuilder> {
  /// List of your characters.
  @BuiltValueField(wireName: r'data')
  BuiltList<CharacterSchema> get data;

  MyCharactersListSchema._();

  factory MyCharactersListSchema(
          [void updates(MyCharactersListSchemaBuilder b)]) =
      _$MyCharactersListSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MyCharactersListSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MyCharactersListSchema> get serializer =>
      _$MyCharactersListSchemaSerializer();
}

class _$MyCharactersListSchemaSerializer
    implements PrimitiveSerializer<MyCharactersListSchema> {
  @override
  final Iterable<Type> types = const [
    MyCharactersListSchema,
    _$MyCharactersListSchema
  ];

  @override
  final String wireName = r'MyCharactersListSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MyCharactersListSchema object, {
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
    MyCharactersListSchema object, {
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
    required MyCharactersListSchemaBuilder result,
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
  MyCharactersListSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MyCharactersListSchemaBuilder();
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
