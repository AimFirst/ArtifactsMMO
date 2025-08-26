//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_response_schema.g.dart';

/// PasswordResetResponseSchema
///
/// Properties:
/// * [message] - Success message.
@BuiltValue()
abstract class PasswordResetResponseSchema
    implements
        Built<PasswordResetResponseSchema, PasswordResetResponseSchemaBuilder> {
  /// Success message.
  @BuiltValueField(wireName: r'message')
  String get message;

  PasswordResetResponseSchema._();

  factory PasswordResetResponseSchema(
          [void updates(PasswordResetResponseSchemaBuilder b)]) =
      _$PasswordResetResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetResponseSchema> get serializer =>
      _$PasswordResetResponseSchemaSerializer();
}

class _$PasswordResetResponseSchemaSerializer
    implements PrimitiveSerializer<PasswordResetResponseSchema> {
  @override
  final Iterable<Type> types = const [
    PasswordResetResponseSchema,
    _$PasswordResetResponseSchema
  ];

  @override
  final String wireName = r'PasswordResetResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetResponseSchema object, {
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
    PasswordResetResponseSchema object, {
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
    required PasswordResetResponseSchemaBuilder result,
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
  PasswordResetResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetResponseSchemaBuilder();
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
