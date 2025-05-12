//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/map_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'active_event_schema.g.dart';

/// ActiveEventSchema
///
/// Properties:
/// * [name] - Name of the event.
/// * [code] - Code of the event.
/// * [map] - Map of the event.
/// * [previousSkin] - Previous map skin.
/// * [duration] - Duration in minutes.
/// * [expiration] - Expiration datetime.
/// * [createdAt] - Start datetime.
@BuiltValue()
abstract class ActiveEventSchema
    implements Built<ActiveEventSchema, ActiveEventSchemaBuilder> {
  /// Name of the event.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Code of the event.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Map of the event.
  @BuiltValueField(wireName: r'map')
  MapSchema get map;

  /// Previous map skin.
  @BuiltValueField(wireName: r'previous_skin')
  String get previousSkin;

  /// Duration in minutes.
  @BuiltValueField(wireName: r'duration')
  int get duration;

  /// Expiration datetime.
  @BuiltValueField(wireName: r'expiration')
  DateTime get expiration;

  /// Start datetime.
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  ActiveEventSchema._();

  factory ActiveEventSchema([void updates(ActiveEventSchemaBuilder b)]) =
      _$ActiveEventSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ActiveEventSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ActiveEventSchema> get serializer =>
      _$ActiveEventSchemaSerializer();
}

class _$ActiveEventSchemaSerializer
    implements PrimitiveSerializer<ActiveEventSchema> {
  @override
  final Iterable<Type> types = const [ActiveEventSchema, _$ActiveEventSchema];

  @override
  final String wireName = r'ActiveEventSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ActiveEventSchema object, {
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
    yield r'map';
    yield serializers.serialize(
      object.map,
      specifiedType: const FullType(MapSchema),
    );
    yield r'previous_skin';
    yield serializers.serialize(
      object.previousSkin,
      specifiedType: const FullType(String),
    );
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(int),
    );
    yield r'expiration';
    yield serializers.serialize(
      object.expiration,
      specifiedType: const FullType(DateTime),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ActiveEventSchema object, {
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
    required ActiveEventSchemaBuilder result,
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
        case r'map':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MapSchema),
          ) as MapSchema;
          result.map.replace(valueDes);
          break;
        case r'previous_skin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.previousSkin = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.duration = valueDes;
          break;
        case r'expiration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiration = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ActiveEventSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ActiveEventSchemaBuilder();
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
