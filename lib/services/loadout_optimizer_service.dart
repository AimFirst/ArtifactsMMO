import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/data/database.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:drift/drift.dart';

class LoadoutOptimizerService {
  static const optimizationAlgorithmVersion = 2;

  final CombatService _combatService;
  final WorldDataProvider _worldDataProvider;
  final AppDatabase _database;

  final Map<String, EquipmentLoadoutResult> _inProgressCalculations = {};

  LoadoutOptimizerService(
      this._combatService, this._worldDataProvider, this._database);

  String _generateEvaluationKey(GearEvaluationContext gearContext,
      CharacterSchema character, List<QuantityItemSchema?> itemOptions) {
    // Only include stats relevant to this specific type of gear calculation.
    int relevantStatsKey;
    switch (gearContext) {
      case CombatGearEvaluationContext():
        relevantStatsKey = character.level;
        break;
      case SkillGearEvaluationContext():
        relevantStatsKey = character.skills[gearContext.skillType]?.level ?? 0;
        break;
      case HealGearEvaluationContext():
        relevantStatsKey = character.maxHp - character.hp;
        break;
    }

    // Use the list of item options as part of the key
    final itemOptionsKey = itemOptions
        .where((item) => item != null)
        .map((item) => '${item!.item.code}x${item.quantity}')
        .toList()
      ..sort((a, b) => a.compareTo(b))
      ..join(',');

    // Return the complex key
    return "$optimizationAlgorithmVersion|${gearContext.toCacheKey()}|$relevantStatsKey|$itemOptionsKey";
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
      LoggerService.instance
          .log('Error saving cached result for $cacheKey: $e');
    }
  }

  EquipmentLoadoutResult _getDefaultResult(GearEvaluationContext gearContext) {
    switch (gearContext) {
      case CombatGearEvaluationContext():
        return CombatEquipmentLoadoutResult(
          loadout: EquipmentLoadout(),
          combatDetails: CombatDetails(
            playerAvgDPT: 1,
            monsterAvgDPT: 10,
            playerStartHp: 1,
            monsterStartHp: 100,
            haste: 0,
          ),
          itemsToUse: [],
        );
      case SkillGearEvaluationContext():
        return SkillEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), itemsToUse: []);
      case HealGearEvaluationContext():
        return HealEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), itemsToUse: []);
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
    switch (gearContext) {
      case CombatGearEvaluationContext():
        final combatDetails = _combatService.getCombatDetails(
            tempCharacter, gearContext.targetMonster);
        result = CombatEquipmentLoadoutResult(
            loadout: loadout, combatDetails: combatDetails, itemsToUse: []);
        break;
      case SkillGearEvaluationContext():
        result = SkillEquipmentLoadoutResult(loadout: loadout, itemsToUse: []);
        break;
      case HealGearEvaluationContext():
        result = HealEquipmentLoadoutResult(loadout: loadout, itemsToUse: []);
        break;
    }

    await _saveCachedResult(cacheKey, result);

    return result;
  }

  int _compareCombatLoadoutResults(
    EquipmentLoadoutResult a,
    EquipmentLoadoutResult b,
  ) {
    if (a is! CombatEquipmentLoadoutResult ||
        b is! CombatEquipmentLoadoutResult) {
      return 0;
    }

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
  }

  int _compareSkillLoadoutResults(
    EquipmentLoadoutResult a,
    EquipmentLoadoutResult b,
    GearEvaluationContext gearContext,
  ) {
    if (a is! SkillEquipmentLoadoutResult ||
        b is! SkillEquipmentLoadoutResult ||
        gearContext is! SkillGearEvaluationContext) {
      return 0;
    }

    final effectEnum =
        EffectEnum.values.firstWhere((e) => e.name == gearContext.skillType);
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
  }

  int _compareHealLoadoutResults(
    EquipmentLoadoutResult a,
    EquipmentLoadoutResult b,
    GearEvaluationContext gearContext,
  ) {
    if (a is! HealEquipmentLoadoutResult || b is! HealEquipmentLoadoutResult) {
      return 0;
    }

    final bEffect = b.loadout.effectValue(EffectEnum.heal);
    final aEffect = a.loadout.effectValue(EffectEnum.heal);
    if (bEffect != aEffect) return bEffect.compareTo(aEffect);

    // Pick the one with the highest number of null items since there's no point to crafting/equipping extra items if they don't help us with this.
    return b.loadout.items
        .where((item) => item == null)
        .length
        .compareTo(a.loadout.items.where((item) => item == null).length);
  }

  int compareLoadoutResults(
    EquipmentLoadoutResult a,
    EquipmentLoadoutResult b,
    GearEvaluationContext gearContext,
  ) {
    switch (gearContext) {
      case CombatGearEvaluationContext():
        return _compareCombatLoadoutResults(a, b);
      case SkillGearEvaluationContext():
        return _compareSkillLoadoutResults(a, b, gearContext);
      case HealGearEvaluationContext():
        return _compareHealLoadoutResults(a, b, gearContext);
    }
  }

  Future<EquipmentLoadoutResult> _bestGearOption(
      CharacterSchema characterSchema,
      GearEvaluationContext gearContext,
      EquipmentLoadout loadout,
      Map<ItemSlot, List<QuantityItemSchema?>> gearOptions,
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
        results.add(await _bestGearOption(characterSchema, gearContext,
            newLoadout, newGearOptions, index + 1));
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
      GearEvaluationContext gearContext, QuantityItemSchema? item) {
    // item is null?
    if (item == null) {
      return false;
    }

    // If we can't use it, don't include it
    if (!character.canUseItem(item.item)) {
      return false;
    }

    // No effects? Then it won't help reach our goal
    if (item.item.effects == null) {
      return false;
    }

    List<String> effectsToLookFor = [];
    switch (gearContext) {
      case CombatGearEvaluationContext():
        break;
      case SkillGearEvaluationContext():
        break;
      case HealGearEvaluationContext():
        effectsToLookFor = [
          EffectEnum.heal.name,
        ];
        break;
    }

    // Is there an effect we care about?
    if (item.item.effects!
        .any((effect) => effectsToLookFor.contains(effect.code))) {
      return true;
    }

    return false;
  }

  bool _filterEquipableItems(CharacterSchema character,
      GearEvaluationContext gearContext, QuantityItemSchema? item) {
    // item is null?
    if (item == null) {
      return false;
    }

    // Make sure it fits into a slot.
    if (item.item.itemSlot == null) {
      return false;
    }

    // If we can't use it, don't include it
    if (!character.canUseItem(item.item)) {
      return false;
    }

    // No effects? Then it won't help reach our goal
    if (item.item.effects == null) {
      return false;
    }

    List<String> effectsToLookFor = [];
    switch (gearContext) {
      case CombatGearEvaluationContext():
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
        break;
      case SkillGearEvaluationContext():
        effectsToLookFor = [
          gearContext.skillType,
          EffectEnum.inventory_space.name,
        ];
        break;
      case HealGearEvaluationContext():
        break;
    }

    // Is there an effect we care about?
    if (item.item.effects!
        .any((effect) => effectsToLookFor.contains(effect.code))) {
      return true;
    }

    return false;
  }

  int _sortItems(QuantityItemSchema? a, QuantityItemSchema? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return a.item.code.compareTo(b.item.code);
  }

  EquipmentLoadoutResult _bestUseOption(CharacterSchema character,
      GearEvaluationContext gearContext, List<QuantityItemSchema?> options) {
    switch (gearContext) {
      case CombatGearEvaluationContext():
        return _getDefaultResult(gearContext);
      case SkillGearEvaluationContext():
        return _getDefaultResult(gearContext);
      case HealGearEvaluationContext():
        final healingItems = <QuantityItemSchema>[];
        int missingHp = character.maxHp - character.hp;

        final filteredOptions = (options.where((option) =>
            option != null &&
            option.totalEffect(EffectEnum.healing) <= missingHp)).toList()
          ..sort((a, b) => b!
              .totalEffect(EffectEnum.healing)
              .compareTo(a!.totalEffect(EffectEnum.healing)));
        for (final option in filteredOptions) {
          final itemHealing = option!.totalEffect(EffectEnum.healing);
          if (itemHealing > missingHp) {
            continue;
          }

          final itemCountToUse = (missingHp / itemHealing).floor();
          healingItems.add(QuantityItemSchema(option.item, itemCountToUse));
          missingHp -= itemHealing * itemCountToUse;
        }

        return HealEquipmentLoadoutResult(
            loadout: EquipmentLoadout(), itemsToUse: healingItems);
    }
  }

  Future<EquipmentLoadoutResult> bestLoadout(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<QuantityItemSchema?> allItemsToConsider) async {
    // Filter items to what we can equip and use to help with this goal
    final itemsThisCharacterCanEquip = allItemsToConsider
        .where((item) => _filterEquipableItems(character, gearContext, item))
        .toList()
      ..sort(_sortItems);
    final itemsThisCharacterCanUse = allItemsToConsider
        .where((item) => _filterUsableItems(character, gearContext, item))
        .toList()
      ..sort(_sortItems);

    // Get the equipable items split by slot.
    Map<ItemSlot, List<QuantityItemSchema?>> gearOptions = {};
    for (final slot in ItemSlot.values) {
      gearOptions[slot] = itemsThisCharacterCanEquip
          .where((item) {
            return (item?.item.canFitInSlot(slot) ?? false);
          })
          .cast<QuantityItemSchema?>()
          .toList()
        ..add(null);
    }

    final newCharacter =
        character.copyWithEquippedItems({}, _worldDataProvider);
    final cacheKey = _generateEvaluationKey(gearContext, newCharacter,
        [...itemsThisCharacterCanEquip, ...itemsThisCharacterCanUse]);
    final inProgress = _inProgressCalculations[cacheKey];
    if (inProgress != null) {
      return inProgress;
    }

    _inProgressCalculations[cacheKey] = _getDefaultResult(gearContext);

    final bestGearOption = await _bestGearOption(
        newCharacter, gearContext, EquipmentLoadout(), gearOptions, 0);
    final bestUseOption = await _bestUseOption(
        newCharacter, gearContext, itemsThisCharacterCanUse);

    return bestGearOption.copyWith(itemsToUse: bestUseOption.itemsToUse);
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<QuantityItemSchema?> inventoryItems,
      List<QuantityItemSchema?> bankItems) async {
    return await bestLoadout(character, gearContext, [
      ...EquipmentLoadout.fromCharacter(character, _worldDataProvider).items,
      ...inventoryItems,
      ...bankItems
    ]);
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableCharacterItems(CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      ) async {
    return await bestLoadoutOfAvailableItems(
        character,
        gearContext,
        character.inventory?.map((item) {
          final itemSchema = worldDataProvider.getItemByCode(item.code);
          return itemSchema == null
              ? null
              : QuantityItemSchema(itemSchema, item.quantity);
        }).toList() ??
            <QuantityItemSchema?>[],
        bankProvider.items.map((item) {
          final itemSchema = worldDataProvider.getItemByCode(item.code);
          return itemSchema == null
              ? null
              : QuantityItemSchema(itemSchema, item.quantity);
        }).toList());
  }

}
