//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_skin_character_data_schema.g.dart';

/// ChangeSkinCharacterDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [skin] - Craft details.
/// * [character] - Player details.
@BuiltValue()
abstract class ChangeSkinCharacterDataSchema
    implements
        Built<ChangeSkinCharacterDataSchema,
            ChangeSkinCharacterDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Craft details.
  @BuiltValueField(wireName: r'skin')
  String get skin;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  ChangeSkinCharacterDataSchema._();

  factory ChangeSkinCharacterDataSchema(
          [void updates(ChangeSkinCharacterDataSchemaBuilder b)]) =
      _$ChangeSkinCharacterDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangeSkinCharacterDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangeSkinCharacterDataSchema> get serializer =>
      _$ChangeSkinCharacterDataSchemaSerializer();
}

class _$ChangeSkinCharacterDataSchemaSerializer
    implements PrimitiveSerializer<ChangeSkinCharacterDataSchema> {
  @override
  final Iterable<Type> types = const [
    ChangeSkinCharacterDataSchema,
    _$ChangeSkinCharacterDataSchema
  ];

  @override
  final String wireName = r'ChangeSkinCharacterDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangeSkinCharacterDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'skin';
    yield serializers.serialize(
      object.skin,
      specifiedType: const FullType(String),
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
    ChangeSkinCharacterDataSchema object, {
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
    required ChangeSkinCharacterDataSchemaBuilder result,
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
        case r'skin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skin = valueDes;
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
  ChangeSkinCharacterDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangeSkinCharacterDataSchemaBuilder();
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
