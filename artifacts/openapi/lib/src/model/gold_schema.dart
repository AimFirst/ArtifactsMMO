//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'gold_schema.g.dart';

/// GoldSchema
///
/// Properties:
/// * [quantity] - Quantity of gold.
@BuiltValue()
abstract class GoldSchema implements Built<GoldSchema, GoldSchemaBuilder> {
  /// Quantity of gold.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  GoldSchema._();

  factory GoldSchema([void updates(GoldSchemaBuilder b)]) = _$GoldSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GoldSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GoldSchema> get serializer => _$GoldSchemaSerializer();
}

class _$GoldSchemaSerializer implements PrimitiveSerializer<GoldSchema> {
  @override
  final Iterable<Type> types = const [GoldSchema, _$GoldSchema];

  @override
  final String wireName = r'GoldSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GoldSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GoldSchema object, {
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
    required GoldSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  GoldSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GoldSchemaBuilder();
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
