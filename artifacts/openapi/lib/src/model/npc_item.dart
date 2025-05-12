//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'npc_item.g.dart';

/// NPCItem
///
/// Properties:
/// * [code] - The code of the NPC. This is the NPC's unique identifier (ID).
/// * [npc] - Code of the NPC that sells/buys the item.
/// * [buyPrice]
/// * [sellPrice]
@BuiltValue()
abstract class NPCItem implements Built<NPCItem, NPCItemBuilder> {
  /// The code of the NPC. This is the NPC's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Code of the NPC that sells/buys the item.
  @BuiltValueField(wireName: r'npc')
  String get npc;

  @BuiltValueField(wireName: r'buy_price')
  int? get buyPrice;

  @BuiltValueField(wireName: r'sell_price')
  int? get sellPrice;

  NPCItem._();

  factory NPCItem([void updates(NPCItemBuilder b)]) = _$NPCItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NPCItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NPCItem> get serializer => _$NPCItemSerializer();
}

class _$NPCItemSerializer implements PrimitiveSerializer<NPCItem> {
  @override
  final Iterable<Type> types = const [NPCItem, _$NPCItem];

  @override
  final String wireName = r'NPCItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NPCItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'npc';
    yield serializers.serialize(
      object.npc,
      specifiedType: const FullType(String),
    );
    yield r'buy_price';
    yield object.buyPrice == null
        ? null
        : serializers.serialize(
            object.buyPrice,
            specifiedType: const FullType.nullable(int),
          );
    yield r'sell_price';
    yield object.sellPrice == null
        ? null
        : serializers.serialize(
            object.sellPrice,
            specifiedType: const FullType.nullable(int),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    NPCItem object, {
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
    required NPCItemBuilder result,
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
        case r'npc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.npc = valueDes;
          break;
        case r'buy_price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.buyPrice = valueDes;
          break;
        case r'sell_price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sellPrice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NPCItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NPCItemBuilder();
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
