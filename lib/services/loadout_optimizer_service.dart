import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';

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

  EquipmentLoadoutResult _getLoadoutResult(GearEvaluationContext gearContext,
      CharacterSchema character, EquipmentLoadout loadout) {
    final contextKey = _generateGearEvaluationContextKey(gearContext);
    final characterKey = _generateCharacterSkillsAndGearCacheKey(
        character, gearContext.taskType, loadout.items);

    final mapForContext = _bestResults.putIfAbsent(contextKey, () => {});
    if (mapForContext.containsKey(characterKey)) {
      return mapForContext[characterKey]!;
    }

    CharacterSchema tempCharacter = character.copyWithEquippedItems(
        loadout.itemsBySlot, _worldDataProvider);

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
      final aSkill = a.loadout.effectValue(effectEnum);
      final bSkill = b.loadout.effectValue(effectEnum);
      return bSkill.compareTo(aSkill);
    } else {
      return 0;
    }
  }

  EquipmentLoadoutResult _bestOption(
      CharacterSchema characterSchema,
      GearEvaluationContext gearContext,
      EquipmentLoadout loadout,
      Map<ItemSlot, List<ItemSchema?>> gearOptions,
      int index) {
    final contextKey = _generateGearEvaluationContextKey(gearContext);
    final characterKey = _generateCharacterSkillsAndGearCacheKey(
        characterSchema,
        gearContext.taskType,
        gearOptions.values.expand((items) => items).toList());

    if (_bestResults.containsKey(contextKey)) {
      if (_bestResults[contextKey]!.containsKey(characterKey)) {
        return _bestResults[contextKey]![characterKey]!;
      }
    }

    final itemSlots = ItemSlot.values.toList();
    final itemSlot = itemSlots[index];

    // Test all combinations of loadouts and get one result for each combination (for this index).
    List<EquipmentLoadoutResult> results = [];
    for (final item in (gearOptions[itemSlot] ?? <ItemSchema?>[])) {
      final newLoadout = loadout.copyWithItem(itemSlot, item);
      if (index >= itemSlots.length - 1) {
        results
            .add(_getLoadoutResult(gearContext, characterSchema, newLoadout));
      } else {
        results.add(_bestOption(
            characterSchema, gearContext, newLoadout, gearOptions, index + 1));
      }
    }

    // Compare the combinations to get the best results
    results.sort((a, b) => compareLoadoutResults(a, b, gearContext));

    final bestResult = results.first;

    final topLevel = _bestResults.putIfAbsent(
        contextKey, () => <String, EquipmentLoadoutResult>{});
    topLevel[characterKey] = bestResult;

    return bestResult;
  }

  EquipmentLoadoutResult bestLoadout(CharacterSchema character,
      GearEvaluationContext gearContext, List<ItemSchema?> allItemsToConsider) {
    final List<ItemSchema?> itemsThisCharacterCanUse = allItemsToConsider
        .where((item) => item != null && character.canUseItem(item))
        .toList();
    Map<ItemSlot, List<ItemSchema?>> gearOptions = {};
    for (final slot in ItemSlot.values) {
      gearOptions[slot] = itemsThisCharacterCanUse
          .where((item) => item?.type == slot.name)
          .cast<ItemSchema?>()
          .toList()
        ..add(null);
    }
    return _bestOption(
        character, gearContext, EquipmentLoadout(), gearOptions, 0);
  }

  EquipmentLoadoutResult bestLoadoutOfAvailableItems(
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
