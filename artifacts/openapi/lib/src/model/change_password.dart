//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_password.g.dart';

/// ChangePassword
///
/// Properties:
/// * [currentPassword] - Your password.
/// * [newPassword] - New password.
@BuiltValue()
abstract class ChangePassword
    implements Built<ChangePassword, ChangePasswordBuilder> {
  /// Your password.
  @BuiltValueField(wireName: r'current_password')
  String get currentPassword;

  /// New password.
  @BuiltValueField(wireName: r'new_password')
  String get newPassword;

  ChangePassword._();

  factory ChangePassword([void updates(ChangePasswordBuilder b)]) =
      _$ChangePassword;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangePasswordBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangePassword> get serializer =>
      _$ChangePasswordSerializer();
}

class _$ChangePasswordSerializer
    implements PrimitiveSerializer<ChangePassword> {
  @override
  final Iterable<Type> types = const [ChangePassword, _$ChangePassword];

  @override
  final String wireName = r'ChangePassword';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangePassword object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'current_password';
    yield serializers.serialize(
      object.currentPassword,
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
    ChangePassword object, {
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
    required ChangePasswordBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'current_password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currentPassword = valueDes;
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
  ChangePassword deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangePasswordBuilder();
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
