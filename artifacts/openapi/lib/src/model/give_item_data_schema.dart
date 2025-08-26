//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'give_item_data_schema.g.dart';

/// GiveItemDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [items] - Items given.
/// * [receiverCharacter] - Character details of the receiving character.
/// * [character] - Character details of the sending character.
@BuiltValue()
abstract class GiveItemDataSchema
    implements Built<GiveItemDataSchema, GiveItemDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Items given.
  @BuiltValueField(wireName: r'items')
  BuiltList<SimpleItemSchema> get items;

  /// Character details of the receiving character.
  @BuiltValueField(wireName: r'receiver_character')
  CharacterSchema get receiverCharacter;

  /// Character details of the sending character.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  GiveItemDataSchema._();

  factory GiveItemDataSchema([void updates(GiveItemDataSchemaBuilder b)]) =
      _$GiveItemDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GiveItemDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GiveItemDataSchema> get serializer =>
      _$GiveItemDataSchemaSerializer();
}

class _$GiveItemDataSchemaSerializer
    implements PrimitiveSerializer<GiveItemDataSchema> {
  @override
  final Iterable<Type> types = const [GiveItemDataSchema, _$GiveItemDataSchema];

  @override
  final String wireName = r'GiveItemDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GiveItemDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(SimpleItemSchema)]),
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
    GiveItemDataSchema object, {
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
    required GiveItemDataSchemaBuilder result,
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
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleItemSchema)]),
          ) as BuiltList<SimpleItemSchema>;
          result.items.replace(valueDes);
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
  GiveItemDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GiveItemDataSchemaBuilder();
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
