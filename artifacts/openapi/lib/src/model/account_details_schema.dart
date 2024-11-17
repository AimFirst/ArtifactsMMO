//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/account_details.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_details_schema.g.dart';

/// AccountDetailsSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class AccountDetailsSchema
    implements Built<AccountDetailsSchema, AccountDetailsSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  AccountDetails get data;

  AccountDetailsSchema._();

  factory AccountDetailsSchema([void updates(AccountDetailsSchemaBuilder b)]) =
      _$AccountDetailsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountDetailsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountDetailsSchema> get serializer =>
      _$AccountDetailsSchemaSerializer();
}

class _$AccountDetailsSchemaSerializer
    implements PrimitiveSerializer<AccountDetailsSchema> {
  @override
  final Iterable<Type> types = const [
    AccountDetailsSchema,
    _$AccountDetailsSchema
  ];

  @override
  final String wireName = r'AccountDetailsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountDetailsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(AccountDetails),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountDetailsSchema object, {
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
    required AccountDetailsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccountDetails),
          ) as AccountDetails;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountDetailsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountDetailsSchemaBuilder();
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
