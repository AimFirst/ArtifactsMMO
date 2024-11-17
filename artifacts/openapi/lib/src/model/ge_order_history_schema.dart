//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_order_history_schema.g.dart';

/// GeOrderHistorySchema
///
/// Properties:
/// * [orderId] - Order id.
/// * [seller] - Seller account name.
/// * [buyer] - Buyer account name.
/// * [code] - Item code.
/// * [quantity] - Item quantity.
/// * [price] - Item price per unit.
/// * [soldAt] - Sale datetime.
@BuiltValue()
abstract class GeOrderHistorySchema
    implements Built<GeOrderHistorySchema, GeOrderHistorySchemaBuilder> {
  /// Order id.
  @BuiltValueField(wireName: r'order_id')
  String get orderId;

  /// Seller account name.
  @BuiltValueField(wireName: r'seller')
  String get seller;

  /// Buyer account name.
  @BuiltValueField(wireName: r'buyer')
  String get buyer;

  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Item price per unit.
  @BuiltValueField(wireName: r'price')
  int get price;

  /// Sale datetime.
  @BuiltValueField(wireName: r'sold_at')
  DateTime get soldAt;

  GeOrderHistorySchema._();

  factory GeOrderHistorySchema([void updates(GeOrderHistorySchemaBuilder b)]) =
      _$GeOrderHistorySchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeOrderHistorySchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeOrderHistorySchema> get serializer =>
      _$GeOrderHistorySchemaSerializer();
}

class _$GeOrderHistorySchemaSerializer
    implements PrimitiveSerializer<GeOrderHistorySchema> {
  @override
  final Iterable<Type> types = const [
    GeOrderHistorySchema,
    _$GeOrderHistorySchema
  ];

  @override
  final String wireName = r'GeOrderHistorySchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeOrderHistorySchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'order_id';
    yield serializers.serialize(
      object.orderId,
      specifiedType: const FullType(String),
    );
    yield r'seller';
    yield serializers.serialize(
      object.seller,
      specifiedType: const FullType(String),
    );
    yield r'buyer';
    yield serializers.serialize(
      object.buyer,
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
    yield r'sold_at';
    yield serializers.serialize(
      object.soldAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GeOrderHistorySchema object, {
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
    required GeOrderHistorySchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'order_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderId = valueDes;
          break;
        case r'seller':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.seller = valueDes;
          break;
        case r'buyer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.buyer = valueDes;
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
        case r'sold_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.soldAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeOrderHistorySchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeOrderHistorySchemaBuilder();
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
