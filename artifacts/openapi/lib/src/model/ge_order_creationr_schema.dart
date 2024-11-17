//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_order_creationr_schema.g.dart';

/// GEOrderCreationrSchema
///
/// Properties:
/// * [code] - Item code.
/// * [quantity] - Item quantity.
/// * [price] - Item price per unit.
@BuiltValue()
abstract class GEOrderCreationrSchema
    implements Built<GEOrderCreationrSchema, GEOrderCreationrSchemaBuilder> {
  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Item price per unit.
  @BuiltValueField(wireName: r'price')
  int get price;

  GEOrderCreationrSchema._();

  factory GEOrderCreationrSchema(
          [void updates(GEOrderCreationrSchemaBuilder b)]) =
      _$GEOrderCreationrSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GEOrderCreationrSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GEOrderCreationrSchema> get serializer =>
      _$GEOrderCreationrSchemaSerializer();
}

class _$GEOrderCreationrSchemaSerializer
    implements PrimitiveSerializer<GEOrderCreationrSchema> {
  @override
  final Iterable<Type> types = const [
    GEOrderCreationrSchema,
    _$GEOrderCreationrSchema
  ];

  @override
  final String wireName = r'GEOrderCreationrSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GEOrderCreationrSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    GEOrderCreationrSchema object, {
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
    required GEOrderCreationrSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GEOrderCreationrSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GEOrderCreationrSchemaBuilder();
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
