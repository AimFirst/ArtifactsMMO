//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/bank_item_transaction_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_item_transaction_response_schema.g.dart';

/// BankItemTransactionResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class BankItemTransactionResponseSchema
    implements
        Built<BankItemTransactionResponseSchema,
            BankItemTransactionResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  BankItemTransactionSchema get data;

  BankItemTransactionResponseSchema._();

  factory BankItemTransactionResponseSchema(
          [void updates(BankItemTransactionResponseSchemaBuilder b)]) =
      _$BankItemTransactionResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankItemTransactionResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankItemTransactionResponseSchema> get serializer =>
      _$BankItemTransactionResponseSchemaSerializer();
}

class _$BankItemTransactionResponseSchemaSerializer
    implements PrimitiveSerializer<BankItemTransactionResponseSchema> {
  @override
  final Iterable<Type> types = const [
    BankItemTransactionResponseSchema,
    _$BankItemTransactionResponseSchema
  ];

  @override
  final String wireName = r'BankItemTransactionResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankItemTransactionResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BankItemTransactionSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BankItemTransactionResponseSchema object, {
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
    required BankItemTransactionResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BankItemTransactionSchema),
          ) as BankItemTransactionSchema;
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
  BankItemTransactionResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankItemTransactionResponseSchemaBuilder();
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
