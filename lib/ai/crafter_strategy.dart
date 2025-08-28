import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/ai_strategy.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/craft_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/character_task.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';

class CrafterStrategy implements AIStrategy {
  @override
  void update(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) {
    if (state.currentTask != CharacterTask.craftEndlessly) return;

    final crafter = state.character;
    final worldData = worldDataProvider;

    // Step 1: Get the target item from the character's state.
    final SimpleItemSchema? targetItemName = state.designatedCraftingItem;
    if (targetItemName == null) return;

    // Step 2: Look up the recipe for the item.
    final CraftSchema? recipe = worldData.getRecipeForItem(targetItemName.code);
    if (recipe == null) {
      LoggerService.instance.log(
          "AI: ${crafter.name} has no recipe for '$targetItemName'.",
          level: LogLevel.warning);
      teamProvider.setTask(
          crafter.name, CharacterTask.idle); // Stop if recipe is invalid
      return;
    }

    // --- NEW: Crafting Skill Check ---
    final CraftSkill? requiredSkill = recipe.skill; // e.g., 'weaponcrafting'
    final int requiredLevel = recipe.level ?? 1;
    final int characterLevel = crafter.skills[requiredSkill]?.level ?? 1;

    if (characterLevel < requiredLevel) {
      LoggerService.instance.log(
          "AI: ${crafter.name} skill too low for '$targetItemName'. Needs $requiredSkill $requiredLevel, has $characterLevel.",
          level: LogLevel.warning);
      teamProvider.setTask(crafter.name, CharacterTask.idle); // Stop task
      return;
    }

    // Step 3: Check if we have the required materials in the bank.
    bool hasAllMaterials = true;
    for (final material in recipe.items ?? <SimpleItemSchema>[]) {
      final bankItem = bankProvider.items
          .firstWhereOrNull((item) => item.code == material.code);
      if (bankItem == null || bankItem.quantity < material.quantity) {
        hasAllMaterials = false;
        LoggerService.instance.log(
            "AI: ${crafter.name} is waiting for materials for '$targetItemName'. Missing: ${material.code}");
        break; // Stop checking, we're missing something.
      }
    }

    if (!hasAllMaterials) {
      return; // Wait for the hauler to deliver more materials.
    }

    // Step 4: If we have materials, check if we are at the correct crafting location.
    final forgeLocation = mapProvider.findNearestTile(crafter.location,
        (tile) => tile.content?.code == recipe.station); // e.g., 'forge'
    if (forgeLocation == null) {
      LoggerService.instance.log(
          "AI: ${crafter.name} cannot find a '${recipe.station}' to craft.",
          level: LogLevel.warning);
      return;
    }

    // Step 5: If we have materials AND are at the right location, queue the full crafting sequence!
    LoggerService.instance.log(
        "AI: ${crafter.name} has materials and is at the forge. Starting crafting sequence for '$targetItemName'.");

    // a) Withdraw all necessary materials.
    for (final material in recipe.items ?? <SimpleItemSchema>[]) {
      teamProvider.queueAction(crafter.name,
          actionFactory.createWithdrawAction(crafter.name, material));
    }
    LoggerService.instance
        .log("AI: ${crafter.name} is moving to the '${recipe.station}'.");
    teamProvider.queueAction(
        crafter.name,
        actionFactory.createMoveAction(
            crafter.name, forgeLocation.x, forgeLocation.y));
    // b) Craft the item.
    teamProvider.queueAction(crafter.name,
        actionFactory.createCraftAction(crafter.name, targetItemName));
    // c) Deposit the final product back into the bank.
    teamProvider.queueAction(
        crafter.name,
        actionFactory.createBankAction(
            crafter.name, BuiltList.of([targetItemName])));
  }
}
