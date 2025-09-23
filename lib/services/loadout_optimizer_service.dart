import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/data/database.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/combat_prediction.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context_key.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:drift/drift.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class LoadoutOptimizerService {
  static const optimizationAlgorithmVersion = 2;

  final CombatService _combatService;
  final WorldDataProvider _worldDataProvider;
  final AppDatabase _database;

  final Map<GearEvaluationContextKey, EquipmentLoadoutResult>
      _inProgressCalculations = {};

  LoadoutOptimizerService(
      this._combatService, this._worldDataProvider, this._database);

  GearEvaluationContextKey _generateEvaluationKey(
      GearEvaluationContext gearContext,
      CharacterSchema character,
      List<QuantityItemSchema?> itemOptions) {
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
        .map((item) => '${item?.item.code ?? 'null'}x${item?.quantity ?? 100}')
        .toList()
      ..sort((a, b) => a.compareTo(b));

    return GearEvaluationContextKey(
      algorithmVersion: optimizationAlgorithmVersion,
      contextType: gearContext.typeName(),
      contextSubType: gearContext.subTypeName(),
      contextLevel: relevantStatsKey,
      optionsHash: itemOptionsKey.join(',').hashCode.toString(),
    );
  }

  Uint8List encode(EquipmentLoadoutResult result) {
    final json = result.toJson();
    final stringBytes = utf8.encode(json);
    final compressedBytesList = gzip.encode(stringBytes);
    return Uint8List.fromList(compressedBytesList);
  }

  EquipmentLoadoutResult decode(Uint8List compressedBytes) {
    final originalBytes = gzip.decode(compressedBytes);
    final stringBytes = utf8.decode(originalBytes);
    return EquipmentLoadoutResultMapper.fromJson(stringBytes);
  }

  Future<EquipmentLoadoutResult?> _getCachedResult(
      GearEvaluationContextKey cacheKey, bool fromLongTerm) async {
    if (_inProgressCalculations.containsKey(cacheKey)) {
      return _inProgressCalculations[cacheKey];
    }

    if (fromLongTerm) {
      final query = _database.select(_database.cachedLoadouts)
        ..where((tbl) =>
            tbl.algorithmVersion.equals(cacheKey.algorithmVersion) &
            tbl.contextType.equals(cacheKey.contextType) &
            tbl.contextSubType.equals(cacheKey.contextSubType) &
            tbl.contextLevel.equals(cacheKey.contextLevel) &
            tbl.optionsHash.equals(cacheKey.optionsHash));
      final cachedResult = await query.getSingleOrNull();
      if (cachedResult != null) {
        final loadoutResult = decode(cachedResult.loadoutResult);
        _inProgressCalculations[cacheKey] = loadoutResult;
        return loadoutResult;
      }
    }

    return null;
  }

  Future<void> _saveCachedResult(GearEvaluationContextKey cacheKey,
      EquipmentLoadoutResult result, bool toLongTerm) async {
    _inProgressCalculations[cacheKey] = result;

    if (toLongTerm) {
      try {
        await _database.into(_database.cachedLoadouts).insert(
            CachedLoadout(
              algorithmVersion: cacheKey.algorithmVersion,
              contextType: cacheKey.contextType,
              contextSubType: cacheKey.contextSubType,
              contextLevel: cacheKey.contextLevel,
              optionsHash: cacheKey.optionsHash,
              loadoutResult: encode(result),
            ),
            onConflict: DoNothing());
      } catch (e) {
        LoggerService.instance
            .log('Error saving cached result for $cacheKey: $e');
      }
    }
  }

  EquipmentLoadoutResult _getDefaultResult(GearEvaluationContext gearContext) {
    switch (gearContext) {
      case CombatGearEvaluationContext():
        return CombatEquipmentLoadoutResult(
          loadout: EquipmentLoadout(),
          combatDetails: CombatPrediction(
            winPercentage: 0,
            averageTurnsToWin: 0,
            averageHpRemaining: 0,
            haste: 0,
            startHp: 0,
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
      EquipmentLoadout loadout,
      {bool forceCalculate = false}) async {
    final cacheKey =
        _generateEvaluationKey(gearContext, character, loadout.items);
    final cachedResult = await _getCachedResult(cacheKey, false);
    if (!forceCalculate && cachedResult != null) {
      return cachedResult;
    }

    CharacterSchema tempCharacter = character.copyWithEquippedItems(
        loadout.itemsBySlot, _worldDataProvider);

    EquipmentLoadoutResult result;
    switch (gearContext) {
      case CombatGearEvaluationContext():
        final combatDetails = await _combatService.runSimulationsSync(
            character: tempCharacter, monster: gearContext.targetMonster);
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

    await _saveCachedResult(cacheKey, result, false);

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

    // If neither can win, just return the one with the smallest item count
    // since there's no point trying to equip for this combat anyways.
    final aItemCount = a.loadout.items
        .fold(0, (initial, item) => initial + (item?.quantity ?? 0));
    final bItemCount = b.loadout.items
        .fold(0, (initial, item) => initial + (item?.quantity ?? 0));

    if (!b.combatDetails.canWin && !a.combatDetails.canWin) {
      return aItemCount.compareTo(bItemCount);
    }

    // Pick the one with the higher win percentage
    if (b.combatDetails.winPercentage != a.combatDetails.winPercentage) {
      return b.combatDetails.winPercentage
          .compareTo(a.combatDetails.winPercentage);
    }

    // Prospecting gives more items, prioritize this in tie breakers.
    final aProspecting = a.loadout.effectValue(EffectEnum.prospecting);
    final bProspecting = b.loadout.effectValue(EffectEnum.prospecting);
    if (bProspecting != aProspecting) {
      return bProspecting.compareTo(aProspecting);
    }

    // Wisdom gives more xp, this is a good tie breaker.
    final aWisdom = a.loadout.effectValue(EffectEnum.wisdom);
    final bWisdom = b.loadout.effectValue(EffectEnum.wisdom);
    if (bWisdom != aWisdom) {
      return bWisdom.compareTo(aWisdom);
    }

    // Lower cooldown = more fighting, good tie breaker.
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

    // Pick the one with the lowest number of items since there's no point to crafting/equipping extra items if they don't help us with this.
    return aItemCount.compareTo(bItemCount);
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

    // Prospecting gives more items, prioritize this.
    final aProspecting = a.loadout.effectValue(EffectEnum.prospecting);
    final bProspecting = b.loadout.effectValue(EffectEnum.prospecting);
    if (bProspecting != aProspecting) {
      return bProspecting.compareTo(aProspecting);
    }

    // Pick the one that will reduce our cooldown the most
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

  Future<EquipmentLoadoutResult> bestGearOptionInternal(
      {required CharacterSchema characterSchema,
      required GearEvaluationContext gearContext,
      required EquipmentLoadout loadout,
      required Map<ItemSlot, List<QuantityItemSchema?>> gearOptions,
      bool forceCalculate = false}) {
    return _bestGearOption(
        characterSchema, gearContext, loadout, gearOptions, 0,
        forceCalculate: forceCalculate);
  }

  Future<EquipmentLoadoutResult> _bestGearOption(
      CharacterSchema characterSchema,
      GearEvaluationContext gearContext,
      EquipmentLoadout loadout,
      Map<ItemSlot, List<QuantityItemSchema?>> gearOptions,
      int index,
      {bool forceCalculate = false}) async {
    final cacheKey = _generateEvaluationKey(gearContext, characterSchema,
        gearOptions.values.expand((items) => items).toList());

    if (!forceCalculate) {
      final cachedResult = await _getCachedResult(cacheKey, false);
      if (cachedResult != null) {
        return cachedResult;
      }
    }

    if (index == 0) {
      LoggerService.instance.log('Starting gear discovery $cacheKey}',
          character: characterSchema);
    }

    final itemSlots = ItemSlot.values.toList();
    final itemSlot = itemSlots[index];

    // Test all combinations of loadouts and get one result for each combination (for this index).
    List<EquipmentLoadoutResult> results = [];
    final options = gearOptions[itemSlot] ?? [];
    int itemIndex = 0;
    for (final item in options) {
      // Create quantity adjusted item based on slot type
      final adjustedItem = item == null
          ? null
          : QuantityItemSchema(
              item.item,
              itemSlot == ItemSlot.utility1 || itemSlot == ItemSlot.utility2
                  ? min(item.quantity, 100)
                  : 1);

      // Create new loadout with adjusted item
      final newLoadout = loadout.copyWithItem(itemSlot, adjustedItem);

      // Update quantities in gear options
      final newGearOptions = {...gearOptions};
      if (adjustedItem != null) {
        // Update quantities across all slots
        for (final slot in newGearOptions.keys) {
          newGearOptions[slot] = newGearOptions[slot]!
              .map((slotItem) => slotItem == null
                  ? null
                  : slotItem.item.code == adjustedItem.item.code
                      ? QuantityItemSchema(slotItem.item,
                          slotItem.quantity - adjustedItem.quantity)
                      : slotItem)
              .where((item) => item == null || item.quantity > 0)
              .toList();
        }
      }

      if (index == 0) {
        LoggerService.instance.log(
            'Gear discovery progress ($gearContext): ${itemIndex + 1} / ${options.length}',
            character: characterSchema);
        itemIndex++;
      }

      if (index >= itemSlots.length - 1) {
        results.add(await _getLoadoutResult(
            gearContext, characterSchema, newLoadout,
            forceCalculate: forceCalculate));
      } else {
        results.add(await _bestGearOption(
            characterSchema, gearContext, newLoadout, newGearOptions, index + 1,
            forceCalculate: forceCalculate));
      }
    }

    // Compare the combinations to get the best results
    results.sort((a, b) => compareLoadoutResults(a, b, gearContext));

    final bestResult = results.first;

    // Add the real result now that we've calculated it
    await _saveCachedResult(cacheKey, bestResult, false);

    if (index == 0) {
      LoggerService.instance.log(
          'Finished gear discovery ${gearContext.toString()}:\n${bestResult.loadout.itemsBySlot.entries.map((entry) => '${entry.key}: ${entry.value?.item.code}').join(',')}',
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

  List<EffectEnum> _effectsToLookFor(GearEvaluationContext gearContext) {
    switch (gearContext) {
      case CombatGearEvaluationContext():
        return [
          EffectEnum.antipoison,
          EffectEnum.attack_air,
          EffectEnum.attack_earth,
          EffectEnum.attack_fire,
          EffectEnum.attack_water,
          EffectEnum.boost_dmg_air,
          EffectEnum.boost_dmg_earth,
          EffectEnum.boost_dmg_fire,
          EffectEnum.boost_dmg_water,
          EffectEnum.boost_hp,
          EffectEnum.boost_res_air,
          EffectEnum.boost_res_earth,
          EffectEnum.boost_res_fire,
          EffectEnum.boost_res_water,
          EffectEnum.critical_strike,
          EffectEnum.dmg,
          EffectEnum.dmg_air,
          EffectEnum.dmg_earth,
          EffectEnum.dmg_fire,
          EffectEnum.dmg_water,
          EffectEnum.haste,
          EffectEnum.healing,
          EffectEnum.hp,
          EffectEnum.inventory_space,
          EffectEnum.lifesteal,
          EffectEnum.prospecting,
          EffectEnum.res_air,
          EffectEnum.res_earth,
          EffectEnum.res_fire,
          EffectEnum.res_water,
          EffectEnum.restore,
          EffectEnum.wisdom,
        ];
      case SkillGearEvaluationContext():
        return [
          EffectEnum.values.firstWhere((e) => e.name == gearContext.skillType),
          EffectEnum.prospecting,
          EffectEnum.inventory_space,
        ];
      case HealGearEvaluationContext():
        return [];
    }
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

    final effectsToLookFor = _effectsToLookFor(gearContext).map((e) => e.name);

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

  bool _hasBetterItem(QuantityItemSchema? item,
      List<EffectEnum> effectsToLookFor, List<QuantityItemSchema?> others) {
    // If our item is null, assume someone can do better than that.
    if (item == null) {
      return true;
    }

    // Compare against all the other items to see if someone just does it better
    for (final otherItem in others) {
      // Other item is null (or our same item!), let's assume we're better.
      if (otherItem == null || otherItem.item.code == item.item.code) {
        continue;
      }

      // Go through each effect we have and see if the other item is better in
      // every single effect we provide
      bool hasBetterEffect = false;
      for (final ourEffect in item.item.effects!) {
        final effectEnum =
            EffectEnum.values.firstWhere((e) => e.name == ourEffect.code);
        // Only compare effects that are relevant
        if (!effectsToLookFor.contains(effectEnum)) {
          continue;
        }

        // Find the other's effect value for this effect
        final otherEffect = otherItem.item.effects!
            .firstWhereOrNull((e) => e.code == ourEffect.code);
        // If the other doesn't have this effect or ours is better than theirs,
        // then stop checking effects for this item since we know we are better
        // in at least 1 effect case
        if (otherEffect == null ||
            (effectEnum.negativeIsBetter
                ? ourEffect.value < otherEffect.value
                : ourEffect.value > otherEffect.value)) {
          hasBetterEffect = true;
          break;
        }
      }

      // Not a single one of our effects were better, so we can remove this item
      // knowing that another item will be better.
      if (!hasBetterEffect) {
        return true;
      }
    }

    return false;
  }

  EquipmentLoadoutResult _bestUseOption(CharacterSchema character,
      GearEvaluationContext gearContext, List<QuantityItemSchema?> options,
      {bool forceCalculate = false}) {
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
            option.totalEffect(EffectEnum.heal) > 0 &&
            option.totalEffect(EffectEnum.heal) <= missingHp)).toList()
          ..sort((a, b) => b!
              .totalEffect(EffectEnum.heal)
              .compareTo(a!.totalEffect(EffectEnum.heal)));
        for (final option in filteredOptions) {
          final itemHealing = option!.totalEffect(EffectEnum.heal);
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

  List<QuantityItemSchema?> _combineQuantityItems(
      List<QuantityItemSchema?> items) {
    final Map<String, QuantityItemSchema> combinedItems = {};

    for (final item in items) {
      if (item == null) continue;

      if (combinedItems.containsKey(item.item.code)) {
        combinedItems[item.item.code] = QuantityItemSchema(
            item.item, combinedItems[item.item.code]!.quantity + item.quantity);
      } else {
        combinedItems[item.item.code] = item;
      }
    }

    return combinedItems.values.toList();
  }

  Future<EquipmentLoadoutResult> _bestLoadout(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<QuantityItemSchema?> allItemsToConsider,
      {bool forceCalculate = false}) async {
    // Combine items with same code
    allItemsToConsider = _combineQuantityItems(allItemsToConsider);

    // Filter items to what we can equip and use to help with this goal
    var itemsThisCharacterCanEquip = allItemsToConsider
        .where((item) => _filterEquipableItems(character, gearContext, item))
        .toSet()
        .toList()
      ..sort(_sortItems);
    final itemsThisCharacterCanUse = allItemsToConsider
        .where((item) => _filterUsableItems(character, gearContext, item))
        .toSet()
        .toList()
      ..sort(_sortItems);

    // Get the equipable items split by slot.
    Map<ItemSlot, List<QuantityItemSchema?>> gearOptions = {};
    for (final slot in ItemSlot.values) {
      final slotOptions = itemsThisCharacterCanEquip
          .where((item) {
            return (item?.item.canFitInSlot(slot) ?? false);
          })
          // Update the quantity to be the maximum # of item types we can use (like we can equip 2 rings at a time so only allow rings to have a max quantity of 2)
          .map((itemQuantity) => itemQuantity == null
              ? null
              : QuantityItemSchema(
                  itemQuantity.item,
                  min(itemQuantity.quantity,
                      slot.maxItemsForSlotTypeInLoadout)))
          .toSet()
          .toList();

      // Get rid of options that are just worse than others (another item has
      // the same effects but better)
      slotOptions.removeWhere((item) =>
          _hasBetterItem(item, _effectsToLookFor(gearContext), slotOptions));

      // Add null as a valid choice in case no item is just as good as our
      // "best" item. There's no point in crafting/equipping an item that isn't
      // better than just having nothing there.
      gearOptions[slot] = [...slotOptions, null];
    }

    itemsThisCharacterCanEquip = gearOptions.values.flattened.toSet().toList();

    final newCharacter =
        character.copyWithEquippedItems({}, _worldDataProvider);
    final cacheKey = _generateEvaluationKey(gearContext, newCharacter,
        [...itemsThisCharacterCanEquip, ...itemsThisCharacterCanUse]);

    // See if we have this result already available.
    if (!forceCalculate) {
      final cachedResult = await _getCachedResult(cacheKey, true);
      if (cachedResult != null) {
        return cachedResult;
      }
    }

    // Save a fake result to short term memory so we don't start multiple
    // calculations for the same gearContext.
    await _saveCachedResult(cacheKey, _getDefaultResult(gearContext), false);

    // Find the best gear combination
    final bestGearOption = await _bestGearOption(
        newCharacter, gearContext, EquipmentLoadout(), gearOptions, 0,
        forceCalculate: forceCalculate);
    // final bestGearOption = await startBackgroundCompute(
    //     _CalculationInput(
    //       loadoutOptimizerService: this,
    //       character: character,
    //       gearContext: gearContext,
    //       loadout: EquipmentLoadout(),
    //       gearOptions: gearOptions,
    //       forceCalculate: forceCalculate,
    //     ));
    // Find the best item combination
    final bestUseOption = await _bestUseOption(
        newCharacter, gearContext, itemsThisCharacterCanUse,
        forceCalculate: forceCalculate);

    // Combine the best into a single result
    final bestResult =
        bestGearOption.copyWith(itemsToUse: bestUseOption.itemsToUse);

    // Save this result to long term storage so we can always look it up in
    // future runs.
    await _saveCachedResult(cacheKey, bestResult, true);
    return bestResult;
  }

  Future<EquipmentLoadoutResult> startBackgroundCompute(
      _CalculationInput input) {
    return compute(calculatedLoadoutIsolate, input);
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAllItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      {bool forceCalculate = false}) async {
    return await _bestLoadout(
      character,
      gearContext,
      worldDataProvider.allItems
          .map((item) => QuantityItemSchema(item, 100))
          .toList(),
      forceCalculate: forceCalculate,
    );
  }

  Future<EquipmentLoadoutResult> _bestLoadoutOfAvailableItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<QuantityItemSchema?> inventoryItems,
      List<QuantityItemSchema?> bankItems,
      {bool forceCalculate = false}) async {
    return await _bestLoadout(
        character,
        gearContext,
        [
          ...EquipmentLoadout.fromCharacter(character, _worldDataProvider)
              .items,
          ...inventoryItems,
          ...bankItems
        ],
        forceCalculate: forceCalculate);
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableCharacterItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      {bool forceCalculate = false}) async {
    return await _bestLoadoutOfAvailableItems(
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
      }).toList(),
      forceCalculate: forceCalculate,
    );
  }
}

Future<EquipmentLoadoutResult> calculatedLoadoutIsolate(
    _CalculationInput input) {
  final loadoutService = input.loadoutOptimizerService;

  return loadoutService.bestGearOptionInternal(
      characterSchema: input.character,
      gearContext: input.gearContext,
      loadout: input.loadout,
      gearOptions: input.gearOptions,
      forceCalculate: input.forceCalculate);
}

class _CalculationInput {
  final LoadoutOptimizerService loadoutOptimizerService;
  final CharacterSchema character;
  final GearEvaluationContext gearContext;
  final EquipmentLoadout loadout;
  final Map<ItemSlot, List<QuantityItemSchema?>> gearOptions;
  final bool forceCalculate;

  _CalculationInput({
    required this.loadoutOptimizerService,
    required this.character,
    required this.gearContext,
    required this.loadout,
    required this.gearOptions,
    required this.forceCalculate,
  });
}
