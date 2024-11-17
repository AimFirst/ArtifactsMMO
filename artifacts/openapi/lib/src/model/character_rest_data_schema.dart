//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_rest_data_schema.g.dart';

/// CharacterRestDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details
/// * [hpRestored] - The amount of HP restored.
/// * [character] - Character details.
@BuiltValue()
abstract class CharacterRestDataSchema
    implements Built<CharacterRestDataSchema, CharacterRestDataSchemaBuilder> {
  /// Cooldown details
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// The amount of HP restored.
  @BuiltValueField(wireName: r'hp_restored')
  int get hpRestored;

  /// Character details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  CharacterRestDataSchema._();

  factory CharacterRestDataSchema(
          [void updates(CharacterRestDataSchemaBuilder b)]) =
      _$CharacterRestDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterRestDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterRestDataSchema> get serializer =>
      _$CharacterRestDataSchemaSerializer();
}

class _$CharacterRestDataSchemaSerializer
    implements PrimitiveSerializer<CharacterRestDataSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterRestDataSchema,
    _$CharacterRestDataSchema
  ];

  @override
  final String wireName = r'CharacterRestDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterRestDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'hp_restored';
    yield serializers.serialize(
      object.hpRestored,
      specifiedType: const FullType(int),
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
    CharacterRestDataSchema object, {
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
    required CharacterRestDataSchemaBuilder result,
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
        case r'hp_restored':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.hpRestored = valueDes;
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
  CharacterRestDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterRestDataSchemaBuilder();
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
