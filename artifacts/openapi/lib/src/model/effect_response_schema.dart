//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/effect_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'effect_response_schema.g.dart';

/// EffectResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class EffectResponseSchema
    implements Built<EffectResponseSchema, EffectResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  EffectSchema get data;

  EffectResponseSchema._();

  factory EffectResponseSchema([void updates(EffectResponseSchemaBuilder b)]) =
      _$EffectResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EffectResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EffectResponseSchema> get serializer =>
      _$EffectResponseSchemaSerializer();
}

class _$EffectResponseSchemaSerializer
    implements PrimitiveSerializer<EffectResponseSchema> {
  @override
  final Iterable<Type> types = const [
    EffectResponseSchema,
    _$EffectResponseSchema
  ];

  @override
  final String wireName = r'EffectResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EffectResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(EffectSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EffectResponseSchema object, {
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
    required EffectResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EffectSchema),
          ) as EffectSchema;
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
  EffectResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EffectResponseSchemaBuilder();
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
