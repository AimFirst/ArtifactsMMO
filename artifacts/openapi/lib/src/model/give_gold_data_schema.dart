//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'give_gold_data_schema.g.dart';

/// GiveGoldDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [quantity] - Quantity of gold given.
/// * [receiverCharacter] - Character details of the receiving character.
/// * [character] - Character details.
@BuiltValue()
abstract class GiveGoldDataSchema
    implements Built<GiveGoldDataSchema, GiveGoldDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Quantity of gold given.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Character details of the receiving character.
  @BuiltValueField(wireName: r'receiver_character')
  CharacterSchema get receiverCharacter;

  /// Character details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  GiveGoldDataSchema._();

  factory GiveGoldDataSchema([void updates(GiveGoldDataSchemaBuilder b)]) =
      _$GiveGoldDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GiveGoldDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GiveGoldDataSchema> get serializer =>
      _$GiveGoldDataSchemaSerializer();
}

class _$GiveGoldDataSchemaSerializer
    implements PrimitiveSerializer<GiveGoldDataSchema> {
  @override
  final Iterable<Type> types = const [GiveGoldDataSchema, _$GiveGoldDataSchema];

  @override
  final String wireName = r'GiveGoldDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GiveGoldDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
    yield r'receiver_character';
    yield serializers.serialize(
      object.receiverCharacter,
      specifiedType: const FullType(CharacterSchema),
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
    GiveGoldDataSchema object, {
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
    required GiveGoldDataSchemaBuilder result,
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
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.quantity = valueDes;
          break;
        case r'receiver_character':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterSchema),
          ) as CharacterSchema;
          result.receiverCharacter.replace(valueDes);
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
  GiveGoldDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GiveGoldDataSchemaBuilder();
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
