//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/announcement_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'status_schema.g.dart';

/// StatusSchema
///
/// Properties:
/// * [status] - Server status
/// * [version] - Game version.
/// * [maxLevel] - Maximum level.
/// * [charactersOnline] - Characters online.
/// * [serverTime] - Server time.
/// * [announcements] - Server announcements.
/// * [lastWipe] - Last server wipe.
/// * [nextWipe] - Next server wipe.
@BuiltValue()
abstract class StatusSchema
    implements Built<StatusSchema, StatusSchemaBuilder> {
  /// Server status
  @BuiltValueField(wireName: r'status')
  String get status;

  /// Game version.
  @BuiltValueField(wireName: r'version')
  String get version;

  /// Maximum level.
  @BuiltValueField(wireName: r'max_level')
  int get maxLevel;

  /// Characters online.
  @BuiltValueField(wireName: r'characters_online')
  int get charactersOnline;

  /// Server time.
  @BuiltValueField(wireName: r'server_time')
  DateTime get serverTime;

  /// Server announcements.
  @BuiltValueField(wireName: r'announcements')
  BuiltList<AnnouncementSchema> get announcements;

  /// Last server wipe.
  @BuiltValueField(wireName: r'last_wipe')
  String get lastWipe;

  /// Next server wipe.
  @BuiltValueField(wireName: r'next_wipe')
  String get nextWipe;

  StatusSchema._();

  factory StatusSchema([void updates(StatusSchemaBuilder b)]) = _$StatusSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StatusSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusSchema> get serializer => _$StatusSchemaSerializer();
}

class _$StatusSchemaSerializer implements PrimitiveSerializer<StatusSchema> {
  @override
  final Iterable<Type> types = const [StatusSchema, _$StatusSchema];

  @override
  final String wireName = r'StatusSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StatusSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    yield r'max_level';
    yield serializers.serialize(
      object.maxLevel,
      specifiedType: const FullType(int),
    );
    yield r'characters_online';
    yield serializers.serialize(
      object.charactersOnline,
      specifiedType: const FullType(int),
    );
    yield r'server_time';
    yield serializers.serialize(
      object.serverTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'announcements';
    yield serializers.serialize(
      object.announcements,
      specifiedType: const FullType(BuiltList, [FullType(AnnouncementSchema)]),
    );
    yield r'last_wipe';
    yield serializers.serialize(
      object.lastWipe,
      specifiedType: const FullType(String),
    );
    yield r'next_wipe';
    yield serializers.serialize(
      object.nextWipe,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StatusSchema object, {
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
    required StatusSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        case r'max_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxLevel = valueDes;
          break;
        case r'characters_online':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.charactersOnline = valueDes;
          break;
        case r'server_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.serverTime = valueDes;
          break;
        case r'announcements':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AnnouncementSchema)]),
          ) as BuiltList<AnnouncementSchema>;
          result.announcements.replace(valueDes);
          break;
        case r'last_wipe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastWipe = valueDes;
          break;
        case r'next_wipe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nextWipe = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StatusSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusSchemaBuilder();
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
