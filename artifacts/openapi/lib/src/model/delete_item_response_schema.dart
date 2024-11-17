//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/delete_item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_item_response_schema.g.dart';

/// DeleteItemResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class DeleteItemResponseSchema
    implements
        Built<DeleteItemResponseSchema, DeleteItemResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  DeleteItemSchema get data;

  DeleteItemResponseSchema._();

  factory DeleteItemResponseSchema(
          [void updates(DeleteItemResponseSchemaBuilder b)]) =
      _$DeleteItemResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteItemResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteItemResponseSchema> get serializer =>
      _$DeleteItemResponseSchemaSerializer();
}

class _$DeleteItemResponseSchemaSerializer
    implements PrimitiveSerializer<DeleteItemResponseSchema> {
  @override
  final Iterable<Type> types = const [
    DeleteItemResponseSchema,
    _$DeleteItemResponseSchema
  ];

  @override
  final String wireName = r'DeleteItemResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteItemResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(DeleteItemSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteItemResponseSchema object, {
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
    required DeleteItemResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeleteItemSchema),
          ) as DeleteItemSchema;
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
  DeleteItemResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteItemResponseSchemaBuilder();
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
