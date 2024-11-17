//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_map_schema.g.dart';

/// EventMapSchema
///
/// Properties:
/// * [x] - Position X of the map.
/// * [y] - Position Y of the map.
@BuiltValue()
abstract class EventMapSchema
    implements Built<EventMapSchema, EventMapSchemaBuilder> {
  /// Position X of the map.
  @BuiltValueField(wireName: r'x')
  int get x;

  /// Position Y of the map.
  @BuiltValueField(wireName: r'y')
  int get y;

  EventMapSchema._();

  factory EventMapSchema([void updates(EventMapSchemaBuilder b)]) =
      _$EventMapSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventMapSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventMapSchema> get serializer =>
      _$EventMapSchemaSerializer();
}

class _$EventMapSchemaSerializer
    implements PrimitiveSerializer<EventMapSchema> {
  @override
  final Iterable<Type> types = const [EventMapSchema, _$EventMapSchema];

  @override
  final String wireName = r'EventMapSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventMapSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    EventMapSchema object, {
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
    required EventMapSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventMapSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventMapSchemaBuilder();
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
