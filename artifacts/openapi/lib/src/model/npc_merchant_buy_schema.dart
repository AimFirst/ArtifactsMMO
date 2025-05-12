//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'npc_merchant_buy_schema.g.dart';

/// NpcMerchantBuySchema
///
/// Properties:
/// * [code] - Item code.
/// * [quantity] - Item quantity.
@BuiltValue()
abstract class NpcMerchantBuySchema
    implements Built<NpcMerchantBuySchema, NpcMerchantBuySchemaBuilder> {
  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  NpcMerchantBuySchema._();

  factory NpcMerchantBuySchema([void updates(NpcMerchantBuySchemaBuilder b)]) =
      _$NpcMerchantBuySchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NpcMerchantBuySchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NpcMerchantBuySchema> get serializer =>
      _$NpcMerchantBuySchemaSerializer();
}

class _$NpcMerchantBuySchemaSerializer
    implements PrimitiveSerializer<NpcMerchantBuySchema> {
  @override
  final Iterable<Type> types = const [
    NpcMerchantBuySchema,
    _$NpcMerchantBuySchema
  ];

  @override
  final String wireName = r'NpcMerchantBuySchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NpcMerchantBuySchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    NpcMerchantBuySchema object, {
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
    required NpcMerchantBuySchemaBuilder result,
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
  NpcMerchantBuySchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NpcMerchantBuySchemaBuilder();
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
