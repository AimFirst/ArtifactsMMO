//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/bank_gold_transaction_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_gold_transaction_response_schema.g.dart';

/// BankGoldTransactionResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class BankGoldTransactionResponseSchema
    implements
        Built<BankGoldTransactionResponseSchema,
            BankGoldTransactionResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  BankGoldTransactionSchema get data;

  BankGoldTransactionResponseSchema._();

  factory BankGoldTransactionResponseSchema(
          [void updates(BankGoldTransactionResponseSchemaBuilder b)]) =
      _$BankGoldTransactionResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankGoldTransactionResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankGoldTransactionResponseSchema> get serializer =>
      _$BankGoldTransactionResponseSchemaSerializer();
}

class _$BankGoldTransactionResponseSchemaSerializer
    implements PrimitiveSerializer<BankGoldTransactionResponseSchema> {
  @override
  final Iterable<Type> types = const [
    BankGoldTransactionResponseSchema,
    _$BankGoldTransactionResponseSchema
  ];

  @override
  final String wireName = r'BankGoldTransactionResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankGoldTransactionResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BankGoldTransactionSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BankGoldTransactionResponseSchema object, {
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
    required BankGoldTransactionResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BankGoldTransactionSchema),
          ) as BankGoldTransactionSchema;
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
  BankGoldTransactionResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankGoldTransactionResponseSchemaBuilder();
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
