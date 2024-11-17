//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/use_item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'use_item_response_schema.g.dart';

/// UseItemResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class UseItemResponseSchema
    implements Built<UseItemResponseSchema, UseItemResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  UseItemSchema get data;

  UseItemResponseSchema._();

  factory UseItemResponseSchema(
      [void updates(UseItemResponseSchemaBuilder b)]) = _$UseItemResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UseItemResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UseItemResponseSchema> get serializer =>
      _$UseItemResponseSchemaSerializer();
}

class _$UseItemResponseSchemaSerializer
    implements PrimitiveSerializer<UseItemResponseSchema> {
  @override
  final Iterable<Type> types = const [
    UseItemResponseSchema,
    _$UseItemResponseSchema
  ];

  @override
  final String wireName = r'UseItemResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UseItemResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(UseItemSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UseItemResponseSchema object, {
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
    required UseItemResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UseItemSchema),
          ) as UseItemSchema;
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
  UseItemResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UseItemResponseSchemaBuilder();
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
