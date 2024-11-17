//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_response_schema.g.dart';

/// TokenResponseSchema
///
/// Properties:
/// * [token]
@BuiltValue()
abstract class TokenResponseSchema
    implements Built<TokenResponseSchema, TokenResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  TokenResponseSchema._();

  factory TokenResponseSchema([void updates(TokenResponseSchemaBuilder b)]) =
      _$TokenResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TokenResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TokenResponseSchema> get serializer =>
      _$TokenResponseSchemaSerializer();
}

class _$TokenResponseSchemaSerializer
    implements PrimitiveSerializer<TokenResponseSchema> {
  @override
  final Iterable<Type> types = const [
    TokenResponseSchema,
    _$TokenResponseSchema
  ];

  @override
  final String wireName = r'TokenResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TokenResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TokenResponseSchema object, {
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
    required TokenResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TokenResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TokenResponseSchemaBuilder();
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
