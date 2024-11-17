//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_transaction_schema.g.dart';

/// GETransactionSchema
///
/// Properties:
/// * [id] - Order id.
/// * [code] - Item code.
/// * [quantity] - Item quantity.
/// * [price] - Item price.
/// * [totalPrice] - Total price of the transaction.
@BuiltValue()
abstract class GETransactionSchema
    implements Built<GETransactionSchema, GETransactionSchemaBuilder> {
  /// Order id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Item price.
  @BuiltValueField(wireName: r'price')
  int get price;

  /// Total price of the transaction.
  @BuiltValueField(wireName: r'total_price')
  int get totalPrice;

  GETransactionSchema._();

  factory GETransactionSchema([void updates(GETransactionSchemaBuilder b)]) =
      _$GETransactionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GETransactionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GETransactionSchema> get serializer =>
      _$GETransactionSchemaSerializer();
}

class _$GETransactionSchemaSerializer
    implements PrimitiveSerializer<GETransactionSchema> {
  @override
  final Iterable<Type> types = const [
    GETransactionSchema,
    _$GETransactionSchema
  ];

  @override
  final String wireName = r'GETransactionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GETransactionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
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
    yield r'price';
    yield serializers.serialize(
      object.price,
      specifiedType: const FullType(int),
    );
    yield r'total_price';
    yield serializers.serialize(
      object.totalPrice,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GETransactionSchema object, {
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
    required GETransactionSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
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
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.price = valueDes;
          break;
        case r'total_price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalPrice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GETransactionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GETransactionSchemaBuilder();
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
