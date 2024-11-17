//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/resource_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'resource_response_schema.g.dart';

/// ResourceResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class ResourceResponseSchema
    implements Built<ResourceResponseSchema, ResourceResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  ResourceSchema get data;

  ResourceResponseSchema._();

  factory ResourceResponseSchema(
          [void updates(ResourceResponseSchemaBuilder b)]) =
      _$ResourceResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResourceResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResourceResponseSchema> get serializer =>
      _$ResourceResponseSchemaSerializer();
}

class _$ResourceResponseSchemaSerializer
    implements PrimitiveSerializer<ResourceResponseSchema> {
  @override
  final Iterable<Type> types = const [
    ResourceResponseSchema,
    _$ResourceResponseSchema
  ];

  @override
  final String wireName = r'ResourceResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResourceResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(ResourceSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ResourceResponseSchema object, {
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
    required ResourceResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ResourceSchema),
          ) as ResourceSchema;
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
  ResourceResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResourceResponseSchemaBuilder();
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
