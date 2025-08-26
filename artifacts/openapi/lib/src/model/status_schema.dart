//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/rate_limit_schema.dart';
import 'package:artifacts_api/src/model/announcement_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/season_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'status_schema.g.dart';

/// StatusSchema
///
/// Properties:
/// * [version] - Game version.
/// * [serverTime] - Server time.
/// * [maxLevel] - Maximum level.
/// * [maxSkillLevel] - Maximum skill level.
/// * [charactersOnline] - Characters online.
/// * [announcements] - Server announcements.
/// * [rateLimits] - Rate limits.
/// * [season] - Current season details.
@BuiltValue()
abstract class StatusSchema
    implements Built<StatusSchema, StatusSchemaBuilder> {
  /// Game version.
  @BuiltValueField(wireName: r'version')
  String get version;

  /// Server time.
  @BuiltValueField(wireName: r'server_time')
  DateTime get serverTime;

  /// Maximum level.
  @BuiltValueField(wireName: r'max_level')
  int get maxLevel;

  /// Maximum skill level.
  @BuiltValueField(wireName: r'max_skill_level')
  int get maxSkillLevel;

  /// Characters online.
  @BuiltValueField(wireName: r'characters_online')
  int get charactersOnline;

  /// Server announcements.
  @BuiltValueField(wireName: r'announcements')
  BuiltList<AnnouncementSchema> get announcements;

  /// Rate limits.
  @BuiltValueField(wireName: r'rate_limits')
  BuiltList<RateLimitSchema> get rateLimits;

  /// Current season details.
  @BuiltValueField(wireName: r'season')
  SeasonSchema? get season;

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
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    yield r'server_time';
    yield serializers.serialize(
      object.serverTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'max_level';
    yield serializers.serialize(
      object.maxLevel,
      specifiedType: const FullType(int),
    );
    yield r'max_skill_level';
    yield serializers.serialize(
      object.maxSkillLevel,
      specifiedType: const FullType(int),
    );
    yield r'characters_online';
    yield serializers.serialize(
      object.charactersOnline,
      specifiedType: const FullType(int),
    );
    yield r'announcements';
    yield serializers.serialize(
      object.announcements,
      specifiedType: const FullType(BuiltList, [FullType(AnnouncementSchema)]),
    );
    yield r'rate_limits';
    yield serializers.serialize(
      object.rateLimits,
      specifiedType: const FullType(BuiltList, [FullType(RateLimitSchema)]),
    );
    if (object.season != null) {
      yield r'season';
      yield serializers.serialize(
        object.season,
        specifiedType: const FullType(SeasonSchema),
      );
    }
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
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        case r'server_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.serverTime = valueDes;
          break;
        case r'max_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxLevel = valueDes;
          break;
        case r'max_skill_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxSkillLevel = valueDes;
          break;
        case r'characters_online':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.charactersOnline = valueDes;
          break;
        case r'announcements':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AnnouncementSchema)]),
          ) as BuiltList<AnnouncementSchema>;
          result.announcements.replace(valueDes);
          break;
        case r'rate_limits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(RateLimitSchema)]),
          ) as BuiltList<RateLimitSchema>;
          result.rateLimits.replace(valueDes);
          break;
        case r'season':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SeasonSchema),
          ) as SeasonSchema;
          result.season.replace(valueDes);
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
