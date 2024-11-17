//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/my_account_details.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'my_account_details_schema.g.dart';

/// MyAccountDetailsSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class MyAccountDetailsSchema
    implements Built<MyAccountDetailsSchema, MyAccountDetailsSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  MyAccountDetails get data;

  MyAccountDetailsSchema._();

  factory MyAccountDetailsSchema(
          [void updates(MyAccountDetailsSchemaBuilder b)]) =
      _$MyAccountDetailsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MyAccountDetailsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MyAccountDetailsSchema> get serializer =>
      _$MyAccountDetailsSchemaSerializer();
}

class _$MyAccountDetailsSchemaSerializer
    implements PrimitiveSerializer<MyAccountDetailsSchema> {
  @override
  final Iterable<Type> types = const [
    MyAccountDetailsSchema,
    _$MyAccountDetailsSchema
  ];

  @override
  final String wireName = r'MyAccountDetailsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MyAccountDetailsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(MyAccountDetails),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MyAccountDetailsSchema object, {
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
    required MyAccountDetailsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MyAccountDetails),
          ) as MyAccountDetails;
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
  MyAccountDetailsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MyAccountDetailsSchemaBuilder();
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
