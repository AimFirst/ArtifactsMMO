//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/map_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'map_response_schema.g.dart';

/// MapResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class MapResponseSchema
    implements Built<MapResponseSchema, MapResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  MapSchema get data;

  MapResponseSchema._();

  factory MapResponseSchema([void updates(MapResponseSchemaBuilder b)]) =
      _$MapResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MapResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MapResponseSchema> get serializer =>
      _$MapResponseSchemaSerializer();
}

class _$MapResponseSchemaSerializer
    implements PrimitiveSerializer<MapResponseSchema> {
  @override
  final Iterable<Type> types = const [MapResponseSchema, _$MapResponseSchema];

  @override
  final String wireName = r'MapResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MapResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(MapSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MapResponseSchema object, {
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
    required MapResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MapSchema),
          ) as MapSchema;
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
  MapResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MapResponseSchemaBuilder();
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
