//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/npc_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'npc_response_schema.g.dart';

/// NPCResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class NPCResponseSchema
    implements Built<NPCResponseSchema, NPCResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  NPCSchema get data;

  NPCResponseSchema._();

  factory NPCResponseSchema([void updates(NPCResponseSchemaBuilder b)]) =
      _$NPCResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NPCResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NPCResponseSchema> get serializer =>
      _$NPCResponseSchemaSerializer();
}

class _$NPCResponseSchemaSerializer
    implements PrimitiveSerializer<NPCResponseSchema> {
  @override
  final Iterable<Type> types = const [NPCResponseSchema, _$NPCResponseSchema];

  @override
  final String wireName = r'NPCResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NPCResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(NPCSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NPCResponseSchema object, {
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
    required NPCResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NPCSchema),
          ) as NPCSchema;
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
  NPCResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NPCResponseSchemaBuilder();
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
