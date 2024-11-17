//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_content_schema.g.dart';

/// EventContentSchema
///
/// Properties:
/// * [type] - Type of the event.
/// * [code] - Code content.
@BuiltValue()
abstract class EventContentSchema
    implements Built<EventContentSchema, EventContentSchemaBuilder> {
  /// Type of the event.
  @BuiltValueField(wireName: r'type')
  String get type;

  /// Code content.
  @BuiltValueField(wireName: r'code')
  String get code;

  EventContentSchema._();

  factory EventContentSchema([void updates(EventContentSchemaBuilder b)]) =
      _$EventContentSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventContentSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventContentSchema> get serializer =>
      _$EventContentSchemaSerializer();
}

class _$EventContentSchemaSerializer
    implements PrimitiveSerializer<EventContentSchema> {
  @override
  final Iterable<Type> types = const [EventContentSchema, _$EventContentSchema];

  @override
  final String wireName = r'EventContentSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventContentSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
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
    EventContentSchema object, {
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
    required EventContentSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  EventContentSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventContentSchemaBuilder();
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
