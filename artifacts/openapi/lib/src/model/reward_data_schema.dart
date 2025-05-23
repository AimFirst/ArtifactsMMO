//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/rewards_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reward_data_schema.g.dart';

/// RewardDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [rewards] - Reward details.
/// * [character] - Player details.
@BuiltValue()
abstract class RewardDataSchema
    implements Built<RewardDataSchema, RewardDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Reward details.
  @BuiltValueField(wireName: r'rewards')
  RewardsSchema get rewards;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  RewardDataSchema._();

  factory RewardDataSchema([void updates(RewardDataSchemaBuilder b)]) =
      _$RewardDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RewardDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RewardDataSchema> get serializer =>
      _$RewardDataSchemaSerializer();
}

class _$RewardDataSchemaSerializer
    implements PrimitiveSerializer<RewardDataSchema> {
  @override
  final Iterable<Type> types = const [RewardDataSchema, _$RewardDataSchema];

  @override
  final String wireName = r'RewardDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RewardDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'rewards';
    yield serializers.serialize(
      object.rewards,
      specifiedType: const FullType(RewardsSchema),
    );
    yield r'character';
    yield serializers.serialize(
      object.character,
      specifiedType: const FullType(CharacterSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RewardDataSchema object, {
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
    required RewardDataSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cooldown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CooldownSchema),
          ) as CooldownSchema;
          result.cooldown.replace(valueDes);
          break;
        case r'rewards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RewardsSchema),
          ) as RewardsSchema;
          result.rewards.replace(valueDes);
          break;
        case r'character':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterSchema),
          ) as CharacterSchema;
          result.character.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RewardDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RewardDataSchemaBuilder();
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
