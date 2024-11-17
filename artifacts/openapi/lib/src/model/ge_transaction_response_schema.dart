//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/ge_transaction_list_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_transaction_response_schema.g.dart';

/// GETransactionResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class GETransactionResponseSchema
    implements
        Built<GETransactionResponseSchema, GETransactionResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  GETransactionListSchema get data;

  GETransactionResponseSchema._();

  factory GETransactionResponseSchema(
          [void updates(GETransactionResponseSchemaBuilder b)]) =
      _$GETransactionResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GETransactionResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GETransactionResponseSchema> get serializer =>
      _$GETransactionResponseSchemaSerializer();
}

class _$GETransactionResponseSchemaSerializer
    implements PrimitiveSerializer<GETransactionResponseSchema> {
  @override
  final Iterable<Type> types = const [
    GETransactionResponseSchema,
    _$GETransactionResponseSchema
  ];

  @override
  final String wireName = r'GETransactionResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GETransactionResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(GETransactionListSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GETransactionResponseSchema object, {
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
    required GETransactionResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GETransactionListSchema),
          ) as GETransactionListSchema;
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
  GETransactionResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GETransactionResponseSchemaBuilder();
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
