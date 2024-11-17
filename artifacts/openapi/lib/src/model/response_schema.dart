//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_schema.g.dart';

/// ResponseSchema
///
/// Properties:
/// * [message]
@BuiltValue()
abstract class ResponseSchema
    implements Built<ResponseSchema, ResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'message')
  String get message;

  ResponseSchema._();

  factory ResponseSchema([void updates(ResponseSchemaBuilder b)]) =
      _$ResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResponseSchema> get serializer =>
      _$ResponseSchemaSerializer();
}

class _$ResponseSchemaSerializer
    implements PrimitiveSerializer<ResponseSchema> {
  @override
  final Iterable<Type> types = const [ResponseSchema, _$ResponseSchema];

  @override
  final String wireName = r'ResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ResponseSchema object, {
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
    required ResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResponseSchemaBuilder();
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
