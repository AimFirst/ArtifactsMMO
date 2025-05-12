//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/npc_merchant_transaction_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'npc_merchant_transaction_response_schema.g.dart';

/// NpcMerchantTransactionResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class NpcMerchantTransactionResponseSchema
    implements
        Built<NpcMerchantTransactionResponseSchema,
            NpcMerchantTransactionResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  NpcMerchantTransactionSchema get data;

  NpcMerchantTransactionResponseSchema._();

  factory NpcMerchantTransactionResponseSchema(
          [void updates(NpcMerchantTransactionResponseSchemaBuilder b)]) =
      _$NpcMerchantTransactionResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NpcMerchantTransactionResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NpcMerchantTransactionResponseSchema> get serializer =>
      _$NpcMerchantTransactionResponseSchemaSerializer();
}

class _$NpcMerchantTransactionResponseSchemaSerializer
    implements PrimitiveSerializer<NpcMerchantTransactionResponseSchema> {
  @override
  final Iterable<Type> types = const [
    NpcMerchantTransactionResponseSchema,
    _$NpcMerchantTransactionResponseSchema
  ];

  @override
  final String wireName = r'NpcMerchantTransactionResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NpcMerchantTransactionResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(NpcMerchantTransactionSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NpcMerchantTransactionResponseSchema object, {
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
    required NpcMerchantTransactionResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NpcMerchantTransactionSchema),
          ) as NpcMerchantTransactionSchema;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NpcMerchantTransactionResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NpcMerchantTransactionResponseSchemaBuilder();
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
