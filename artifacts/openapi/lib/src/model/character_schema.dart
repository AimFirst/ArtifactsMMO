//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/inventory_slot.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/character_skin.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_schema.g.dart';

/// CharacterSchema
///
/// Properties:
/// * [name] - Name of the character.
/// * [account] - Account name.
/// * [skin] - Character skin code.
/// * [level] - Combat level.
/// * [xp] - The current xp level of the combat level.
/// * [maxXp] - XP required to level up the character.
/// * [gold] - The numbers of gold on this character.
/// * [speed] - *Not available, on the roadmap. Character movement speed.
/// * [miningLevel] - Mining level.
/// * [miningXp] - The current xp level of the Mining skill.
/// * [miningMaxXp] - Mining XP required to level up the skill.
/// * [woodcuttingLevel] - Woodcutting level.
/// * [woodcuttingXp] - The current xp level of the Woodcutting skill.
/// * [woodcuttingMaxXp] - Woodcutting XP required to level up the skill.
/// * [fishingLevel] - Fishing level.
/// * [fishingXp] - The current xp level of the Fishing skill.
/// * [fishingMaxXp] - Fishing XP required to level up the skill.
/// * [weaponcraftingLevel] - Weaponcrafting level.
/// * [weaponcraftingXp] - The current xp level of the Weaponcrafting skill.
/// * [weaponcraftingMaxXp] - Weaponcrafting XP required to level up the skill.
/// * [gearcraftingLevel] - Gearcrafting level.
/// * [gearcraftingXp] - The current xp level of the Gearcrafting skill.
/// * [gearcraftingMaxXp] - Gearcrafting XP required to level up the skill.
/// * [jewelrycraftingLevel] - Jewelrycrafting level.
/// * [jewelrycraftingXp] - The current xp level of the Jewelrycrafting skill.
/// * [jewelrycraftingMaxXp] - Jewelrycrafting XP required to level up the skill.
/// * [cookingLevel] - The current xp level of the Cooking skill.
/// * [cookingXp] - Cooking XP.
/// * [cookingMaxXp] - Cooking XP required to level up the skill.
/// * [alchemyLevel] - Alchemy level.
/// * [alchemyXp] - Alchemy XP.
/// * [alchemyMaxXp] - Alchemy XP required to level up the skill.
/// * [hp] - Character actual HP.
/// * [maxHp] - Character max HP.
/// * [haste] - *Character Haste. Increase speed attack (reduce fight cooldown)
/// * [criticalStrike] - *Not available, on the roadmap. Character Critical   Strike. Critical strikes increase the attack's damage.
/// * [stamina] - *Not available, on the roadmap. Regenerates life at the start of each turn.
/// * [attackFire] - Fire attack.
/// * [attackEarth] - Earth attack.
/// * [attackWater] - Water attack.
/// * [attackAir] - Air attack.
/// * [dmgFire] - % Fire damage.
/// * [dmgEarth] - % Earth damage.
/// * [dmgWater] - % Water damage.
/// * [dmgAir] - % Air damage.
/// * [resFire] - % Fire resistance.
/// * [resEarth] - % Earth resistance.
/// * [resWater] - % Water resistance.
/// * [resAir] - % Air resistance.
/// * [x] - Character x coordinate.
/// * [y] - Character y coordinate.
/// * [cooldown] - Cooldown in seconds.
/// * [weaponSlot] - Weapon slot.
/// * [shieldSlot] - Shield slot.
/// * [helmetSlot] - Helmet slot.
/// * [bodyArmorSlot] - Body armor slot.
/// * [legArmorSlot] - Leg armor slot.
/// * [bootsSlot] - Boots slot.
/// * [ring1Slot] - Ring 1 slot.
/// * [ring2Slot] - Ring 2 slot.
/// * [amuletSlot] - Amulet slot.
/// * [artifact1Slot] - Artifact 1 slot.
/// * [artifact2Slot] - Artifact 2 slot.
/// * [artifact3Slot] - Artifact 3 slot.
/// * [utility1Slot] - Utility 1 slot.
/// * [utility1SlotQuantity] - Utility 1 quantity.
/// * [utility2Slot] - Utility 2 slot.
/// * [utility2SlotQuantity] - Utility 2 quantity.
/// * [task] - Task in progress.
/// * [taskType] - Task type.
/// * [taskProgress] - Task progression.
/// * [taskTotal] - Task total objective.
/// * [inventoryMaxItems] - Inventory max items.
/// * [cooldownExpiration] - Datetime Cooldown expiration.
/// * [inventory] - List of inventory slots.
@BuiltValue()
abstract class CharacterSchema
    implements Built<CharacterSchema, CharacterSchemaBuilder> {
  /// Name of the character.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Account name.
  @BuiltValueField(wireName: r'account')
  String get account;

  /// Character skin code.
  @BuiltValueField(wireName: r'skin')
  CharacterSkin get skin;
  // enum skinEnum {  men1,  men2,  men3,  women1,  women2,  women3,  };

  /// Combat level.
  @BuiltValueField(wireName: r'level')
  int get level;

  /// The current xp level of the combat level.
  @BuiltValueField(wireName: r'xp')
  int get xp;

  /// XP required to level up the character.
  @BuiltValueField(wireName: r'max_xp')
  int get maxXp;

  /// The numbers of gold on this character.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  /// *Not available, on the roadmap. Character movement speed.
  @BuiltValueField(wireName: r'speed')
  int get speed;

  /// Mining level.
  @BuiltValueField(wireName: r'mining_level')
  int get miningLevel;

  /// The current xp level of the Mining skill.
  @BuiltValueField(wireName: r'mining_xp')
  int get miningXp;

  /// Mining XP required to level up the skill.
  @BuiltValueField(wireName: r'mining_max_xp')
  int get miningMaxXp;

  /// Woodcutting level.
  @BuiltValueField(wireName: r'woodcutting_level')
  int get woodcuttingLevel;

  /// The current xp level of the Woodcutting skill.
  @BuiltValueField(wireName: r'woodcutting_xp')
  int get woodcuttingXp;

  /// Woodcutting XP required to level up the skill.
  @BuiltValueField(wireName: r'woodcutting_max_xp')
  int get woodcuttingMaxXp;

  /// Fishing level.
  @BuiltValueField(wireName: r'fishing_level')
  int get fishingLevel;

  /// The current xp level of the Fishing skill.
  @BuiltValueField(wireName: r'fishing_xp')
  int get fishingXp;

  /// Fishing XP required to level up the skill.
  @BuiltValueField(wireName: r'fishing_max_xp')
  int get fishingMaxXp;

  /// Weaponcrafting level.
  @BuiltValueField(wireName: r'weaponcrafting_level')
  int get weaponcraftingLevel;

  /// The current xp level of the Weaponcrafting skill.
  @BuiltValueField(wireName: r'weaponcrafting_xp')
  int get weaponcraftingXp;

  /// Weaponcrafting XP required to level up the skill.
  @BuiltValueField(wireName: r'weaponcrafting_max_xp')
  int get weaponcraftingMaxXp;

  /// Gearcrafting level.
  @BuiltValueField(wireName: r'gearcrafting_level')
  int get gearcraftingLevel;

  /// The current xp level of the Gearcrafting skill.
  @BuiltValueField(wireName: r'gearcrafting_xp')
  int get gearcraftingXp;

  /// Gearcrafting XP required to level up the skill.
  @BuiltValueField(wireName: r'gearcrafting_max_xp')
  int get gearcraftingMaxXp;

  /// Jewelrycrafting level.
  @BuiltValueField(wireName: r'jewelrycrafting_level')
  int get jewelrycraftingLevel;

  /// The current xp level of the Jewelrycrafting skill.
  @BuiltValueField(wireName: r'jewelrycrafting_xp')
  int get jewelrycraftingXp;

  /// Jewelrycrafting XP required to level up the skill.
  @BuiltValueField(wireName: r'jewelrycrafting_max_xp')
  int get jewelrycraftingMaxXp;

  /// The current xp level of the Cooking skill.
  @BuiltValueField(wireName: r'cooking_level')
  int get cookingLevel;

  /// Cooking XP.
  @BuiltValueField(wireName: r'cooking_xp')
  int get cookingXp;

  /// Cooking XP required to level up the skill.
  @BuiltValueField(wireName: r'cooking_max_xp')
  int get cookingMaxXp;

  /// Alchemy level.
  @BuiltValueField(wireName: r'alchemy_level')
  int get alchemyLevel;

  /// Alchemy XP.
  @BuiltValueField(wireName: r'alchemy_xp')
  int get alchemyXp;

  /// Alchemy XP required to level up the skill.
  @BuiltValueField(wireName: r'alchemy_max_xp')
  int get alchemyMaxXp;

  /// Character actual HP.
  @BuiltValueField(wireName: r'hp')
  int get hp;

  /// Character max HP.
  @BuiltValueField(wireName: r'max_hp')
  int get maxHp;

  /// *Character Haste. Increase speed attack (reduce fight cooldown)
  @BuiltValueField(wireName: r'haste')
  int get haste;

  /// *Not available, on the roadmap. Character Critical   Strike. Critical strikes increase the attack's damage.
  @BuiltValueField(wireName: r'critical_strike')
  int get criticalStrike;

  /// *Not available, on the roadmap. Regenerates life at the start of each turn.
  @BuiltValueField(wireName: r'stamina')
  int get stamina;

  /// Fire attack.
  @BuiltValueField(wireName: r'attack_fire')
  int get attackFire;

  /// Earth attack.
  @BuiltValueField(wireName: r'attack_earth')
  int get attackEarth;

  /// Water attack.
  @BuiltValueField(wireName: r'attack_water')
  int get attackWater;

  /// Air attack.
  @BuiltValueField(wireName: r'attack_air')
  int get attackAir;

  /// % Fire damage.
  @BuiltValueField(wireName: r'dmg_fire')
  int get dmgFire;

  /// % Earth damage.
  @BuiltValueField(wireName: r'dmg_earth')
  int get dmgEarth;

  /// % Water damage.
  @BuiltValueField(wireName: r'dmg_water')
  int get dmgWater;

  /// % Air damage.
  @BuiltValueField(wireName: r'dmg_air')
  int get dmgAir;

  /// % Fire resistance.
  @BuiltValueField(wireName: r'res_fire')
  int get resFire;

  /// % Earth resistance.
  @BuiltValueField(wireName: r'res_earth')
  int get resEarth;

  /// % Water resistance.
  @BuiltValueField(wireName: r'res_water')
  int get resWater;

  /// % Air resistance.
  @BuiltValueField(wireName: r'res_air')
  int get resAir;

  /// Character x coordinate.
  @BuiltValueField(wireName: r'x')
  int get x;

  /// Character y coordinate.
  @BuiltValueField(wireName: r'y')
  int get y;

  /// Cooldown in seconds.
  @BuiltValueField(wireName: r'cooldown')
  int get cooldown;

  /// Weapon slot.
  @BuiltValueField(wireName: r'weapon_slot')
  String get weaponSlot;

  /// Shield slot.
  @BuiltValueField(wireName: r'shield_slot')
  String get shieldSlot;

  /// Helmet slot.
  @BuiltValueField(wireName: r'helmet_slot')
  String get helmetSlot;

  /// Body armor slot.
  @BuiltValueField(wireName: r'body_armor_slot')
  String get bodyArmorSlot;

  /// Leg armor slot.
  @BuiltValueField(wireName: r'leg_armor_slot')
  String get legArmorSlot;

  /// Boots slot.
  @BuiltValueField(wireName: r'boots_slot')
  String get bootsSlot;

  /// Ring 1 slot.
  @BuiltValueField(wireName: r'ring1_slot')
  String get ring1Slot;

  /// Ring 2 slot.
  @BuiltValueField(wireName: r'ring2_slot')
  String get ring2Slot;

  /// Amulet slot.
  @BuiltValueField(wireName: r'amulet_slot')
  String get amuletSlot;

  /// Artifact 1 slot.
  @BuiltValueField(wireName: r'artifact1_slot')
  String get artifact1Slot;

  /// Artifact 2 slot.
  @BuiltValueField(wireName: r'artifact2_slot')
  String get artifact2Slot;

  /// Artifact 3 slot.
  @BuiltValueField(wireName: r'artifact3_slot')
  String get artifact3Slot;

  /// Utility 1 slot.
  @BuiltValueField(wireName: r'utility1_slot')
  String get utility1Slot;

  /// Utility 1 quantity.
  @BuiltValueField(wireName: r'utility1_slot_quantity')
  int get utility1SlotQuantity;

  /// Utility 2 slot.
  @BuiltValueField(wireName: r'utility2_slot')
  String get utility2Slot;

  /// Utility 2 quantity.
  @BuiltValueField(wireName: r'utility2_slot_quantity')
  int get utility2SlotQuantity;

  /// Task in progress.
  @BuiltValueField(wireName: r'task')
  String get task;

  /// Task type.
  @BuiltValueField(wireName: r'task_type')
  String get taskType;

  /// Task progression.
  @BuiltValueField(wireName: r'task_progress')
  int get taskProgress;

  /// Task total objective.
  @BuiltValueField(wireName: r'task_total')
  int get taskTotal;

  /// Inventory max items.
  @BuiltValueField(wireName: r'inventory_max_items')
  int get inventoryMaxItems;

  /// Datetime Cooldown expiration.
  @BuiltValueField(wireName: r'cooldown_expiration')
  DateTime? get cooldownExpiration;

  /// List of inventory slots.
  @BuiltValueField(wireName: r'inventory')
  BuiltList<InventorySlot>? get inventory;

  CharacterSchema._();

  factory CharacterSchema([void updates(CharacterSchemaBuilder b)]) =
      _$CharacterSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterSchema> get serializer =>
      _$CharacterSchemaSerializer();
}

class _$CharacterSchemaSerializer
    implements PrimitiveSerializer<CharacterSchema> {
  @override
  final Iterable<Type> types = const [CharacterSchema, _$CharacterSchema];

  @override
  final String wireName = r'CharacterSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
      specifiedType: const FullType(CharacterSkin),
    );
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(int),
    );
    yield r'xp';
    yield serializers.serialize(
      object.xp,
      specifiedType: const FullType(int),
    );
    yield r'max_xp';
    yield serializers.serialize(
      object.maxXp,
      specifiedType: const FullType(int),
    );
    yield r'gold';
    yield serializers.serialize(
      object.gold,
      specifiedType: const FullType(int),
    );
    yield r'speed';
    yield serializers.serialize(
      object.speed,
      specifiedType: const FullType(int),
    );
    yield r'mining_level';
    yield serializers.serialize(
      object.miningLevel,
      specifiedType: const FullType(int),
    );
    yield r'mining_xp';
    yield serializers.serialize(
      object.miningXp,
      specifiedType: const FullType(int),
    );
    yield r'mining_max_xp';
    yield serializers.serialize(
      object.miningMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'woodcutting_level';
    yield serializers.serialize(
      object.woodcuttingLevel,
      specifiedType: const FullType(int),
    );
    yield r'woodcutting_xp';
    yield serializers.serialize(
      object.woodcuttingXp,
      specifiedType: const FullType(int),
    );
    yield r'woodcutting_max_xp';
    yield serializers.serialize(
      object.woodcuttingMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'fishing_level';
    yield serializers.serialize(
      object.fishingLevel,
      specifiedType: const FullType(int),
    );
    yield r'fishing_xp';
    yield serializers.serialize(
      object.fishingXp,
      specifiedType: const FullType(int),
    );
    yield r'fishing_max_xp';
    yield serializers.serialize(
      object.fishingMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'weaponcrafting_level';
    yield serializers.serialize(
      object.weaponcraftingLevel,
      specifiedType: const FullType(int),
    );
    yield r'weaponcrafting_xp';
    yield serializers.serialize(
      object.weaponcraftingXp,
      specifiedType: const FullType(int),
    );
    yield r'weaponcrafting_max_xp';
    yield serializers.serialize(
      object.weaponcraftingMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'gearcrafting_level';
    yield serializers.serialize(
      object.gearcraftingLevel,
      specifiedType: const FullType(int),
    );
    yield r'gearcrafting_xp';
    yield serializers.serialize(
      object.gearcraftingXp,
      specifiedType: const FullType(int),
    );
    yield r'gearcrafting_max_xp';
    yield serializers.serialize(
      object.gearcraftingMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'jewelrycrafting_level';
    yield serializers.serialize(
      object.jewelrycraftingLevel,
      specifiedType: const FullType(int),
    );
    yield r'jewelrycrafting_xp';
    yield serializers.serialize(
      object.jewelrycraftingXp,
      specifiedType: const FullType(int),
    );
    yield r'jewelrycrafting_max_xp';
    yield serializers.serialize(
      object.jewelrycraftingMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'cooking_level';
    yield serializers.serialize(
      object.cookingLevel,
      specifiedType: const FullType(int),
    );
    yield r'cooking_xp';
    yield serializers.serialize(
      object.cookingXp,
      specifiedType: const FullType(int),
    );
    yield r'cooking_max_xp';
    yield serializers.serialize(
      object.cookingMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'alchemy_level';
    yield serializers.serialize(
      object.alchemyLevel,
      specifiedType: const FullType(int),
    );
    yield r'alchemy_xp';
    yield serializers.serialize(
      object.alchemyXp,
      specifiedType: const FullType(int),
    );
    yield r'alchemy_max_xp';
    yield serializers.serialize(
      object.alchemyMaxXp,
      specifiedType: const FullType(int),
    );
    yield r'hp';
    yield serializers.serialize(
      object.hp,
      specifiedType: const FullType(int),
    );
    yield r'max_hp';
    yield serializers.serialize(
      object.maxHp,
      specifiedType: const FullType(int),
    );
    yield r'haste';
    yield serializers.serialize(
      object.haste,
      specifiedType: const FullType(int),
    );
    yield r'critical_strike';
    yield serializers.serialize(
      object.criticalStrike,
      specifiedType: const FullType(int),
    );
    yield r'stamina';
    yield serializers.serialize(
      object.stamina,
      specifiedType: const FullType(int),
    );
    yield r'attack_fire';
    yield serializers.serialize(
      object.attackFire,
      specifiedType: const FullType(int),
    );
    yield r'attack_earth';
    yield serializers.serialize(
      object.attackEarth,
      specifiedType: const FullType(int),
    );
    yield r'attack_water';
    yield serializers.serialize(
      object.attackWater,
      specifiedType: const FullType(int),
    );
    yield r'attack_air';
    yield serializers.serialize(
      object.attackAir,
      specifiedType: const FullType(int),
    );
    yield r'dmg_fire';
    yield serializers.serialize(
      object.dmgFire,
      specifiedType: const FullType(int),
    );
    yield r'dmg_earth';
    yield serializers.serialize(
      object.dmgEarth,
      specifiedType: const FullType(int),
    );
    yield r'dmg_water';
    yield serializers.serialize(
      object.dmgWater,
      specifiedType: const FullType(int),
    );
    yield r'dmg_air';
    yield serializers.serialize(
      object.dmgAir,
      specifiedType: const FullType(int),
    );
    yield r'res_fire';
    yield serializers.serialize(
      object.resFire,
      specifiedType: const FullType(int),
    );
    yield r'res_earth';
    yield serializers.serialize(
      object.resEarth,
      specifiedType: const FullType(int),
    );
    yield r'res_water';
    yield serializers.serialize(
      object.resWater,
      specifiedType: const FullType(int),
    );
    yield r'res_air';
    yield serializers.serialize(
      object.resAir,
      specifiedType: const FullType(int),
    );
    yield r'x';
    yield serializers.serialize(
      object.x,
      specifiedType: const FullType(int),
    );
    yield r'y';
    yield serializers.serialize(
      object.y,
      specifiedType: const FullType(int),
    );
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(int),
    );
    yield r'weapon_slot';
    yield serializers.serialize(
      object.weaponSlot,
      specifiedType: const FullType(String),
    );
    yield r'shield_slot';
    yield serializers.serialize(
      object.shieldSlot,
      specifiedType: const FullType(String),
    );
    yield r'helmet_slot';
    yield serializers.serialize(
      object.helmetSlot,
      specifiedType: const FullType(String),
    );
    yield r'body_armor_slot';
    yield serializers.serialize(
      object.bodyArmorSlot,
      specifiedType: const FullType(String),
    );
    yield r'leg_armor_slot';
    yield serializers.serialize(
      object.legArmorSlot,
      specifiedType: const FullType(String),
    );
    yield r'boots_slot';
    yield serializers.serialize(
      object.bootsSlot,
      specifiedType: const FullType(String),
    );
    yield r'ring1_slot';
    yield serializers.serialize(
      object.ring1Slot,
      specifiedType: const FullType(String),
    );
    yield r'ring2_slot';
    yield serializers.serialize(
      object.ring2Slot,
      specifiedType: const FullType(String),
    );
    yield r'amulet_slot';
    yield serializers.serialize(
      object.amuletSlot,
      specifiedType: const FullType(String),
    );
    yield r'artifact1_slot';
    yield serializers.serialize(
      object.artifact1Slot,
      specifiedType: const FullType(String),
    );
    yield r'artifact2_slot';
    yield serializers.serialize(
      object.artifact2Slot,
      specifiedType: const FullType(String),
    );
    yield r'artifact3_slot';
    yield serializers.serialize(
      object.artifact3Slot,
      specifiedType: const FullType(String),
    );
    yield r'utility1_slot';
    yield serializers.serialize(
      object.utility1Slot,
      specifiedType: const FullType(String),
    );
    yield r'utility1_slot_quantity';
    yield serializers.serialize(
      object.utility1SlotQuantity,
      specifiedType: const FullType(int),
    );
    yield r'utility2_slot';
    yield serializers.serialize(
      object.utility2Slot,
      specifiedType: const FullType(String),
    );
    yield r'utility2_slot_quantity';
    yield serializers.serialize(
      object.utility2SlotQuantity,
      specifiedType: const FullType(int),
    );
    yield r'task';
    yield serializers.serialize(
      object.task,
      specifiedType: const FullType(String),
    );
    yield r'task_type';
    yield serializers.serialize(
      object.taskType,
      specifiedType: const FullType(String),
    );
    yield r'task_progress';
    yield serializers.serialize(
      object.taskProgress,
      specifiedType: const FullType(int),
    );
    yield r'task_total';
    yield serializers.serialize(
      object.taskTotal,
      specifiedType: const FullType(int),
    );
    yield r'inventory_max_items';
    yield serializers.serialize(
      object.inventoryMaxItems,
      specifiedType: const FullType(int),
    );
    if (object.cooldownExpiration != null) {
      yield r'cooldown_expiration';
      yield serializers.serialize(
        object.cooldownExpiration,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.inventory != null) {
      yield r'inventory';
      yield serializers.serialize(
        object.inventory,
        specifiedType: const FullType(BuiltList, [FullType(InventorySlot)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterSchema object, {
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
    required CharacterSchemaBuilder result,
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
            specifiedType: const FullType(CharacterSkin),
          ) as CharacterSkin;
          result.skin = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.xp = valueDes;
          break;
        case r'max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxXp = valueDes;
          break;
        case r'gold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gold = valueDes;
          break;
        case r'speed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.speed = valueDes;
          break;
        case r'mining_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.miningLevel = valueDes;
          break;
        case r'mining_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.miningXp = valueDes;
          break;
        case r'mining_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.miningMaxXp = valueDes;
          break;
        case r'woodcutting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.woodcuttingLevel = valueDes;
          break;
        case r'woodcutting_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.woodcuttingXp = valueDes;
          break;
        case r'woodcutting_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.woodcuttingMaxXp = valueDes;
          break;
        case r'fishing_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fishingLevel = valueDes;
          break;
        case r'fishing_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fishingXp = valueDes;
          break;
        case r'fishing_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fishingMaxXp = valueDes;
          break;
        case r'weaponcrafting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weaponcraftingLevel = valueDes;
          break;
        case r'weaponcrafting_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weaponcraftingXp = valueDes;
          break;
        case r'weaponcrafting_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weaponcraftingMaxXp = valueDes;
          break;
        case r'gearcrafting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gearcraftingLevel = valueDes;
          break;
        case r'gearcrafting_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gearcraftingXp = valueDes;
          break;
        case r'gearcrafting_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gearcraftingMaxXp = valueDes;
          break;
        case r'jewelrycrafting_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.jewelrycraftingLevel = valueDes;
          break;
        case r'jewelrycrafting_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.jewelrycraftingXp = valueDes;
          break;
        case r'jewelrycrafting_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.jewelrycraftingMaxXp = valueDes;
          break;
        case r'cooking_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cookingLevel = valueDes;
          break;
        case r'cooking_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cookingXp = valueDes;
          break;
        case r'cooking_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cookingMaxXp = valueDes;
          break;
        case r'alchemy_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.alchemyLevel = valueDes;
          break;
        case r'alchemy_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.alchemyXp = valueDes;
          break;
        case r'alchemy_max_xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.alchemyMaxXp = valueDes;
          break;
        case r'hp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.hp = valueDes;
          break;
        case r'max_hp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxHp = valueDes;
          break;
        case r'haste':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.haste = valueDes;
          break;
        case r'critical_strike':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.criticalStrike = valueDes;
          break;
        case r'stamina':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.stamina = valueDes;
          break;
        case r'attack_fire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackFire = valueDes;
          break;
        case r'attack_earth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackEarth = valueDes;
          break;
        case r'attack_water':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackWater = valueDes;
          break;
        case r'attack_air':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackAir = valueDes;
          break;
        case r'dmg_fire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dmgFire = valueDes;
          break;
        case r'dmg_earth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dmgEarth = valueDes;
          break;
        case r'dmg_water':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dmgWater = valueDes;
          break;
        case r'dmg_air':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dmgAir = valueDes;
          break;
        case r'res_fire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resFire = valueDes;
          break;
        case r'res_earth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resEarth = valueDes;
          break;
        case r'res_water':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resWater = valueDes;
          break;
        case r'res_air':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resAir = valueDes;
          break;
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.y = valueDes;
          break;
        case r'cooldown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cooldown = valueDes;
          break;
        case r'weapon_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.weaponSlot = valueDes;
          break;
        case r'shield_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shieldSlot = valueDes;
          break;
        case r'helmet_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.helmetSlot = valueDes;
          break;
        case r'body_armor_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.bodyArmorSlot = valueDes;
          break;
        case r'leg_armor_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.legArmorSlot = valueDes;
          break;
        case r'boots_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.bootsSlot = valueDes;
          break;
        case r'ring1_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ring1Slot = valueDes;
          break;
        case r'ring2_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ring2Slot = valueDes;
          break;
        case r'amulet_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.amuletSlot = valueDes;
          break;
        case r'artifact1_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.artifact1Slot = valueDes;
          break;
        case r'artifact2_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.artifact2Slot = valueDes;
          break;
        case r'artifact3_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.artifact3Slot = valueDes;
          break;
        case r'utility1_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.utility1Slot = valueDes;
          break;
        case r'utility1_slot_quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.utility1SlotQuantity = valueDes;
          break;
        case r'utility2_slot':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.utility2Slot = valueDes;
          break;
        case r'utility2_slot_quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.utility2SlotQuantity = valueDes;
          break;
        case r'task':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.task = valueDes;
          break;
        case r'task_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.taskType = valueDes;
          break;
        case r'task_progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.taskProgress = valueDes;
          break;
        case r'task_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.taskTotal = valueDes;
          break;
        case r'inventory_max_items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.inventoryMaxItems = valueDes;
          break;
        case r'cooldown_expiration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.cooldownExpiration = valueDes;
          break;
        case r'inventory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(InventorySlot)]),
          ) as BuiltList<InventorySlot>;
          result.inventory.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CharacterSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterSchemaBuilder();
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
