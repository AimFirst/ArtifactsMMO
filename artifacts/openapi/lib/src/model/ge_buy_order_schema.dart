//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_buy_order_schema.g.dart';

/// GEBuyOrderSchema
///
/// Properties:
/// * [id] - Order id.
/// * [quantity] - Item quantity.
@BuiltValue()
abstract class GEBuyOrderSchema
    implements Built<GEBuyOrderSchema, GEBuyOrderSchemaBuilder> {
  /// Order id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  GEBuyOrderSchema._();

  factory GEBuyOrderSchema([void updates(GEBuyOrderSchemaBuilder b)]) =
      _$GEBuyOrderSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GEBuyOrderSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GEBuyOrderSchema> get serializer =>
      _$GEBuyOrderSchemaSerializer();
}

class _$GEBuyOrderSchemaSerializer
    implements PrimitiveSerializer<GEBuyOrderSchema> {
  @override
  final Iterable<Type> types = const [GEBuyOrderSchema, _$GEBuyOrderSchema];

  @override
  final String wireName = r'GEBuyOrderSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GEBuyOrderSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GEBuyOrderSchema object, {
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
    required GEBuyOrderSchemaBuilder result,
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
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.quantity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GEBuyOrderSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GEBuyOrderSchemaBuilder();
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
