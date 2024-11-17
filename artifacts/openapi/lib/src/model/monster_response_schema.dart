//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/monster_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'monster_response_schema.g.dart';

/// MonsterResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class MonsterResponseSchema
    implements Built<MonsterResponseSchema, MonsterResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  MonsterSchema get data;

  MonsterResponseSchema._();

  factory MonsterResponseSchema(
      [void updates(MonsterResponseSchemaBuilder b)]) = _$MonsterResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MonsterResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MonsterResponseSchema> get serializer =>
      _$MonsterResponseSchemaSerializer();
}

class _$MonsterResponseSchemaSerializer
    implements PrimitiveSerializer<MonsterResponseSchema> {
  @override
  final Iterable<Type> types = const [
    MonsterResponseSchema,
    _$MonsterResponseSchema
  ];

  @override
  final String wireName = r'MonsterResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MonsterResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(MonsterSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MonsterResponseSchema object, {
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
    required MonsterResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MonsterSchema),
          ) as MonsterSchema;
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
  MonsterResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MonsterResponseSchemaBuilder();
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
