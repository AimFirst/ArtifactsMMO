import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/data/database.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:drift/drift.dart';

class LoadoutOptimizerService {
  static const optimizationAlgorithmVersion = 1;

  final CombatService _combatService;
  final WorldDataProvider _worldDataProvider;
  final AppDatabase _database;

  final Map<String, EquipmentLoadoutResult> _inProgressCalculations = {};

  // The cache: { GearEvaluationContext -> { CharacterSkillLevel,EquipmentOptions -> EquipmentLoadout } }
  // final Map<String, Map<String, EquipmentLoadoutResult>> _bestResults = {};

  LoadoutOptimizerService(
      this._combatService, this._worldDataProvider, this._database);

  String _generateEvaluationKey(GearEvaluationContext gearContext,
      CharacterSchema character, List<ItemSchema?> gearOptions) {
    // Only include stats relevant to the combat calculation.
    final relevantStatsKey =
        character.skills[gearContext.taskType]?.level.toString();
    final gearOptionsKey = gearOptions
        .where((item) => item != null)
        .map((item) => item!.code)
        .toList()
      ..sort((a, b) => a.compareTo(b))
      ..join(',');
    return "$optimizationAlgorithmVersion|$gearContext|$relevantStatsKey|$gearOptionsKey";
  }

  Future<EquipmentLoadoutResult?> _getCachedResult(String cacheKey) async {
    final query = _database.select(_database.cachedLoadouts)
      ..where((tbl) =>
          tbl.cacheKey.equals(cacheKey) &
          tbl.algorithmVersion.equals(optimizationAlgorithmVersion));
    final cachedResult = await query.getSingleOrNull();
    if (cachedResult != null) {
      return EquipmentLoadoutResultMapper.fromJson(cachedResult.loadout);
    }

    return null;
  }

  Future<void> _saveCachedResult(
      String cacheKey, EquipmentLoadoutResult result) async {
    try {
      await _database.into(_database.cachedLoadouts).insert(
          CachedLoadout(
              algorithmVersion: optimizationAlgorithmVersion,
              cacheKey: cacheKey,
              loadout: result.toJson()),
          onConflict: DoNothing());
    } catch (e) {
      LoggerService.instance.log('Error saving cached result for $cacheKey: $e');
    }
  }

  EquipmentLoadoutResult _getDefaultResult(GearEvaluationContext gearContext) {
    if (gearContext.taskType == CharacterExtensions.overallLevelSkillName) {
      return CombatEquipmentLoadoutResult(loadout: EquipmentLoadout(), combatDetails: CombatDetails(playerAvgDPT: 1, monsterAvgDPT: 10, playerStartHp: 1, monsterStartHp: 100, haste: 0));
    } else {
      return SkillEquipmentLoadoutResult(loadout: EquipmentLoadout(), skill: gearContext.taskType);
    }
  }

  Future<EquipmentLoadoutResult> _getLoadoutResult(
      GearEvaluationContext gearContext,
      CharacterSchema character,
      EquipmentLoadout loadout) async {
    final cacheKey =
        _generateEvaluationKey(gearContext, character, loadout.items);
    final cachedResult = await _getCachedResult(cacheKey);
    if (cachedResult != null) {
      return cachedResult;
    }

    CharacterSchema tempCharacter = character.copyWithEquippedItems(
        loadout.itemsBySlot, _worldDataProvider);

    // LoggerService.instance.log('Calculated loadout tree leaf: ${loadout.items.where((i) => i!=null).length}', character: tempCharacter);

    EquipmentLoadoutResult result;
    if (gearContext.taskType == CharacterExtensions.overallLevelSkillName &&
        gearContext.targetMonster != null) {
      final combatDetails = _combatService.getCombatDetails(
          tempCharacter, gearContext.targetMonster!);
      result = CombatEquipmentLoadoutResult(
          loadout: loadout, combatDetails: combatDetails);
    } else {
      result = SkillEquipmentLoadoutResult(
          loadout: loadout, skill: gearContext.taskType);
    }

    await _saveCachedResult(cacheKey, result);

    return result;
  }

  int compareLoadoutResults(
    EquipmentLoadoutResult a,
    EquipmentLoadoutResult b,
    GearEvaluationContext gearContext,
  ) {
    if (a is CombatEquipmentLoadoutResult &&
        b is CombatEquipmentLoadoutResult) {
      if (b.combatDetails.canWin != a.combatDetails.canWin) {
        return b.combatDetails.canWin ? 1 : -1;
      }

      final aWisdom = a.loadout.effectValue(EffectEnum.wisdom);
      final bWisdom = b.loadout.effectValue(EffectEnum.wisdom);
      if (bWisdom != aWisdom) {
        return bWisdom.compareTo(aWisdom);
      }

      final aTotalCooldown = a.combatDetails.totalCooldown;
      final bTotalCooldown = b.combatDetails.totalCooldown;
      if (bTotalCooldown != aTotalCooldown) {
        // In this case a lower cooldown is good, so compare reverse order we normally do
        return aTotalCooldown.compareTo(bTotalCooldown);
      }

      // More inventory space is better
      final aInventorySpace = a.loadout.effectValue(EffectEnum.inventory_space);
      final bInventorySpace = b.loadout.effectValue(EffectEnum.inventory_space);
      if (bInventorySpace != aInventorySpace) {
        return bInventorySpace.compareTo(aInventorySpace);
      }

      // Pick the one with the highest number of null items since there's no point to crafting/equipping extra items if they don't help us with this.
      return b.loadout.items
          .where((item) => item == null)
          .length
          .compareTo(a.loadout.items.where((item) => item == null).length);
    } else if (a is SkillEquipmentLoadoutResult &&
        b is SkillEquipmentLoadoutResult) {
      final effectEnum =
          EffectEnum.values.firstWhere((e) => e.name == gearContext.taskType);
      final aSkill = -a.loadout.effectValue(effectEnum);
      final bSkill = -b.loadout.effectValue(effectEnum);
      if (bSkill != aSkill) return bSkill.compareTo(aSkill);

      // Pick the one with the highest inventory space
      final aInventorySpace = a.loadout.effectValue(EffectEnum.inventory_space);
      final bInventorySpace = b.loadout.effectValue(EffectEnum.inventory_space);
      if (bInventorySpace != aInventorySpace) {
        return bInventorySpace.compareTo(aInventorySpace);
      }

      // Pick the one with the highest number of null items since there's no point to crafting/equipping extra items if they don't help us with this.
      return b.loadout.items
          .where((item) => item == null)
          .length
          .compareTo(a.loadout.items.where((item) => item == null).length);
    } else {
      return 0;
    }
  }

  Future<EquipmentLoadoutResult> _bestOption(
      CharacterSchema characterSchema,
      GearEvaluationContext gearContext,
      EquipmentLoadout loadout,
      Map<ItemSlot, List<ItemSchema?>> gearOptions,
      int index) async {
    final cacheKey = _generateEvaluationKey(gearContext, characterSchema,
        gearOptions.values.expand((items) => items).toList());

    final cachedResult = await _getCachedResult(cacheKey);
    if (cachedResult != null) {
      return cachedResult;
    }

    _inProgressCalculations[cacheKey] = _getDefaultResult(gearContext);

    if (index == 0) {
      LoggerService.instance.log('Starting gear discovery $cacheKey}',
          character: characterSchema);
    }

    final itemSlots = ItemSlot.values.toList();
    final itemSlot = itemSlots[index];

    // Test all combinations of loadouts and get one result for each combination (for this index).
    List<EquipmentLoadoutResult> results = [];
    final options = gearOptions[itemSlot] ?? [];
    for (final item in options) {
      final newLoadout = loadout.copyWithItem(itemSlot, item);
      final newGearOptions = {...gearOptions}..[itemSlot] = [item];

      if (index >= itemSlots.length - 1) {
        results.add(
            await _getLoadoutResult(gearContext, characterSchema, newLoadout));
      } else {
        results.add(await _bestOption(characterSchema, gearContext, newLoadout,
            newGearOptions, index + 1));
      }
    }

    // Compare the combinations to get the best results
    results.sort((a, b) => compareLoadoutResults(a, b, gearContext));

    final bestResult = results.first;

    // Add the real result now that we've calculated it
    await _saveCachedResult(cacheKey, bestResult);

    if (index == 0) {
      LoggerService.instance.log(
          'Finished gear discovery ${gearContext.toString()}',
          character: characterSchema);
    }

    return bestResult;
  }

  bool _filterUsableItems(CharacterSchema character,
      GearEvaluationContext gearContext, ItemSchema? item) {
    // item is null?
    if (item == null) {
      return false;
    }

    // If we can't use it, don't include it
    if (!character.canUseItem(item)) {
      return false;
    }

    // No effects? Then it won't help reach our goal
    if (item.effects == null) {
      return false;
    }

    List<String> effectsToLookFor = [];
    if (gearContext.taskType == CharacterExtensions.overallLevelSkillName) {
      effectsToLookFor = [
        EffectEnum.antipoison.name,
        EffectEnum.attack_air.name,
        EffectEnum.attack_earth.name,
        EffectEnum.attack_fire.name,
        EffectEnum.attack_water.name,
        EffectEnum.boost_dmg_air.name,
        EffectEnum.boost_dmg_earth.name,
        EffectEnum.boost_dmg_fire.name,
        EffectEnum.boost_dmg_water.name,
        EffectEnum.boost_hp.name,
        EffectEnum.boost_res_air.name,
        EffectEnum.boost_res_earth.name,
        EffectEnum.boost_res_fire.name,
        EffectEnum.boost_res_water.name,
        EffectEnum.critical_strike.name,
        EffectEnum.dmg.name,
        EffectEnum.dmg_air.name,
        EffectEnum.dmg_earth.name,
        EffectEnum.dmg_fire.name,
        EffectEnum.dmg_water.name,
        EffectEnum.haste.name,
        EffectEnum.healing.name,
        EffectEnum.hp.name,
        EffectEnum.inventory_space.name,
        EffectEnum.lifesteal.name,
        EffectEnum.res_air.name,
        EffectEnum.res_earth.name,
        EffectEnum.res_fire.name,
        EffectEnum.res_water.name,
        EffectEnum.restore.name,
        EffectEnum.wisdom.name,
      ];
    } else {
      effectsToLookFor = [
        gearContext.taskType,
        EffectEnum.inventory_space.name,
      ];
    }

    // Is there an effect we care about?
    if (item.effects!.any((effect) => effectsToLookFor.contains(effect.code))) {
      return true;
    }

    return false;
  }

  Future<EquipmentLoadoutResult> bestLoadout(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<ItemSchema?> allItemsToConsider) async {
    final List<ItemSchema?> itemsThisCharacterCanUse = allItemsToConsider
        .where((item) => _filterUsableItems(character, gearContext, item))
        .toList()
      ..sort((a, b) {
        if (a == null && b == null) return 0;
        if (a == null) return 1;
        if (b == null) return -1;
        return a.code.compareTo(b.code);
      });
    Map<ItemSlot, List<ItemSchema?>> gearOptions = {};
    for (final slot in ItemSlot.values) {
      gearOptions[slot] = itemsThisCharacterCanUse
          .where((item) => item?.canFitInSlot(slot) ?? false)
          .cast<ItemSchema?>()
          .toList()
        ..add(null);
    }

    final newCharacter = character.copyWithEquippedItems({}, _worldDataProvider);
    final cacheKey = _generateEvaluationKey(gearContext, newCharacter,
        gearOptions.values.expand((items) => items).toList());
    final inProgress = _inProgressCalculations[cacheKey];
    if (inProgress != null) {
      return inProgress;
    }

    _inProgressCalculations[cacheKey] = _getDefaultResult(gearContext);

    return await _bestOption(newCharacter, gearContext, EquipmentLoadout(), gearOptions, 0);
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<ItemSchema?> inventoryItems,
      List<ItemSchema?> bankItems) async {
    return await bestLoadout(character, gearContext, [
      ...EquipmentLoadout.fromCharacter(character, _worldDataProvider).items,
      ...inventoryItems,
      ...bankItems
    ]);
  }
}
