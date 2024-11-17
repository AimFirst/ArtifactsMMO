//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recycling_schema.g.dart';

/// RecyclingSchema
///
/// Properties:
/// * [code] - Item code.
/// * [quantity] - Quantity of items to recycle.
@BuiltValue()
abstract class RecyclingSchema
    implements Built<RecyclingSchema, RecyclingSchemaBuilder> {
  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Quantity of items to recycle.
  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  RecyclingSchema._();

  factory RecyclingSchema([void updates(RecyclingSchemaBuilder b)]) =
      _$RecyclingSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecyclingSchemaBuilder b) => b..quantity = 1;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecyclingSchema> get serializer =>
      _$RecyclingSchemaSerializer();
}

class _$RecyclingSchemaSerializer
    implements PrimitiveSerializer<RecyclingSchema> {
  @override
  final Iterable<Type> types = const [RecyclingSchema, _$RecyclingSchema];

  @override
  final String wireName = r'RecyclingSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecyclingSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RecyclingSchema object, {
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
    required RecyclingSchemaBuilder result,
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
  RecyclingSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecyclingSchemaBuilder();
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
