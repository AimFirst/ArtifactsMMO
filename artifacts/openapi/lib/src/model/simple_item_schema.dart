//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'simple_item_schema.g.dart';

/// SimpleItemSchema
///
/// Properties:
/// * [code] - Item code.
/// * [quantity] - Item quantity.
@BuiltValue()
abstract class SimpleItemSchema
    implements Built<SimpleItemSchema, SimpleItemSchemaBuilder> {
  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  SimpleItemSchema._();

  factory SimpleItemSchema([void updates(SimpleItemSchemaBuilder b)]) =
      _$SimpleItemSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SimpleItemSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SimpleItemSchema> get serializer =>
      _$SimpleItemSchemaSerializer();
}

class _$SimpleItemSchemaSerializer
    implements PrimitiveSerializer<SimpleItemSchema> {
  @override
  final Iterable<Type> types = const [SimpleItemSchema, _$SimpleItemSchema];

  @override
  final String wireName = r'SimpleItemSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SimpleItemSchema object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    SimpleItemSchema object, {
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
    required SimpleItemSchemaBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SimpleItemSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SimpleItemSchemaBuilder();
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
