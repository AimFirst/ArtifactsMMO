//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/badge_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'badge_response_schema.g.dart';

/// BadgeResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class BadgeResponseSchema
    implements Built<BadgeResponseSchema, BadgeResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  BadgeSchema get data;

  BadgeResponseSchema._();

  factory BadgeResponseSchema([void updates(BadgeResponseSchemaBuilder b)]) =
      _$BadgeResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BadgeResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BadgeResponseSchema> get serializer =>
      _$BadgeResponseSchemaSerializer();
}

class _$BadgeResponseSchemaSerializer
    implements PrimitiveSerializer<BadgeResponseSchema> {
  @override
  final Iterable<Type> types = const [
    BadgeResponseSchema,
    _$BadgeResponseSchema
  ];

  @override
  final String wireName = r'BadgeResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BadgeResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BadgeSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BadgeResponseSchema object, {
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
    required BadgeResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BadgeSchema),
          ) as BadgeSchema;
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
  BadgeResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BadgeResponseSchemaBuilder();
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
