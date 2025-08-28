// lib/services/team_ai_service.dart

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/craft_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_role.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/character_task.dart';
import 'package:artifacts_mmo/models/location_schema.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:collection/collection.dart';

// This is our "Brain". It's not a provider and has no UI logic.
class TeamAIService {
  final Map<GatheringSkill, String> _toolForSkill = {
    GatheringSkill.mining: 'copper_pickaxe',
    // 'woodcutting': 'Iron Axe', // Future policies
  };

  // This service holds references to the providers it needs to make decisions.
  final ApiClient _apiClient;
  final TeamProvider _teamProvider;
  final WorldDataProvider _worldDataProvider;
  final BankProvider _bankProvider;
  final MapProvider _mapProvider;
  final CombatService _combatService;
  late ActionFactory _actionFactory;

  TeamAIService(this._apiClient, this._teamProvider, this._worldDataProvider, this._bankProvider, this._mapProvider, this._combatService)  {
    _actionFactory = ActionFactory(_apiClient);
  }

  // This is the main entry point for the AI update cycle.
  void updateAI(List<CharacterState> characterStates) {
    // We can run pre-calculation logic here if needed, like finding who needs help.
    final CharacterState? gathererNeedingHaul = characterStates.firstWhereOrNull(
      (s) => s.role == CharacterRole.gatherer && s.needsHauling,
    );

    for (final state in characterStates) {
      final character = state.character;
      final bool isReady = !state.isPerformingAction && !state.isOnCooldown;
      final queue = _teamProvider.getQueueFor(character.name);

      if (!isReady || queue.isNotEmpty) continue;

      // The new task takes precedence over role-based AI
      if (state.currentTask == CharacterTask.completeServerTask) {
        _updateTaskingAI(state);
        continue; // Move to the next character
      }

      switch (state.role) {
        case CharacterRole.gatherer:
          _updateGathererAI(state, characterStates);
          break;
        case CharacterRole.hauler:
          _updateHaulerAI(state, gathererNeedingHaul);
          break;
        case CharacterRole.crafter:
          _updateCrafterAI(state);
          break;
        case CharacterRole.fighter:
          _updateFighterAI(state);
          break;
        case CharacterRole.idle:
          break;
      }
    }
  }

  void _updateTaskingAI(CharacterState state) {
    final character = state.character;

    // --- State 1: No Active Task ---
    // If the character has no task, their goal is to get one.
    if (character.task.isEmpty) {
      final taskMaster = _mapProvider.findNearestTile(character.location, (t) => t.content?.type == MapContentType.tasksMaster);
      if (taskMaster == null) {
        LoggerService.instance.log("AI: ${character.name} can't find a task master.", level: LogLevel.warning);
        return;
      }

      final taskMasterLocation = LocationSchema(x: taskMaster.x, y: taskMaster.y);
      if (character.location.x != taskMasterLocation.x || character.location.y != taskMasterLocation.y) {
        LoggerService.instance.log("AI: ${character.name} moving to Task Master at $taskMasterLocation.");
        _teamProvider.queueAction(character.name, _actionFactory.createMoveAction(character.name, taskMasterLocation.x, taskMasterLocation.y));
      } else {
        LoggerService.instance.log("AI: ${character.name} is at Task Master, accepting new task.");
        final acceptAction = _actionFactory.createAcceptTaskAction(character.name);
        _teamProvider.queueAction(character.name, acceptAction);
        // Remember where we got the task
        state.taskGiverLocation = taskMasterLocation;
      }
      return;
    }

    // --- State 2: Task is Complete ---
    // If progress is met, the goal is to turn it in.
    if (character.taskProgress >= character.taskTotal) {
      final turnInLocation = state.taskGiverLocation;
      if (turnInLocation == null) {
        LoggerService.instance.log("AI: ${character.name} has a completed task but forgot where to turn it in!", level: LogLevel.error);
        return;
      }

      if (character.location.x != turnInLocation.x || character.location.y != turnInLocation.y) {
        LoggerService.instance.log("AI: ${character.name} moving to turn in task at $turnInLocation.");
        _teamProvider.queueAction(character.name, _actionFactory.createMoveAction(character.name, turnInLocation.x, turnInLocation.y));
      } else {
        LoggerService.instance.log("AI: ${character.name} turning in completed task: ${character.task}.");
        final completeAction = _actionFactory.createCompleteTaskAction(character.name);
        _teamProvider.queueAction(character.name, completeAction);
      }
      return;
    }

    // --- State 3: Task is In Progress ---
    // Perform the action needed to make progress.
    switch (character.taskType) {
      case 'monsters':
        final targetMonsterCode = character.task;
          _updateFighterAi(state, (character, tile) => tile.content?.code == targetMonsterCode);
        break;
      case 'items':
        final targetItemName = character.task;
        // This is the most complex part, requiring team cooperation.
        // For now, we'll assume the character must acquire it themselves.
        // A future step is to create a team-wide "request" for the item.
        if (character.inventory?.any((item) => item.code == targetItemName) ?? false) {
          // We have the item, now we just need the full quantity.
          // For now, we'll assume we have enough and head to turn-in.
          // state.character.taskProgress = state.character.taskTotal;
        } else {
          LoggerService.instance.log("AI: ${character.name} needs to acquire '$targetItemName'. Delegating to Crafter AI.");
          // We can temporarily assign a crafting sub-task
          // This is a great place for more advanced team-wide AI later.
        }
        break;
    }
  }

  void _updateFighterAi(CharacterState fighterState,bool Function(CharacterSchema, MapSchema) test) {
    final fighter = fighterState.character;

    // Priority 1: SURVIVAL. Heal if health is low.
    if (fighter.hp < fighter.maxHp) {
      LoggerService.instance.log("AI: ${fighter.name}'s health is low. Resting.");
      final restAction = _actionFactory.createRestAction(fighter.name);
      _teamProvider.queueAction(fighter.name, restAction);
      return; // Do nothing else until health is restored.
    }

    // Step 1: Find ALL monster tiles.
    final allMonsterTiles = _mapProvider.worldMap?.tiles
        .where((tile) => tile.content?.type == MapContentType.monster) ?? <MapSchema>[];

    // Step 2: Find all targets that match our criteria
    final winnableTargets = allMonsterTiles.where((tile) => test(fighter, tile)).toList();

    // Step 3: Find the closest winnable target
    if (winnableTargets.isEmpty) {
      LoggerService.instance.log("AI: ${fighter.name} cannot find any monsters.", level: LogLevel.warning);
      return;
    }

    final monsterTile = _mapProvider.findNearestTile(
      fighter.location,
          (tile) => winnableTargets.contains(tile),
    );

    if (monsterTile == null) {
      LoggerService.instance.log("AI: ${fighter.name} cannot find any monsters.", level: LogLevel.warning);
      return; // No targets found, do nothing.
    }

    final monsterLocation = LocationSchema(x: monsterTile.x, y: monsterTile.y);
    final currentLocation = LocationSchema(x: fighter.location.x, y: fighter.location.y);

    // Priority 3: Engage the target.
    if (currentLocation != monsterLocation) {
      // We are not on the monster's tile yet, so move there.
      LoggerService.instance.log("AI: ${fighter.name} moving to engage monster at $monsterLocation.");
      final moveAction = _actionFactory.createMoveAction(fighter.name, monsterLocation.x, monsterLocation.y);
      _teamProvider.queueAction(fighter.name, moveAction);
    } else {
      // We are on the same tile. Fight!
      LoggerService.instance.log("AI: ${fighter.name} is on the monster's tile. Engaging in combat!");
      final fightAction = _actionFactory.createFightAction(fighter.name);
      _teamProvider.queueAction(fighter.name, fightAction);
    }
  }

  void _updateFighterAI(CharacterState fighterState) {
    // If we are assigned the hunt task, let's find a monster.
    if (fighterState.currentTask == CharacterTask.huntMonsters) {
      _updateFighterAi(fighterState, (fighter, tile) {
        final monsterData = _worldDataProvider.getMonsterByCode(tile.content!.code);
        return monsterData != null && _combatService.canWinFight(fighter, monsterData);
      });
    }
  }

  void _updateGathererAI(CharacterState gathererState, List<CharacterState> characterStates) {
    final gatherer = gathererState.character;

    // If we are waiting for a haul, our top priority is to check for a hauler.
    if (gathererState.needsHauling) {
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
        _teamProvider.queueAction(gatherer.name,
            _actionFactory.createGiveItemsAction(gatherer, haulerOnTile.character.name));
        // Our job is done, we no longer need hauling.
        gathererState.needsHauling = false;
      }
      return;
    }

    // Check inventory status.
    if (gathererState.isInventoryFull) {
      LoggerService.instance
          .log("AI: ${gatherer.name}'s inventory is full. Requesting haul.");
      gathererState.needsHauling = true;
      return; // Stop and wait for a hauler
    }

    // Handle the new upgrade task
    if (gathererState.currentTask == CharacterTask.upgradeGear) {
      _handleGearUpgrade(gathererState);
      return; // Don't do other tasks while upgrading
    }

    // This is the existing logic from the previous step
    if (gathererState.currentTask == CharacterTask.gatherEndlessly) {
      final mapTiles = _mapProvider.worldMap!.tiles;
      final gatherer = gathererState.character;
      final currentLocation = gatherer.location;
      final designatedSkill = gathererState.designatedGatheringSkill;

      if (designatedSkill == null) return; // Should not happen, but safe to check

      // Function to check if a tile is valid for this character
      bool isGatherable(MapSchema tile) {
        if (tile.content == null) return false;
        final resource = _worldDataProvider.getResourceByCode(tile.content!.code);
        if (resource == null) return false;
        if (resource.skill != designatedSkill) return false;

        // Get the specific skill required (e.g., 'mining')
        final GatheringSkill requiredSkillName = resource.skill;
        final int requiredSkillLevel = resource.level;

        // Get the character's current level for that skill
        final int characterSkillLevel = gatherer.gatheringSkills[requiredSkillName]?.level ?? 1;

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
        LoggerService.instance
            .log("AI: ${gatherer.name} is at ${currentTile.content?.code}. Queuing 'Gather'.");
        _teamProvider.queueAction(gatherer.name, _actionFactory.createMineAction(gatherer.name));
      } else {
        // Step 2: If not, find the nearest rock and move to it
        // Find the nearest valid node on the entire map
        DestinationSchema? nearestNode =
        _mapProvider.findNearestTile(currentLocation, isGatherable);

        if (nearestNode != null) {
          LoggerService.instance.log(
              "AI: ${gatherer.name} (Mining: $miningSkill) moving to nearest valid node at (${nearestNode.x}, ${nearestNode.y}).");
          _teamProvider.queueAction(gatherer.name,
              _actionFactory.createMoveAction(gatherer.name, nearestNode.x, nearestNode.y));
        } else {
          LoggerService.instance.log(
              "AI: ${gatherer.name} (Mining: $miningSkill) cannot find any rocks they can mine on the map.",
              level: LogLevel.warning);
          // We can't find any valid rocks, so stop the task.
          _teamProvider.setTask(gatherer.name, CharacterTask.idle);
        }
      }
    }
  }

  void _updateHaulerAI(
      CharacterState haulerState, CharacterState? gathererToHelp) {
    final hauler = haulerState.character;

    // Priority 1: If we have items, our job is to bank them.
    if (hauler.inventoryCount > 0) {
      LoggerService.instance
          .log("AI: ${hauler.name} has items. Moving to bank.");
      // Step 1: Find the bank dynamically
      DestinationSchema? bankLocation = _mapProvider.findNearestTile(
          hauler.location, (tile) => tile.content?.code == 'bank');

      if (bankLocation != null) {
        LoggerService.instance.log(
            "AI: ${hauler.name} has items. Moving to bank at (${bankLocation.x}, ${bankLocation.y}).");
        // Step 2: Move to the bank
        if (hauler.location.x != bankLocation.x || hauler.location.y != bankLocation.y) {
          _teamProvider.queueAction(hauler.name,
              _actionFactory.createMoveAction(
                  hauler.name, bankLocation.x, bankLocation.y));
        }

        // Step 3: Deposit items (one at a time)
        // For simplicity, we'll just deposit the first item in the inventory.
        // The AI loop will trigger again next cycle to deposit the next one.
        final firstItem = hauler.inventory
            ?.where((i) => i.quantity > 0)
            .map((i) => (SimpleItemSchemaBuilder()
          ..code = i.code
          ..quantity = i.quantity)
            .build())
            .firstOrNull;
        if (firstItem != null) {
          _teamProvider.queueAction(hauler.name, _actionFactory.createBankAction(hauler.name, firstItem));
        } else {
          LoggerService.instance
              .log("AI: ${hauler.name} has no items to bank.");
        }
      } else {
        LoggerService.instance.log(
            "AI: ${hauler.name} has items but cannot find a bank on the map!");
      }
      return;
    }

    // Priority 2: If we are idle and someone needs help, go to them.
    if (gathererToHelp != null) {
      LoggerService.instance.log(
          "AI: ${hauler.name} is responding to ${gathererToHelp.character.name}'s request.");

      if (hauler.location == gathererToHelp.character.location) {
        // Just waiting for them to give me items.
        return;
      }

      // The hauler's only job is to move to the gatherer.
      _teamProvider.queueAction(
        hauler.name,
        _actionFactory.createMoveAction(
          hauler.name,
          gathererToHelp.character.location.x,
          gathererToHelp.character.location.y,
        ),
      );
    }
    // If nobody needs help and our inventory is empty, we do nothing.
  }

  void _updateCrafterAI(CharacterState crafterState) {
    if (crafterState.currentTask != CharacterTask.craftEndlessly) return;

    final crafter = crafterState.character;
    final worldData = _worldDataProvider;

    // Step 1: Get the target item from the character's state.
    final SimpleItemSchema? targetItemName = crafterState.designatedCraftingItem;
    if (targetItemName == null) return;

    // Step 2: Look up the recipe for the item.
    final CraftSchema? recipe = worldData.getRecipeForItem(targetItemName.code);
    if (recipe == null) {
      LoggerService.instance.log("AI: ${crafter.name} has no recipe for '$targetItemName'.", level: LogLevel.warning);
      _teamProvider.setTask(crafter.name, CharacterTask.idle); // Stop if recipe is invalid
      return;
    }

    // --- NEW: Crafting Skill Check ---
    final CraftSkill? requiredSkill = recipe.skill; // e.g., 'weaponcrafting'
    final int requiredLevel = recipe.level ?? 1;
    final int characterLevel = crafter.skills[requiredSkill]?.level ?? 1;

    if (characterLevel < requiredLevel) {
      LoggerService.instance.log(
          "AI: ${crafter.name} skill too low for '$targetItemName'. Needs $requiredSkill $requiredLevel, has $characterLevel.",
          level: LogLevel.warning
      );
      _teamProvider.setTask(crafter.name, CharacterTask.idle); // Stop task
      return;
    }



    // final crafter = crafterState.character;
    // final targetItem = _toolForSkill[GatheringSkill.mining]!;
    // final targetItemSchema = _worldDataProvider.getItemByCode(targetItem);
    //
    // // Step 1: Does the item already exist in the bank?
    // if (_bankProvider.hasItem(targetItem)) {
    //   LoggerService.instance.log(
    //       "AI: ${crafter.name} sees '$targetItem' is already in the bank. Standing by.");
    //   return; // Do nothing, the item is already crafted.
    // }
    //
    // // Step 2: Look up the recipe for the item.
    // final CraftSchema? recipe = _worldDataProvider.getRecipeForItem(targetItem);
    // if (recipe == null) {
    //   LoggerService.instance.log("AI: ${crafter.name} has no recipe for '$targetItem'.", level: LogLevel.warning);
    //   return;
    // }

    // Step 3: Check if we have the required materials in the bank.
    bool hasAllMaterials = true;
    for (final material in recipe.items ?? <SimpleItemSchema>[]) {
      final bankItem = _bankProvider.items.firstWhereOrNull((item) => item.code == material.code);
      if (bankItem == null || bankItem.quantity < material.quantity) {
        hasAllMaterials = false;
        LoggerService.instance.log("AI: ${crafter.name} is waiting for materials for '$targetItemName'. Missing: ${material.code}");
        break; // Stop checking, we're missing something.
      }
    }

    if (!hasAllMaterials) {
      return; // Wait for the hauler to deliver more materials.
    }

    // Step 4: If we have materials, check if we are at the correct crafting location.
    final forgeLocation = _mapProvider.findNearestTile(crafter.location, (tile) => tile.content?.code == recipe.station); // e.g., 'forge'
    if (forgeLocation == null) {
      LoggerService.instance.log("AI: ${crafter.name} cannot find a '${recipe.station}' to craft.", level: LogLevel.warning);
      return;
    }

    // Step 5: If we have materials AND are at the right location, queue the full crafting sequence!
    LoggerService.instance.log("AI: ${crafter.name} has materials and is at the forge. Starting crafting sequence for '$targetItemName'.");

    // a) Withdraw all necessary materials.
    for (final material in recipe.items ?? <SimpleItemSchema>[]) {
      _teamProvider.queueAction(crafter.name, _actionFactory.createWithdrawAction(crafter.name, material));
    }
    LoggerService.instance.log("AI: ${crafter.name} is moving to the '${recipe.station}'.");
    _teamProvider.queueAction(crafter.name, _actionFactory.createMoveAction(crafter.name, forgeLocation.x, forgeLocation.y));
    // b) Craft the item.
    _teamProvider.queueAction(crafter.name, _actionFactory.createCraftAction(crafter.name, targetItemName));
    // c) Deposit the final product back into the bank.
    _teamProvider.queueAction(crafter.name, _actionFactory.createBankAction(crafter.name, targetItemName));
  }


  void _handleGearUpgrade(CharacterState gathererState) {
    final gatherer = gathererState.character;
    final String targetTool = _toolForSkill[GatheringSkill.mining]!; // e.g., 'Iron Pickaxe'

    // NOTE: Adjust property names for equipped items
    final bool hasBestTool = gatherer.weaponSlot == targetTool;

    if (hasBestTool) {
      LoggerService.instance.log(
          "AI: ${gatherer.name} already has the best tool. Switching to mining.");
      _teamProvider.setTask(gatherer.name, CharacterTask.gatherEndlessly);
    } else {
      final targetToolItem = (SimpleItemSchemaBuilder()
        ..code = targetTool
        ..quantity = 1)
          .build();
      // NEW: Check if the tool is waiting in the bank first!
      if (_bankProvider.hasItem(targetTool)) {
        LoggerService.instance.log(
            "AI: ${gatherer.name} sees '$targetTool' is in the bank. Moving to get it.");
        final bankLocation = _mapProvider.findNearestTile(
            gatherer.location, (tile) => tile.content?.code == 'bank');
        if (bankLocation != null) {
          _teamProvider.queueAction(gatherer.name,
              _actionFactory.createMoveAction(gatherer.name, bankLocation.x, bankLocation.y));
          _teamProvider.queueAction(gatherer.name,
              _actionFactory.createWithdrawAction(gatherer.name, targetToolItem));
          _teamProvider.queueAction(
              gatherer.name,
              _actionFactory.createEquipAction(
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
