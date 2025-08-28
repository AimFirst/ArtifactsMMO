import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/ai_strategy.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_role.dart';
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
import 'package:collection/collection.dart';

class GathererStrategy implements AIStrategy {
  final Map<GatheringSkill, String> _toolForSkill = {
    GatheringSkill.mining: 'copper_pickaxe',
    // 'woodcutting': 'Iron Axe', // Future policies
  };

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
    final gatherer = state.character;

    // If we are waiting for a haul, our top priority is to check for a hauler.
    if (state.needsHauling) {
      // Find a hauler that is on the same tile as us.
      final CharacterState? haulerOnTile = characterStates.firstWhereOrNull(
        (s) =>
            s.role == CharacterRole.hauler &&
            s.character.location.x == gatherer.location.x &&
            s.character.location.y == gatherer.location.y,
      );

      if (haulerOnTile != null) {
        LoggerService.instance.log(
            "AI: ${gatherer.name} sees ${haulerOnTile.character.name} has arrived. Giving items.");
        // The hauler is here! Give them our items.
        teamProvider.queueAction(
            gatherer.name,
            actionFactory.createGiveItemsAction(
                gatherer, haulerOnTile.character.name));
        // Our job is done, we no longer need hauling.
        state.needsHauling = false;
      }
      return;
    }

    // Check inventory status.
    if (state.isInventoryFull) {
      LoggerService.instance
          .log("AI: ${gatherer.name}'s inventory is full. Requesting haul.");
      state.needsHauling = true;
      return; // Stop and wait for a hauler
    }

    // Handle the new upgrade task
    if (state.currentTask == CharacterTask.upgradeGear) {
      _handleGearUpgrade(
          state, teamProvider, bankProvider, mapProvider, actionFactory);
      return; // Don't do other tasks while upgrading
    }

    // This is the existing logic from the previous step
    if (state.currentTask == CharacterTask.gatherEndlessly) {
      final mapTiles = mapProvider.worldMap!.tiles;
      final gatherer = state.character;
      final currentLocation = gatherer.location;
      final designatedSkill = state.designatedGatheringSkill;

      if (designatedSkill == null)
        return; // Should not happen, but safe to check

      // Function to check if a tile is valid for this character
      bool isGatherable(MapSchema tile) {
        if (tile.content == null) return false;
        final resource =
            worldDataProvider.getResourceByCode(tile.content!.code);
        if (resource == null) return false;
        if (resource.skill != designatedSkill) return false;

        // Get the specific skill required (e.g., 'mining')
        final GatheringSkill requiredSkillName = resource.skill;
        final int requiredSkillLevel = resource.level;

        // Get the character's current level for that skill
        final int characterSkillLevel =
            gatherer.gatheringSkills[requiredSkillName]?.level ?? 1;

        return characterSkillLevel >= requiredSkillLevel;
      }

      // NOTE: Assumption: Character model has a map of skills, e.g., character.skills['mining']
      // Adjust 'mining' and the property access as needed.
      final int miningSkill = gatherer.miningLevel;

      // Step 1: Check if we're standing on a mineable node
      final currentTile = mapTiles.firstWhereOrNull(
        (tile) =>
            tile.x == currentLocation.x &&
            tile.y == currentLocation.y, // This should not happen
      );

      if (currentTile != null && isGatherable(currentTile)) {
        LoggerService.instance.log(
            "AI: ${gatherer.name} is at ${currentTile.content?.code}. Queuing 'Gather'.");
        teamProvider.queueAction(
            gatherer.name, actionFactory.createMineAction(gatherer.name));
      } else {
        // Step 2: If not, find the nearest rock and move to it
        // Find the nearest valid node on the entire map
        DestinationSchema? nearestNode =
            mapProvider.findNearestTile(currentLocation, isGatherable);

        if (nearestNode != null) {
          LoggerService.instance.log(
              "AI: ${gatherer.name} (Mining: $miningSkill) moving to nearest valid node at (${nearestNode.x}, ${nearestNode.y}).");
          teamProvider.queueAction(
              gatherer.name,
              actionFactory.createMoveAction(
                  gatherer.name, nearestNode.x, nearestNode.y));
        } else {
          LoggerService.instance.log(
              "AI: ${gatherer.name} (Mining: $miningSkill) cannot find any rocks they can mine on the map.",
              level: LogLevel.warning);
          // We can't find any valid rocks, so stop the task.
          teamProvider.setTask(gatherer.name, CharacterTask.idle);
        }
      }
    }
  }

  void _handleGearUpgrade(
    CharacterState gathererState,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    MapProvider mapProvider,
    ActionFactory actionFactory,
  ) {
    final gatherer = gathererState.character;
    final String targetTool =
        _toolForSkill[GatheringSkill.mining]!; // e.g., 'Iron Pickaxe'

    // NOTE: Adjust property names for equipped items
    final bool hasBestTool = gatherer.weaponSlot == targetTool;

    if (hasBestTool) {
      LoggerService.instance.log(
          "AI: ${gatherer.name} already has the best tool. Switching to mining.");
      teamProvider.setTask(gatherer.name, CharacterTask.gatherEndlessly);
    } else {
      final targetToolItem = (SimpleItemSchemaBuilder()
            ..code = targetTool
            ..quantity = 1)
          .build();
      // NEW: Check if the tool is waiting in the bank first!
      if (bankProvider.hasItem(targetTool)) {
        LoggerService.instance.log(
            "AI: ${gatherer.name} sees '$targetTool' is in the bank. Moving to get it.");
        final bankLocation = mapProvider.findNearestTile(
            gatherer.location, (tile) => tile.content?.code == 'bank');
        if (bankLocation != null) {
          teamProvider.queueAction(
              gatherer.name,
              actionFactory.createMoveAction(
                  gatherer.name, bankLocation.x, bankLocation.y));
          teamProvider.queueAction(
              gatherer.name,
              actionFactory.createWithdrawAction(
                  gatherer.name, targetToolItem));
          teamProvider.queueAction(
              gatherer.name,
              actionFactory.createEquipAction(
                  gatherer.name, targetToolItem, ItemSlot.weapon));
        }
      } else {
        LoggerService.instance.log(
            "AI: ${gatherer.name} needs '$targetTool', but it's not in the bank. Waiting for crafter.");
        // We just wait. The crafter's AI will handle making the item.
      }
    }
  }
}
