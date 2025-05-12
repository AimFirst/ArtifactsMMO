//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/map_content_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'map_content_schema.g.dart';

/// MapContentSchema
///
/// Properties:
/// * [type] - Type of the content.
/// * [code] - Code of the content.
@BuiltValue()
abstract class MapContentSchema
    implements Built<MapContentSchema, MapContentSchemaBuilder> {
  /// Type of the content.
  @BuiltValueField(wireName: r'type')
  MapContentType get type;
  // enum typeEnum {  monster,  resource,  workshop,  bank,  grand_exchange,  tasks_master,  npc,  };

  /// Code of the content.
  @BuiltValueField(wireName: r'code')
  String get code;

  MapContentSchema._();

  factory MapContentSchema([void updates(MapContentSchemaBuilder b)]) =
      _$MapContentSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MapContentSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MapContentSchema> get serializer =>
      _$MapContentSchemaSerializer();
}

class _$MapContentSchemaSerializer
    implements PrimitiveSerializer<MapContentSchema> {
  @override
  final Iterable<Type> types = const [MapContentSchema, _$MapContentSchema];

  @override
  final String wireName = r'MapContentSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MapContentSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(MapContentType),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MapContentSchema object, {
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
    required MapContentSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MapContentType),
          ) as MapContentType;
          result.type = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MapContentSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MapContentSchemaBuilder();
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
