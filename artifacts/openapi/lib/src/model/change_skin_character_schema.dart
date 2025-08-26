//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/character_skin.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_skin_character_schema.g.dart';

/// ChangeSkinCharacterSchema
///
/// Properties:
/// * [skin] - Your desired skin. Skins unlocked by default: 'men1', 'men2', 'men3', 'women1', 'women2', 'women3'.
@BuiltValue()
abstract class ChangeSkinCharacterSchema
    implements
        Built<ChangeSkinCharacterSchema, ChangeSkinCharacterSchemaBuilder> {
  /// Your desired skin. Skins unlocked by default: 'men1', 'men2', 'men3', 'women1', 'women2', 'women3'.
  @BuiltValueField(wireName: r'skin')
  CharacterSkin get skin;
  // enum skinEnum {  men1,  men2,  men3,  women1,  women2,  women3,  corrupted1,  zombie1,  };

  ChangeSkinCharacterSchema._();

  factory ChangeSkinCharacterSchema(
          [void updates(ChangeSkinCharacterSchemaBuilder b)]) =
      _$ChangeSkinCharacterSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangeSkinCharacterSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangeSkinCharacterSchema> get serializer =>
      _$ChangeSkinCharacterSchemaSerializer();
}

class _$ChangeSkinCharacterSchemaSerializer
    implements PrimitiveSerializer<ChangeSkinCharacterSchema> {
  @override
  final Iterable<Type> types = const [
    ChangeSkinCharacterSchema,
    _$ChangeSkinCharacterSchema
  ];

  @override
  final String wireName = r'ChangeSkinCharacterSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangeSkinCharacterSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'skin';
    yield serializers.serialize(
      object.skin,
      specifiedType: const FullType(CharacterSkin),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChangeSkinCharacterSchema object, {
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
    required ChangeSkinCharacterSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  ChangeSkinCharacterSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangeSkinCharacterSchemaBuilder();
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
