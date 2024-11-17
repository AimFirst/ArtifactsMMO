//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/recycling_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recycling_response_schema.g.dart';

/// RecyclingResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class RecyclingResponseSchema
    implements Built<RecyclingResponseSchema, RecyclingResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  RecyclingDataSchema get data;

  RecyclingResponseSchema._();

  factory RecyclingResponseSchema(
          [void updates(RecyclingResponseSchemaBuilder b)]) =
      _$RecyclingResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecyclingResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecyclingResponseSchema> get serializer =>
      _$RecyclingResponseSchemaSerializer();
}

class _$RecyclingResponseSchemaSerializer
    implements PrimitiveSerializer<RecyclingResponseSchema> {
  @override
  final Iterable<Type> types = const [
    RecyclingResponseSchema,
    _$RecyclingResponseSchema
  ];

  @override
  final String wireName = r'RecyclingResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecyclingResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(RecyclingDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RecyclingResponseSchema object, {
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
    required RecyclingResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RecyclingDataSchema),
          ) as RecyclingDataSchema;
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
  RecyclingResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecyclingResponseSchemaBuilder();
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
