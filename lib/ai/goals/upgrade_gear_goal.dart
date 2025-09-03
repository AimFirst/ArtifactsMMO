import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';

class UpgradeGearGoal extends AIGoal {
  @override
  int get priority => 65;

  @override
  String get name => 'Upgrade Gear';

  @override
  bool canRun(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) {
    final bestInSlotMap = _bestInSlot(state, worldDataProvider);
    for (final bestInSlot in bestInSlotMap.entries) {
      final current = state.character.itemInSlot(bestInSlot.key);

      // If we don't have anything equipped, or the thing we have equipped is not in the list of best items...
      if (bestInSlot.value.isNotEmpty && (current.isEmpty || !bestInSlot.value.contains(current))) {

        for (final desiredItem in bestInSlot.value) {
          // Do we have it in the inventory/bank?
          if ((state.character.inventory?.count(desiredItem) ?? 0) > 0 || (bankProvider.count(desiredItem) > 0)) {
            return true;
          }

          // Have we already requested it?
          if (!teamBrainProvider.hasRequest(_keyForEquip(state.character, bestInSlot.key.type, desiredItem))) {
            return true;
          }
        }
      }
    }

    return false;
  }

  @override
  void execute(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) {
    final bestInSlotMap = _bestInSlot(state, worldDataProvider);
    for (final bestInSlot in bestInSlotMap.entries) {
      final current = state.character.itemInSlot(bestInSlot.key);

      // If we don't have anything equipped, or the thing we have equipped is not in the list of best items...
      if (bestInSlot.value.isNotEmpty && (current.isEmpty || !bestInSlot.value.contains(current))) {
        for (final desiredItem in bestInSlot.value) {
          // Do we have it in the inventory/bank?
          if ((state.character.inventory?.count(desiredItem) ?? 0) > 0 || (bankProvider.count(desiredItem) > 0)) {
            // Do we need to unequip something first?
            if (state.character.itemInSlot(bestInSlot.key).isNotEmpty) {
              teamProvider.queueAction(state.character.name, actionFactory.createUnequipAction(state.character.name, bestInSlot.key, 1));
            }

            // Do we need to fetch items from the bank?
            if ((state.character.inventory?.count(desiredItem) ?? 0) <= 0 ) {
              teamProvider.queueBankWithdraw(state.character, BuiltList.of([SimpleItemSchemaBuilder().fromCodeAndQuantity (desiredItem, 1)]));
              teamBrainProvider.completeRequestKey(_keyForEquip(state.character, bestInSlot.key.type, desiredItem));
            }

            // Equip the new item
            teamProvider.queueAction(state.character.name, actionFactory.createEquipAction(state.character.name, (SimpleItemSchemaBuilder().fromCodeAndQuantity(desiredItem, 1)), bestInSlot.key));
            return;
          }

          // Have we already requested it?
          if (!teamBrainProvider.hasRequest(_keyForEquip(state.character, bestInSlot.key.type, desiredItem))) {
            teamBrainProvider.postRequest(ItemRequest(_keyForEquip(state.character, bestInSlot.key.type, desiredItem), desiredItem, 1, state.character.name));
            return;
          }
        }
      }
    }
  }

  Map<ItemSlot, List<String>> _bestInSlot(CharacterState character, WorldDataProvider worldDataProvider) {
    final Map<ItemSlot, List<String>> bestInSlot = {};

    for (final slot in ItemSlot.values) {
      List<String> bestItems = [];
      final options = worldDataProvider.allItems.where((item) => item.type == slot.type && character.character.canUseItem(item)).toList();
      options.sort((a, b) => b.level.compareTo(a.level));
      final maxLevel = options.firstOrNull?.level;

      // No items in this slot.
      if (maxLevel == null) {
        continue;
      }

      // Get all the items with the highest level
      for (final item in options) {
        if (item.level == maxLevel) {
          bestItems.add(item.code);
        }
      }

      bestInSlot[slot] = bestItems;
    }

    return bestInSlot;
  }

  String _keyForEquip(CharacterSchema character, String itemType, String itemName) {
    return 'equip:${character.name}:$itemType:$itemName';
  }
}
