//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/map_content_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'map_schema.g.dart';

/// MapSchema
///
/// Properties:
/// * [name] - Name of the map.
/// * [skin] - Skin of the map.
/// * [x] - Position X of the map.
/// * [y] - Position Y of the map.
/// * [content]
@BuiltValue()
abstract class MapSchema implements Built<MapSchema, MapSchemaBuilder> {
  /// Name of the map.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Skin of the map.
  @BuiltValueField(wireName: r'skin')
  String get skin;

  /// Position X of the map.
  @BuiltValueField(wireName: r'x')
  int get x;

  /// Position Y of the map.
  @BuiltValueField(wireName: r'y')
  int get y;

  @BuiltValueField(wireName: r'content')
  MapContentSchema? get content;

  MapSchema._();

  factory MapSchema([void updates(MapSchemaBuilder b)]) = _$MapSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MapSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MapSchema> get serializer => _$MapSchemaSerializer();
}

class _$MapSchemaSerializer implements PrimitiveSerializer<MapSchema> {
  @override
  final Iterable<Type> types = const [MapSchema, _$MapSchema];

  @override
  final String wireName = r'MapSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MapSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'skin';
    yield serializers.serialize(
      object.skin,
      specifiedType: const FullType(String),
    );
    yield r'x';
    yield serializers.serialize(
      object.x,
      specifiedType: const FullType(int),
    );
    yield r'y';
    yield serializers.serialize(
      object.y,
      specifiedType: const FullType(int),
    );
    yield r'content';
    yield object.content == null
        ? null
        : serializers.serialize(
            object.content,
            specifiedType: const FullType.nullable(MapContentSchema),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    MapSchema object, {
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
    required MapSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'skin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skin = valueDes;
          break;
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.y = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MapContentSchema),
          ) as MapContentSchema?;
          if (valueDes == null) continue;
          result.content.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MapSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MapSchemaBuilder();
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
