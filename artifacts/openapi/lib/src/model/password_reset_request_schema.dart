//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_request_schema.g.dart';

/// PasswordResetRequestSchema
///
/// Properties:
/// * [email] - Your email address.
@BuiltValue()
abstract class PasswordResetRequestSchema
    implements
        Built<PasswordResetRequestSchema, PasswordResetRequestSchemaBuilder> {
  /// Your email address.
  @BuiltValueField(wireName: r'email')
  String get email;

  PasswordResetRequestSchema._();

  factory PasswordResetRequestSchema(
          [void updates(PasswordResetRequestSchemaBuilder b)]) =
      _$PasswordResetRequestSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetRequestSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetRequestSchema> get serializer =>
      _$PasswordResetRequestSchemaSerializer();
}

class _$PasswordResetRequestSchemaSerializer
    implements PrimitiveSerializer<PasswordResetRequestSchema> {
  @override
  final Iterable<Type> types = const [
    PasswordResetRequestSchema,
    _$PasswordResetRequestSchema
  ];

  @override
  final String wireName = r'PasswordResetRequestSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetRequestSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasswordResetRequestSchema object, {
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
    required PasswordResetRequestSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasswordResetRequestSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetRequestSchemaBuilder();
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
