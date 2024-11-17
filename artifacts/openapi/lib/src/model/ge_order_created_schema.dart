//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_order_created_schema.g.dart';

/// GEOrderCreatedSchema
///
/// Properties:
/// * [id] - Order id.
/// * [createdAt] - Order created at.
/// * [code] - Item code.
/// * [quantity] - Item quantity.
/// * [price] - Item price per unit.
/// * [totalPrice] - Total price.
/// * [tax] - Order creation tax (5%, minimum 1)
@BuiltValue()
abstract class GEOrderCreatedSchema
    implements Built<GEOrderCreatedSchema, GEOrderCreatedSchemaBuilder> {
  /// Order id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Order created at.
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Item price per unit.
  @BuiltValueField(wireName: r'price')
  int get price;

  /// Total price.
  @BuiltValueField(wireName: r'total_price')
  int get totalPrice;

  /// Order creation tax (5%, minimum 1)
  @BuiltValueField(wireName: r'tax')
  int get tax;

  GEOrderCreatedSchema._();

  factory GEOrderCreatedSchema([void updates(GEOrderCreatedSchemaBuilder b)]) =
      _$GEOrderCreatedSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GEOrderCreatedSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GEOrderCreatedSchema> get serializer =>
      _$GEOrderCreatedSchemaSerializer();
}

class _$GEOrderCreatedSchemaSerializer
    implements PrimitiveSerializer<GEOrderCreatedSchema> {
  @override
  final Iterable<Type> types = const [
    GEOrderCreatedSchema,
    _$GEOrderCreatedSchema
  ];

  @override
  final String wireName = r'GEOrderCreatedSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GEOrderCreatedSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
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
    yield r'tax';
    yield serializers.serialize(
      object.tax,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GEOrderCreatedSchema object, {
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
    required GEOrderCreatedSchemaBuilder result,
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
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
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
        case r'tax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.tax = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GEOrderCreatedSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GEOrderCreatedSchemaBuilder();
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
