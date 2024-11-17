//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_leaderboard_schema.g.dart';

/// CharacterLeaderboardSchema
///
/// Properties:
/// * [position] - Position in the leaderboard.
/// * [name] - Character name.
/// * [account] - Account name.
/// * [skin] - Character skin code.
/// * [level] - Combat level.
/// * [totalXp] - Total XP of your character.
/// * [miningLevel] - Mining level.
/// * [miningTotalXp] - Mining total xp.
/// * [woodcuttingLevel] - Woodcutting level.
/// * [woodcuttingTotalXp] - Woodcutting total xp.
/// * [fishingLevel] - Fishing level.
/// * [fishingTotalXp] - Fishing total xp.
/// * [weaponcraftingLevel] - Weaponcrafting level.
/// * [weaponcraftingTotalXp] - Weaponcrafting total xp.
/// * [gearcraftingLevel] - Gearcrafting level.
/// * [gearcraftingTotalXp] - Gearcrafting total xp.
/// * [jewelrycraftingLevel] - Jewelrycrafting level.
/// * [jewelrycraftingTotalXp] - Jewelrycrafting total xp.
/// * [cookingLevel] - Cooking level.
/// * [cookingTotalXp] - Cooking total xp.
/// * [alchemyLevel] - Alchemy level.
/// * [alchemyTotalXp] - Alchemy total xp.
/// * [gold] - The numbers of gold on this character.
@BuiltValue()
abstract class CharacterLeaderboardSchema
    implements
        Built<CharacterLeaderboardSchema, CharacterLeaderboardSchemaBuilder> {
  /// Position in the leaderboard.
  @BuiltValueField(wireName: r'position')
  int get position;

  /// Character name.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Account name.
  @BuiltValueField(wireName: r'account')
  String get account;

  /// Character skin code.
  @BuiltValueField(wireName: r'skin')
  String get skin;

  /// Combat level.
  @BuiltValueField(wireName: r'level')
  int get level;

  /// Total XP of your character.
  @BuiltValueField(wireName: r'total_xp')
  int get totalXp;

  /// Mining level.
  @BuiltValueField(wireName: r'mining_level')
  int get miningLevel;

  /// Mining total xp.
  @BuiltValueField(wireName: r'mining_total_xp')
  int get miningTotalXp;

  /// Woodcutting level.
  @BuiltValueField(wireName: r'woodcutting_level')
  int get woodcuttingLevel;

  /// Woodcutting total xp.
  @BuiltValueField(wireName: r'woodcutting_total_xp')
  int get woodcuttingTotalXp;

  /// Fishing level.
  @BuiltValueField(wireName: r'fishing_level')
  int get fishingLevel;

  /// Fishing total xp.
  @BuiltValueField(wireName: r'fishing_total_xp')
  int get fishingTotalXp;

  /// Weaponcrafting level.
  @BuiltValueField(wireName: r'weaponcrafting_level')
  int get weaponcraftingLevel;

  /// Weaponcrafting total xp.
  @BuiltValueField(wireName: r'weaponcrafting_total_xp')
  int get weaponcraftingTotalXp;

  /// Gearcrafting level.
  @BuiltValueField(wireName: r'gearcrafting_level')
  int get gearcraftingLevel;

  /// Gearcrafting total xp.
  @BuiltValueField(wireName: r'gearcrafting_total_xp')
  int get gearcraftingTotalXp;

  /// Jewelrycrafting level.
  @BuiltValueField(wireName: r'jewelrycrafting_level')
  int get jewelrycraftingLevel;

  /// Jewelrycrafting total xp.
  @BuiltValueField(wireName: r'jewelrycrafting_total_xp')
  int get jewelrycraftingTotalXp;

  /// Cooking level.
  @BuiltValueField(wireName: r'cooking_level')
  int get cookingLevel;

  /// Cooking total xp.
  @BuiltValueField(wireName: r'cooking_total_xp')
  int get cookingTotalXp;

  /// Alchemy level.
  @BuiltValueField(wireName: r'alchemy_level')
  int get alchemyLevel;

  /// Alchemy total xp.
  @BuiltValueField(wireName: r'alchemy_total_xp')
  int get alchemyTotalXp;

  /// The numbers of gold on this character.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  CharacterLeaderboardSchema._();

  factory CharacterLeaderboardSchema(
          [void updates(CharacterLeaderboardSchemaBuilder b)]) =
      _$CharacterLeaderboardSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterLeaderboardSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterLeaderboardSchema> get serializer =>
      _$CharacterLeaderboardSchemaSerializer();
}

class _$CharacterLeaderboardSchemaSerializer
    implements PrimitiveSerializer<CharacterLeaderboardSchema> {
  @override
  final Iterable<Type> types = const [
    CharacterLeaderboardSchema,
    _$CharacterLeaderboardSchema
  ];

  @override
  final String wireName = r'CharacterLeaderboardSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterLeaderboardSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'account';
    yield serializers.serialize(
      object.account,
      specifiedType: const FullType(String),
    );
    yield r'skin';
    yield serializers.serialize(
      object.skin,
      specifiedType: const FullType(String),
    );
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(int),
    );
    yield r'total_xp';
    yield serializers.serialize(
      object.totalXp,
      specifiedType: const FullType(int),
    );
    yield r'mining_level';
    yield serializers.serialize(
      object.miningLevel,
      specifiedType: const FullType(int),
    );
    yield r'mining_total_xp';
    yield serializers.serialize(
      object.miningTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'woodcutting_level';
    yield serializers.serialize(
      object.woodcuttingLevel,
      specifiedType: const FullType(int),
    );
    yield r'woodcutting_total_xp';
    yield serializers.serialize(
      object.woodcuttingTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'fishing_level';
    yield serializers.serialize(
      object.fishingLevel,
      specifiedType: const FullType(int),
    );
    yield r'fishing_total_xp';
    yield serializers.serialize(
      object.fishingTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'weaponcrafting_level';
    yield serializers.serialize(
      object.weaponcraftingLevel,
      specifiedType: const FullType(int),
    );
    yield r'weaponcrafting_total_xp';
    yield serializers.serialize(
      object.weaponcraftingTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'gearcrafting_level';
    yield serializers.serialize(
      object.gearcraftingLevel,
      specifiedType: const FullType(int),
    );
    yield r'gearcrafting_total_xp';
    yield serializers.serialize(
      object.gearcraftingTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'jewelrycrafting_level';
    yield serializers.serialize(
      object.jewelrycraftingLevel,
      specifiedType: const FullType(int),
    );
    yield r'jewelrycrafting_total_xp';
    yield serializers.serialize(
      object.jewelrycraftingTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'cooking_level';
    yield serializers.serialize(
      object.cookingLevel,
      specifiedType: const FullType(int),
    );
    yield r'cooking_total_xp';
    yield serializers.serialize(
      object.cookingTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'alchemy_level';
    yield serializers.serialize(
      object.alchemyLevel,
      specifiedType: const FullType(int),
    );
    yield r'alchemy_total_xp';
    yield serializers.serialize(
      object.alchemyTotalXp,
      specifiedType: const FullType(int),
    );
    yield r'gold';
    yield serializers.serialize(
      object.gold,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterLeaderboardSchema object, {
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
    required CharacterLeaderboardSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.position = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.account = valueDes;
          break;
        case r'skin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.skin = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalXp = valueDes;
          break;
        case r'mining_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.miningLevel = valueDes;
          break;
        case r'mining_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.miningTotalXp = valueDes;
          break;
        case r'woodcutting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.woodcuttingLevel = valueDes;
          break;
        case r'woodcutting_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.woodcuttingTotalXp = valueDes;
          break;
        case r'fishing_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fishingLevel = valueDes;
          break;
        case r'fishing_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fishingTotalXp = valueDes;
          break;
        case r'weaponcrafting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weaponcraftingLevel = valueDes;
          break;
        case r'weaponcrafting_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weaponcraftingTotalXp = valueDes;
          break;
        case r'gearcrafting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gearcraftingLevel = valueDes;
          break;
        case r'gearcrafting_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gearcraftingTotalXp = valueDes;
          break;
        case r'jewelrycrafting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.jewelrycraftingLevel = valueDes;
          break;
        case r'jewelrycrafting_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.jewelrycraftingTotalXp = valueDes;
          break;
        case r'cooking_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cookingLevel = valueDes;
          break;
        case r'cooking_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cookingTotalXp = valueDes;
          break;
        case r'alchemy_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.alchemyLevel = valueDes;
          break;
        case r'alchemy_total_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.alchemyTotalXp = valueDes;
          break;
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
  CharacterLeaderboardSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterLeaderboardSchemaBuilder();
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
