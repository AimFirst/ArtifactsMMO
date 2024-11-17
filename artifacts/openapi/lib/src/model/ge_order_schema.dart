//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_order_schema.g.dart';

/// GEOrderSchema
///
/// Properties:
/// * [id] - Order id.
/// * [seller] - Seller account name.
/// * [code] - Item code.
/// * [quantity] - Item quantity.
/// * [price] - Item price per unit.
/// * [createdAt] - Order created at.
@BuiltValue()
abstract class GEOrderSchema
    implements Built<GEOrderSchema, GEOrderSchemaBuilder> {
  /// Order id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Seller account name.
  @BuiltValueField(wireName: r'seller')
  String get seller;

  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Item price per unit.
  @BuiltValueField(wireName: r'price')
  int get price;

  /// Order created at.
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  GEOrderSchema._();

  factory GEOrderSchema([void updates(GEOrderSchemaBuilder b)]) =
      _$GEOrderSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GEOrderSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GEOrderSchema> get serializer =>
      _$GEOrderSchemaSerializer();
}

class _$GEOrderSchemaSerializer implements PrimitiveSerializer<GEOrderSchema> {
  @override
  final Iterable<Type> types = const [GEOrderSchema, _$GEOrderSchema];

  @override
  final String wireName = r'GEOrderSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GEOrderSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'seller';
    yield serializers.serialize(
      object.seller,
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
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GEOrderSchema object, {
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
    required GEOrderSchemaBuilder result,
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
        case r'seller':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.seller = valueDes;
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
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GEOrderSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GEOrderSchemaBuilder();
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
