//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/item_slot.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'unequip_schema.g.dart';

/// UnequipSchema
///
/// Properties:
/// * [slot] - Item slot.
/// * [quantity] - Item quantity. Applicable to utilitys only.
@BuiltValue()
abstract class UnequipSchema
    implements Built<UnequipSchema, UnequipSchemaBuilder> {
  /// Item slot.
  @BuiltValueField(wireName: r'slot')
  ItemSlot get slot;
  // enum slotEnum {  weapon,  shield,  helmet,  body_armor,  leg_armor,  boots,  ring1,  ring2,  amulet,  artifact1,  artifact2,  artifact3,  utility1,  utility2,  };

  /// Item quantity. Applicable to utilitys only.
  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  UnequipSchema._();

  factory UnequipSchema([void updates(UnequipSchemaBuilder b)]) =
      _$UnequipSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UnequipSchemaBuilder b) => b..quantity = 1;

  @BuiltValueSerializer(custom: true)
  static Serializer<UnequipSchema> get serializer =>
      _$UnequipSchemaSerializer();
}

class _$UnequipSchemaSerializer implements PrimitiveSerializer<UnequipSchema> {
  @override
  final Iterable<Type> types = const [UnequipSchema, _$UnequipSchema];

  @override
  final String wireName = r'UnequipSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UnequipSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'slot';
    yield serializers.serialize(
      object.slot,
      specifiedType: const FullType(ItemSlot),
    );
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UnequipSchema object, {
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
    required UnequipSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ItemSlot),
          ) as ItemSlot;
          result.slot = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.quantity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UnequipSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnequipSchemaBuilder();
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
