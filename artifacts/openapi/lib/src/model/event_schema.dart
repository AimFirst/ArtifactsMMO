//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/event_map_schema.dart';
import 'package:artifacts_api/src/model/event_content_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_schema.g.dart';

/// EventSchema
///
/// Properties:
/// * [name] - Name of the event.
/// * [code] - Code of the event. This is the event's unique identifier (ID).
/// * [maps] - Map list of the event.
/// * [skin] - Map skin of the event.
/// * [duration] - Duration in minutes.
/// * [rate] - Rate spawn of the event. (1/rate every minute)
/// * [content] - Content of the event.
@BuiltValue()
abstract class EventSchema implements Built<EventSchema, EventSchemaBuilder> {
  /// Name of the event.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Code of the event. This is the event's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Map list of the event.
  @BuiltValueField(wireName: r'maps')
  BuiltList<EventMapSchema> get maps;

  /// Map skin of the event.
  @BuiltValueField(wireName: r'skin')
  String get skin;

  /// Duration in minutes.
  @BuiltValueField(wireName: r'duration')
  int get duration;

  /// Rate spawn of the event. (1/rate every minute)
  @BuiltValueField(wireName: r'rate')
  int get rate;

  /// Content of the event.
  @BuiltValueField(wireName: r'content')
  EventContentSchema get content;

  EventSchema._();

  factory EventSchema([void updates(EventSchemaBuilder b)]) = _$EventSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventSchema> get serializer => _$EventSchemaSerializer();
}

class _$EventSchemaSerializer implements PrimitiveSerializer<EventSchema> {
  @override
  final Iterable<Type> types = const [EventSchema, _$EventSchema];

  @override
  final String wireName = r'EventSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'maps';
    yield serializers.serialize(
      object.maps,
      specifiedType: const FullType(BuiltList, [FullType(EventMapSchema)]),
    );
    yield r'skin';
    yield serializers.serialize(
      object.skin,
      specifiedType: const FullType(String),
    );
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(int),
    );
    yield r'rate';
    yield serializers.serialize(
      object.rate,
      specifiedType: const FullType(int),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(EventContentSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventSchema object, {
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
    required EventSchemaBuilder result,
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
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'maps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(EventMapSchema)]),
          ) as BuiltList<EventMapSchema>;
          result.maps.replace(valueDes);
          break;
        case r'skin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skin = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.duration = valueDes;
          break;
        case r'rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rate = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EventContentSchema),
          ) as EventContentSchema;
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
  EventSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventSchemaBuilder();
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
