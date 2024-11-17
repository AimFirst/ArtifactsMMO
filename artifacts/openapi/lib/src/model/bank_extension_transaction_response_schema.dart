//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/bank_extension_transaction_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_extension_transaction_response_schema.g.dart';

/// BankExtensionTransactionResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class BankExtensionTransactionResponseSchema
    implements
        Built<BankExtensionTransactionResponseSchema,
            BankExtensionTransactionResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  BankExtensionTransactionSchema get data;

  BankExtensionTransactionResponseSchema._();

  factory BankExtensionTransactionResponseSchema(
          [void updates(BankExtensionTransactionResponseSchemaBuilder b)]) =
      _$BankExtensionTransactionResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankExtensionTransactionResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankExtensionTransactionResponseSchema> get serializer =>
      _$BankExtensionTransactionResponseSchemaSerializer();
}

class _$BankExtensionTransactionResponseSchemaSerializer
    implements PrimitiveSerializer<BankExtensionTransactionResponseSchema> {
  @override
  final Iterable<Type> types = const [
    BankExtensionTransactionResponseSchema,
    _$BankExtensionTransactionResponseSchema
  ];

  @override
  final String wireName = r'BankExtensionTransactionResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankExtensionTransactionResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BankExtensionTransactionSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BankExtensionTransactionResponseSchema object, {
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
    required BankExtensionTransactionResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BankExtensionTransactionSchema),
          ) as BankExtensionTransactionSchema;
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
  BankExtensionTransactionResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankExtensionTransactionResponseSchemaBuilder();
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
