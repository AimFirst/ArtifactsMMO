//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inventory_slot.g.dart';

/// InventorySlot
///
/// Properties:
/// * [slot] - Inventory slot identifier.
/// * [code] - Item code.
/// * [quantity] - Quantity in the slot.
@BuiltValue()
abstract class InventorySlot
    implements Built<InventorySlot, InventorySlotBuilder> {
  /// Inventory slot identifier.
  @BuiltValueField(wireName: r'slot')
  int get slot;

  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Quantity in the slot.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  InventorySlot._();

  factory InventorySlot([void updates(InventorySlotBuilder b)]) =
      _$InventorySlot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InventorySlotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InventorySlot> get serializer =>
      _$InventorySlotSerializer();
}

class _$InventorySlotSerializer implements PrimitiveSerializer<InventorySlot> {
  @override
  final Iterable<Type> types = const [InventorySlot, _$InventorySlot];

  @override
  final String wireName = r'InventorySlot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InventorySlot object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'slot';
    yield serializers.serialize(
      object.slot,
      specifiedType: const FullType(int),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InventorySlot object, {
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
    required InventorySlotBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.slot = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
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
  InventorySlot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InventorySlotBuilder();
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
