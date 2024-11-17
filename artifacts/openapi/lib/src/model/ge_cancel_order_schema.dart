//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_cancel_order_schema.g.dart';

/// GECancelOrderSchema
///
/// Properties:
/// * [id] - Order id.
@BuiltValue()
abstract class GECancelOrderSchema
    implements Built<GECancelOrderSchema, GECancelOrderSchemaBuilder> {
  /// Order id.
  @BuiltValueField(wireName: r'id')
  String get id;

  GECancelOrderSchema._();

  factory GECancelOrderSchema([void updates(GECancelOrderSchemaBuilder b)]) =
      _$GECancelOrderSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GECancelOrderSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GECancelOrderSchema> get serializer =>
      _$GECancelOrderSchemaSerializer();
}

class _$GECancelOrderSchemaSerializer
    implements PrimitiveSerializer<GECancelOrderSchema> {
  @override
  final Iterable<Type> types = const [
    GECancelOrderSchema,
    _$GECancelOrderSchema
  ];

  @override
  final String wireName = r'GECancelOrderSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GECancelOrderSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GECancelOrderSchema object, {
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
    required GECancelOrderSchemaBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GECancelOrderSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GECancelOrderSchemaBuilder();
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
