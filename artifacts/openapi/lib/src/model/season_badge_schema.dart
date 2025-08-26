//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'season_badge_schema.g.dart';

/// SeasonBadgeSchema
///
/// Properties:
/// * [code] - Badge code.
/// * [description] - Badge description.
/// * [requiredPoints] - Required achievement points to earn the badge.
@BuiltValue()
abstract class SeasonBadgeSchema
    implements Built<SeasonBadgeSchema, SeasonBadgeSchemaBuilder> {
  /// Badge code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Badge description.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Required achievement points to earn the badge.
  @BuiltValueField(wireName: r'required_points')
  int get requiredPoints;

  SeasonBadgeSchema._();

  factory SeasonBadgeSchema([void updates(SeasonBadgeSchemaBuilder b)]) =
      _$SeasonBadgeSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SeasonBadgeSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SeasonBadgeSchema> get serializer =>
      _$SeasonBadgeSchemaSerializer();
}

class _$SeasonBadgeSchemaSerializer
    implements PrimitiveSerializer<SeasonBadgeSchema> {
  @override
  final Iterable<Type> types = const [SeasonBadgeSchema, _$SeasonBadgeSchema];

  @override
  final String wireName = r'SeasonBadgeSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SeasonBadgeSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'required_points';
    yield serializers.serialize(
      object.requiredPoints,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SeasonBadgeSchema object, {
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
    required SeasonBadgeSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'required_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.requiredPoints = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SeasonBadgeSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SeasonBadgeSchemaBuilder();
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
