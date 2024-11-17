//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/fight_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_fight_data_schema.g.dart';

/// CharacterFightDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [fight] - Fight details.
/// * [character] - Player details.
@BuiltValue()
abstract class CharacterFightDataSchema
    implements
        Built<CharacterFightDataSchema, CharacterFightDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Fight details.
  @BuiltValueField(wireName: r'fight')
  FightSchema get fight;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  CharacterFightDataSchema._();

  factory CharacterFightDataSchema(
          [void updates(CharacterFightDataSchemaBuilder b)]) =
      _$CharacterFightDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterFightDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterFightDataSchema> get serializer =>
      _$CharacterFightDataSchemaSerializer();
}

class _$CharacterFightDataSchemaSerializer
    implements PrimitiveSerializer<CharacterFightDataSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterFightDataSchema,
    _$CharacterFightDataSchema
  ];

  @override
  final String wireName = r'CharacterFightDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterFightDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'fight';
    yield serializers.serialize(
      object.fight,
      specifiedType: const FullType(FightSchema),
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
    CharacterFightDataSchema object, {
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
    required CharacterFightDataSchemaBuilder result,
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
        case r'fight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FightSchema),
          ) as FightSchema;
          result.fight.replace(valueDes);
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
  CharacterFightDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterFightDataSchemaBuilder();
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
