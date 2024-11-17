//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_response_schema.g.dart';

/// ItemResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class ItemResponseSchema
    implements Built<ItemResponseSchema, ItemResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  ItemSchema get data;

  ItemResponseSchema._();

  factory ItemResponseSchema([void updates(ItemResponseSchemaBuilder b)]) =
      _$ItemResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemResponseSchema> get serializer =>
      _$ItemResponseSchemaSerializer();
}

class _$ItemResponseSchemaSerializer
    implements PrimitiveSerializer<ItemResponseSchema> {
  @override
  final Iterable<Type> types = const [ItemResponseSchema, _$ItemResponseSchema];

  @override
  final String wireName = r'ItemResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(ItemSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ItemResponseSchema object, {
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
    required ItemResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ItemSchema),
          ) as ItemSchema;
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
  ItemResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemResponseSchemaBuilder();
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
