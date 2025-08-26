//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_confirm_schema.g.dart';

/// PasswordResetConfirmSchema
///
/// Properties:
/// * [token] - Password reset token.
/// * [newPassword] - Your new password.
@BuiltValue()
abstract class PasswordResetConfirmSchema
    implements
        Built<PasswordResetConfirmSchema, PasswordResetConfirmSchemaBuilder> {
  /// Password reset token.
  @BuiltValueField(wireName: r'token')
  String get token;

  /// Your new password.
  @BuiltValueField(wireName: r'new_password')
  String get newPassword;

  PasswordResetConfirmSchema._();

  factory PasswordResetConfirmSchema(
          [void updates(PasswordResetConfirmSchemaBuilder b)]) =
      _$PasswordResetConfirmSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetConfirmSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetConfirmSchema> get serializer =>
      _$PasswordResetConfirmSchemaSerializer();
}

class _$PasswordResetConfirmSchemaSerializer
    implements PrimitiveSerializer<PasswordResetConfirmSchema> {
  @override
  final Iterable<Type> types = const [
    PasswordResetConfirmSchema,
    _$PasswordResetConfirmSchema
  ];

  @override
  final String wireName = r'PasswordResetConfirmSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetConfirmSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
    yield r'new_password';
    yield serializers.serialize(
      object.newPassword,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasswordResetConfirmSchema object, {
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
    required PasswordResetConfirmSchemaBuilder result,
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
        case r'new_password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasswordResetConfirmSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetConfirmSchemaBuilder();
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
