import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class UpgradeGearGoal extends AIGoal {
  @override
  int get priority => 30;

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
    // TODO: implement execute
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

  Map<ItemSlot, List<String>> _getGearToUpgrade(CharacterState character, WorldDataProvider worldDataProvider) {
    final Map<ItemSlot, List<String>> gearToUpgrade = {};

    final bestInSlotMap = _bestInSlot(character, worldDataProvider);
    for (final bestInSlot in bestInSlotMap.entries) {
      final bestItems = bestInSlot.value;
      final slot = bestInSlot.key;

      for (final item in bestItems) {
        // if (character.character.)
      }
    }

    return gearToUpgrade;
  }
}
