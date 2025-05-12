//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/item_schema.dart';
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/item_slot.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'equip_request_schema.g.dart';

/// EquipRequestSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [slot] - Item slot.
/// * [item] - Item details.
/// * [character] - Player details.
@BuiltValue()
abstract class EquipRequestSchema
    implements Built<EquipRequestSchema, EquipRequestSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Item slot.
  @BuiltValueField(wireName: r'slot')
  ItemSlot get slot;
  // enum slotEnum {  weapon,  shield,  helmet,  body_armor,  leg_armor,  boots,  ring1,  ring2,  amulet,  artifact1,  artifact2,  artifact3,  utility1,  utility2,  bag,  rune,  };

  /// Item details.
  @BuiltValueField(wireName: r'item')
  ItemSchema get item;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  EquipRequestSchema._();

  factory EquipRequestSchema([void updates(EquipRequestSchemaBuilder b)]) =
      _$EquipRequestSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EquipRequestSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EquipRequestSchema> get serializer =>
      _$EquipRequestSchemaSerializer();
}

class _$EquipRequestSchemaSerializer
    implements PrimitiveSerializer<EquipRequestSchema> {
  @override
  final Iterable<Type> types = const [EquipRequestSchema, _$EquipRequestSchema];

  @override
  final String wireName = r'EquipRequestSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EquipRequestSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'slot';
    yield serializers.serialize(
      object.slot,
      specifiedType: const FullType(ItemSlot),
    );
    yield r'item';
    yield serializers.serialize(
      object.item,
      specifiedType: const FullType(ItemSchema),
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
    EquipRequestSchema object, {
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
    required EquipRequestSchemaBuilder result,
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
        case r'slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ItemSlot),
          ) as ItemSlot;
          result.slot = valueDes;
          break;
        case r'item':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ItemSchema),
          ) as ItemSchema;
          result.item.replace(valueDes);
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
  EquipRequestSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EquipRequestSchemaBuilder();
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
