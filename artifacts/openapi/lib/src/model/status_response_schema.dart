//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/status_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'status_response_schema.g.dart';

/// StatusResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class StatusResponseSchema
    implements Built<StatusResponseSchema, StatusResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  StatusSchema get data;

  StatusResponseSchema._();

  factory StatusResponseSchema([void updates(StatusResponseSchemaBuilder b)]) =
      _$StatusResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StatusResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusResponseSchema> get serializer =>
      _$StatusResponseSchemaSerializer();
}

class _$StatusResponseSchemaSerializer
    implements PrimitiveSerializer<StatusResponseSchema> {
  @override
  final Iterable<Type> types = const [
    StatusResponseSchema,
    _$StatusResponseSchema
  ];

  @override
  final String wireName = r'StatusResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StatusResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(StatusSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StatusResponseSchema object, {
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
    required StatusResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StatusSchema),
          ) as StatusSchema;
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
  StatusResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusResponseSchemaBuilder();
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
