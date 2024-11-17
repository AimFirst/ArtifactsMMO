//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/character_skin.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_character_schema.g.dart';

/// AddCharacterSchema
///
/// Properties:
/// * [name] - Your desired character name. It's unique and all players can see it.
/// * [skin] - Your desired skin.
@BuiltValue()
abstract class AddCharacterSchema
    implements Built<AddCharacterSchema, AddCharacterSchemaBuilder> {
  /// Your desired character name. It's unique and all players can see it.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Your desired skin.
  @BuiltValueField(wireName: r'skin')
  CharacterSkin get skin;
  // enum skinEnum {  men1,  men2,  men3,  women1,  women2,  women3,  };

  AddCharacterSchema._();

  factory AddCharacterSchema([void updates(AddCharacterSchemaBuilder b)]) =
      _$AddCharacterSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddCharacterSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddCharacterSchema> get serializer =>
      _$AddCharacterSchemaSerializer();
}

class _$AddCharacterSchemaSerializer
    implements PrimitiveSerializer<AddCharacterSchema> {
  @override
  final Iterable<Type> types = const [AddCharacterSchema, _$AddCharacterSchema];

  @override
  final String wireName = r'AddCharacterSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddCharacterSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'skin';
    yield serializers.serialize(
      object.skin,
      specifiedType: const FullType(CharacterSkin),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddCharacterSchema object, {
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
    required AddCharacterSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'skin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterSkin),
          ) as CharacterSkin;
          result.skin = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddCharacterSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddCharacterSchemaBuilder();
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
