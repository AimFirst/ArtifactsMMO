import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';

class LoadoutOptimizerService {
  final CombatService _combatService;
  final WorldDataProvider _worldDataProvider;

  // The cache: { GearEvaluationContext -> { CharacterSkillLevel,EquipmentOptions -> EquipmentLoadout } }
  final Map<String, Map<String, EquipmentLoadoutResult>> _bestResults = {};

  LoadoutOptimizerService(this._combatService, this._worldDataProvider);

  String _generateGearEvaluationContextKey(GearEvaluationContext gearContext) {
    return gearContext.toString();
  }

  String _generateCharacterSkillsAndGearCacheKey(CharacterSchema character,
      String skillName, List<ItemSchema?> gearOptions) {
    // Only include stats relevant to the combat calculation.
    final relevantStatsKey = character.skills[skillName]?.level.toString();
    final gearOptionsKey = gearOptions
        .where((item) => item != null)
        .map((item) => item!.code)
        .toList()
      ..sort((a, b) => a.compareTo(b))
      ..join(',');
    return "$relevantStatsKey|$gearOptionsKey";
  }

  Future<EquipmentLoadoutResult> _getLoadoutResult(
      GearEvaluationContext gearContext,
      CharacterSchema character,
      EquipmentLoadout loadout) async {
    final contextKey = _generateGearEvaluationContextKey(gearContext);
    final characterKey = _generateCharacterSkillsAndGearCacheKey(
        character, gearContext.taskType, loadout.items);

    final mapForContext = _bestResults.putIfAbsent(contextKey, () => {});
    if (mapForContext.containsKey(characterKey)) {
      // LoggerService.instance.log('Cached loadout tree leaf: ${loadout.items.where((i) => i!=null).length}', character: character);
      return mapForContext[characterKey]!;
    }

    CharacterSchema tempCharacter = character.copyWithEquippedItems(
        loadout.itemsBySlot, _worldDataProvider);

    // LoggerService.instance.log('Calculated loadout tree leaf: ${loadout.items.where((i) => i!=null).length}', character: tempCharacter);

    if (gearContext.taskType == CharacterExtensions.overallLevelSkillName &&
        gearContext.targetMonster != null) {
      final combatDetails = _combatService.getCombatDetails(
          tempCharacter, gearContext.targetMonster!);
      return CombatEquipmentLoadoutResult(loadout, combatDetails);
    }

    return SkillEquipmentLoadoutResult(loadout, gearContext.taskType);
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
    final contextKey = _generateGearEvaluationContextKey(gearContext);
    final characterKey = _generateCharacterSkillsAndGearCacheKey(
        characterSchema,
        gearContext.taskType,
        gearOptions.values.expand((items) => items).toList());

    final topLevel = _bestResults.putIfAbsent(
        contextKey, () => <String, EquipmentLoadoutResult>{});

    // If it's already cached, just use it!
    if (topLevel.containsKey(characterKey)) {
      // LoggerService.instance.log('Cached loadout $characterKey: ${loadout.items.where((i) => i!=null).length}', character: characterSchema);
      return _bestResults[contextKey]![characterKey]!;
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
    topLevel[characterKey] = bestResult;
    // LoggerService.instance.log('Calculated loadout $characterKey: ${loadout.items.where((i) => i!=null).length}', character: characterSchema);

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

    // Start it, but don't await it so it runs in the background.
    LoggerService.instance.log(
        'Starting gear discovery ${gearContext.toString()}',
        character: character);
    return _bestOption(character.copyWithEquippedItems({}, _worldDataProvider),
        gearContext, EquipmentLoadout(), gearOptions, 0);
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      List<ItemSchema?> inventoryItems,
      List<ItemSchema?> bankItems) {
    return bestLoadout(character, gearContext, [
      ...EquipmentLoadout.fromCharacter(character, _worldDataProvider).items,
      ...inventoryItems,
      ...bankItems
    ]);
  }
}
