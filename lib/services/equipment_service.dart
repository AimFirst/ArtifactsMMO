// lib/services/equipment_service.dart
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';

// Defines the context for a gear decision
class GearEvaluationContext {
  final String taskType; // e.g., 'mining', 'fighting'
  final MonsterSchema?
      targetMonster; // The specific monster for fighting context

  GearEvaluationContext({required this.taskType, this.targetMonster});
}

class EquipmentService {
  final CombatService _combatService;

  EquipmentService(this._combatService);

  /// Determines the best item for a single slot from a list of available items.
  ItemSchema? findBestItemForSlot(
    ItemSlot slot,
    GearEvaluationContext context,
    List<ItemSchema> availableItems,
    CharacterSchema currentCharacter,
    WorldDataProvider worldDataProvider,
  ) {
    ItemSchema? bestItem;
    final worstScore = -1000000.0;
    double bestScore = worstScore;

    // Filter items that can be equipped in the target slot
    final candidateItems = availableItems.where(
        (item) => item.type == slot.type && currentCharacter.canUseItem(item));

    for (final item in candidateItems) {
      double currentScore = 0;

      if (context.taskType == 'overall' && context.targetMonster != null) {
        // For fighting, the "score" is the simulated damage per turn.
        // We temporarily create a "what if" version of the character with the item equipped.
        final tempCharacter = currentCharacter.copyWithEquippedItem(
            item, slot, worldDataProvider);
        final combatDetails = _combatService.getCombatDetails(
          tempCharacter,
          context.targetMonster!,
        );
        currentScore = combatDetails.canWin
            ? combatDetails.totalCooldown * -1.0 +
                (tempCharacter.maxHp / 1000) +
                (tempCharacter.inventoryMaxItems /
                    10000) // Provide a small boost if we also get more inventory space
            : worstScore;
      } else {
        // For gathering, the "score" is simply the relevant stat boost.
        currentScore = -1.0 *
            (item.effects?.fold(
                    0,
                    (sum, effect) => ((sum ?? 0) +
                        (effect.code == context.taskType
                            ? effect.value
                            : effect.code == EffectEnum.inventory_space.name
                                ? (effect.value /
                                    100) // Provide a small boost if we also get more inventory space
                                : 0))) ??
                0);
      }

      // Add more scoring logic for other tasks...
      if (currentScore > bestScore) {
        bestScore = currentScore;
        bestItem = item;
      }
    }
    return bestItem;
  }
}
