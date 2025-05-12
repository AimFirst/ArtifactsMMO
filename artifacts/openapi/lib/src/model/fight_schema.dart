//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/blocked_hits_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/fight_result.dart';
import 'package:artifacts_api/src/model/drop_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'fight_schema.g.dart';

/// FightSchema
///
/// Properties:
/// * [xp] - The amount of xp gained from the fight.
/// * [gold] - The amount of gold gained from the fight.
/// * [drops] - The items dropped from the fight.
/// * [turns] - Numbers of the turns of the combat.
/// * [monsterBlockedHits] - The amount of blocked hits by the monster.
/// * [playerBlockedHits] - The amount of blocked hits by the player.
/// * [logs] - The fight logs.
/// * [result] - The result of the fight.
@BuiltValue()
abstract class FightSchema implements Built<FightSchema, FightSchemaBuilder> {
  /// The amount of xp gained from the fight.
  @BuiltValueField(wireName: r'xp')
  int get xp;

  /// The amount of gold gained from the fight.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  /// The items dropped from the fight.
  @BuiltValueField(wireName: r'drops')
  BuiltList<DropSchema> get drops;

  /// Numbers of the turns of the combat.
  @BuiltValueField(wireName: r'turns')
  int get turns;

  /// The amount of blocked hits by the monster.
  @BuiltValueField(wireName: r'monster_blocked_hits')
  BlockedHitsSchema get monsterBlockedHits;

  /// The amount of blocked hits by the player.
  @BuiltValueField(wireName: r'player_blocked_hits')
  BlockedHitsSchema get playerBlockedHits;

  /// The fight logs.
  @BuiltValueField(wireName: r'logs')
  BuiltList<String> get logs;

  /// The result of the fight.
  @BuiltValueField(wireName: r'result')
  FightResult get result;
  // enum resultEnum {  win,  loss,  };

  FightSchema._();

  factory FightSchema([void updates(FightSchemaBuilder b)]) = _$FightSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FightSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FightSchema> get serializer => _$FightSchemaSerializer();
}

class _$FightSchemaSerializer implements PrimitiveSerializer<FightSchema> {
  @override
  final Iterable<Type> types = const [FightSchema, _$FightSchema];

  @override
  final String wireName = r'FightSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FightSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'xp';
    yield serializers.serialize(
      object.xp,
      specifiedType: const FullType(int),
    );
    yield r'gold';
    yield serializers.serialize(
      object.gold,
      specifiedType: const FullType(int),
    );
    yield r'drops';
    yield serializers.serialize(
      object.drops,
      specifiedType: const FullType(BuiltList, [FullType(DropSchema)]),
    );
    yield r'turns';
    yield serializers.serialize(
      object.turns,
      specifiedType: const FullType(int),
    );
    yield r'monster_blocked_hits';
    yield serializers.serialize(
      object.monsterBlockedHits,
      specifiedType: const FullType(BlockedHitsSchema),
    );
    yield r'player_blocked_hits';
    yield serializers.serialize(
      object.playerBlockedHits,
      specifiedType: const FullType(BlockedHitsSchema),
    );
    yield r'logs';
    yield serializers.serialize(
      object.logs,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'result';
    yield serializers.serialize(
      object.result,
      specifiedType: const FullType(FightResult),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FightSchema object, {
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
    required FightSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.xp = valueDes;
          break;
        case r'gold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gold = valueDes;
          break;
        case r'drops':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DropSchema)]),
          ) as BuiltList<DropSchema>;
          result.drops.replace(valueDes);
          break;
        case r'turns':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.turns = valueDes;
          break;
        case r'monster_blocked_hits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BlockedHitsSchema),
          ) as BlockedHitsSchema;
          result.monsterBlockedHits.replace(valueDes);
          break;
        case r'player_blocked_hits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BlockedHitsSchema),
          ) as BlockedHitsSchema;
          result.playerBlockedHits.replace(valueDes);
          break;
        case r'logs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.logs.replace(valueDes);
          break;
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FightResult),
          ) as FightResult;
          result.result = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FightSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FightSchemaBuilder();
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
