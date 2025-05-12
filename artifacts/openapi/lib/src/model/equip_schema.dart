//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/item_slot.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'equip_schema.g.dart';

/// EquipSchema
///
/// Properties:
/// * [code] - Item code.
/// * [slot] - Item slot.
/// * [quantity] - Item quantity. Applicable to utilities only.
@BuiltValue()
abstract class EquipSchema implements Built<EquipSchema, EquipSchemaBuilder> {
  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item slot.
  @BuiltValueField(wireName: r'slot')
  ItemSlot get slot;
  // enum slotEnum {  weapon,  shield,  helmet,  body_armor,  leg_armor,  boots,  ring1,  ring2,  amulet,  artifact1,  artifact2,  artifact3,  utility1,  utility2,  bag,  rune,  };

  /// Item quantity. Applicable to utilities only.
  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  EquipSchema._();

  factory EquipSchema([void updates(EquipSchemaBuilder b)]) = _$EquipSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EquipSchemaBuilder b) => b..quantity = 1;

  @BuiltValueSerializer(custom: true)
  static Serializer<EquipSchema> get serializer => _$EquipSchemaSerializer();
}

class _$EquipSchemaSerializer implements PrimitiveSerializer<EquipSchema> {
  @override
  final Iterable<Type> types = const [EquipSchema, _$EquipSchema];

  @override
  final String wireName = r'EquipSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EquipSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
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
    EquipSchema object, {
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
    required EquipSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
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
  EquipSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EquipSchemaBuilder();
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
