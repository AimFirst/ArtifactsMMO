//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'achievement_rewards_schema.g.dart';

/// AchievementRewardsSchema
///
/// Properties:
/// * [gold] - Gold rewards.
@BuiltValue()
abstract class AchievementRewardsSchema
    implements
        Built<AchievementRewardsSchema, AchievementRewardsSchemaBuilder> {
  /// Gold rewards.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  AchievementRewardsSchema._();

  factory AchievementRewardsSchema(
          [void updates(AchievementRewardsSchemaBuilder b)]) =
      _$AchievementRewardsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AchievementRewardsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AchievementRewardsSchema> get serializer =>
      _$AchievementRewardsSchemaSerializer();
}

class _$AchievementRewardsSchemaSerializer
    implements PrimitiveSerializer<AchievementRewardsSchema> {
  @override
  final Iterable<Type> types = const [
    AchievementRewardsSchema,
    _$AchievementRewardsSchema
  ];

  @override
  final String wireName = r'AchievementRewardsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AchievementRewardsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'gold';
    yield serializers.serialize(
      object.gold,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AchievementRewardsSchema object, {
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
    required AchievementRewardsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'gold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gold = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AchievementRewardsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AchievementRewardsSchemaBuilder();
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
