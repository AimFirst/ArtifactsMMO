//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/ge_order_transaction_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_create_order_transaction_response_schema.g.dart';

/// GECreateOrderTransactionResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class GECreateOrderTransactionResponseSchema
    implements
        Built<GECreateOrderTransactionResponseSchema,
            GECreateOrderTransactionResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  GEOrderTransactionSchema get data;

  GECreateOrderTransactionResponseSchema._();

  factory GECreateOrderTransactionResponseSchema(
          [void updates(GECreateOrderTransactionResponseSchemaBuilder b)]) =
      _$GECreateOrderTransactionResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GECreateOrderTransactionResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GECreateOrderTransactionResponseSchema> get serializer =>
      _$GECreateOrderTransactionResponseSchemaSerializer();
}

class _$GECreateOrderTransactionResponseSchemaSerializer
    implements PrimitiveSerializer<GECreateOrderTransactionResponseSchema> {
  @override
  final Iterable<Type> types = const [
    GECreateOrderTransactionResponseSchema,
    _$GECreateOrderTransactionResponseSchema
  ];

  @override
  final String wireName = r'GECreateOrderTransactionResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GECreateOrderTransactionResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(GEOrderTransactionSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GECreateOrderTransactionResponseSchema object, {
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
    required GECreateOrderTransactionResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GEOrderTransactionSchema),
          ) as GEOrderTransactionSchema;
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
  GECreateOrderTransactionResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GECreateOrderTransactionResponseSchemaBuilder();
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
