//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_account_schema.g.dart';

/// AddAccountSchema
///
/// Properties:
/// * [username] - Your desired username.
/// * [password] - Your password.
/// * [email]
@BuiltValue()
abstract class AddAccountSchema
    implements Built<AddAccountSchema, AddAccountSchemaBuilder> {
  /// Your desired username.
  @BuiltValueField(wireName: r'username')
  String get username;

  /// Your password.
  @BuiltValueField(wireName: r'password')
  String get password;

  @BuiltValueField(wireName: r'email')
  String? get email;

  AddAccountSchema._();

  factory AddAccountSchema([void updates(AddAccountSchemaBuilder b)]) =
      _$AddAccountSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddAccountSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddAccountSchema> get serializer =>
      _$AddAccountSchemaSerializer();
}

class _$AddAccountSchemaSerializer
    implements PrimitiveSerializer<AddAccountSchema> {
  @override
  final Iterable<Type> types = const [AddAccountSchema, _$AddAccountSchema];

  @override
  final String wireName = r'AddAccountSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddAccountSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddAccountSchema object, {
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
    required AddAccountSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
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
  AddAccountSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddAccountSchemaBuilder();
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
