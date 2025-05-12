//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/achievement_rewards_schema.dart';
import 'package:artifacts_api/src/model/achievement_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'achievement_schema.g.dart';

/// AchievementSchema
///
/// Properties:
/// * [name] - Name of the achievement.
/// * [code] - Code of the achievement.
/// * [description] - Description of the achievement.
/// * [points] - Points of the achievement. Used for the leaderboard.
/// * [type] - Type of achievement.
/// * [target]
/// * [total] - Total to do.
/// * [rewards] - Rewards.
@BuiltValue()
abstract class AchievementSchema
    implements Built<AchievementSchema, AchievementSchemaBuilder> {
  /// Name of the achievement.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Code of the achievement.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Description of the achievement.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Points of the achievement. Used for the leaderboard.
  @BuiltValueField(wireName: r'points')
  int get points;

  /// Type of achievement.
  @BuiltValueField(wireName: r'type')
  AchievementType get type;
  // enum typeEnum {  combat_kill,  combat_drop,  combat_level,  gathering,  crafting,  recycling,  task,  other,  use,  };

  @BuiltValueField(wireName: r'target')
  String? get target;

  /// Total to do.
  @BuiltValueField(wireName: r'total')
  int get total;

  /// Rewards.
  @BuiltValueField(wireName: r'rewards')
  AchievementRewardsSchema get rewards;

  AchievementSchema._();

  factory AchievementSchema([void updates(AchievementSchemaBuilder b)]) =
      _$AchievementSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AchievementSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AchievementSchema> get serializer =>
      _$AchievementSchemaSerializer();
}

class _$AchievementSchemaSerializer
    implements PrimitiveSerializer<AchievementSchema> {
  @override
  final Iterable<Type> types = const [AchievementSchema, _$AchievementSchema];

  @override
  final String wireName = r'AchievementSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AchievementSchema object, {
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'points';
    yield serializers.serialize(
      object.points,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(AchievementType),
    );
    yield r'target';
    yield object.target == null
        ? null
        : serializers.serialize(
            object.target,
            specifiedType: const FullType.nullable(String),
          );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'rewards';
    yield serializers.serialize(
      object.rewards,
      specifiedType: const FullType(AchievementRewardsSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AchievementSchema object, {
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
    required AchievementSchemaBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.points = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AchievementType),
          ) as AchievementType;
          result.type = valueDes;
          break;
        case r'target':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.target = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'rewards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AchievementRewardsSchema),
          ) as AchievementRewardsSchema;
          result.rewards.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AchievementSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AchievementSchemaBuilder();
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
