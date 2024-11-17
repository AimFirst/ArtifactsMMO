//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/bank_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_response_schema.g.dart';

/// BankResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class BankResponseSchema
    implements Built<BankResponseSchema, BankResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  BankSchema get data;

  BankResponseSchema._();

  factory BankResponseSchema([void updates(BankResponseSchemaBuilder b)]) =
      _$BankResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankResponseSchema> get serializer =>
      _$BankResponseSchemaSerializer();
}

class _$BankResponseSchemaSerializer
    implements PrimitiveSerializer<BankResponseSchema> {
  @override
  final Iterable<Type> types = const [BankResponseSchema, _$BankResponseSchema];

  @override
  final String wireName = r'BankResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BankSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BankResponseSchema object, {
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
    required BankResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BankSchema),
          ) as BankSchema;
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
  BankResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankResponseSchemaBuilder();
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
