// lib/providers/team_provider.dart

import 'dart:async';
import 'dart:collection';
import 'package:artifacts_mmo/extensions/craft_extension.dart';
import 'package:artifacts_mmo/extensions/item_extension.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_mmo/models/character_role.dart';
import 'package:artifacts_mmo/models/location_schema.dart';
import 'package:collection/collection.dart';
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/character_task.dart';
import 'package:artifacts_mmo/models/queued_action.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TeamProvider with ChangeNotifier {
  // --- NEW: Gear Policy Definition ---
  final Map<String, String> _gearPolicy = {
    'mining': 'copper_pickaxe',
    // 'woodcutting': 'Iron Axe', // Future policies
  };

  final ApiClient _apiClient;
  MapProvider _mapProvider; // Add a reference to MapProvider
  WorldDataProvider _worldDataProvider; // Add a reference
  BankProvider _bankProvider; // Add a reference

  List<CharacterState> _characterStates = []; // Use the new wrapper
  List<CharacterState> get characters => _characterStates;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ApiClient get apiClient => _apiClient;

  Timer? _gameLoopTimer;
  final Map<String, Queue<QueuedAction>> _actionQueues = {};

  TeamProvider(this._apiClient, this._mapProvider, this._worldDataProvider,
      this._bankProvider) {
    fetchAllCharacters().then((_) {
      // Initialize queues and start the game loop after characters are loaded
      for (var state in _characterStates) {
        _actionQueues[state.character.name] = Queue<QueuedAction>();
      }
      _startGameLoop();
    });
  }

  Future<void> fetchAllCharacters() async {
    _isLoading = true;
    notifyListeners();

    try {
      final charactersResponse =
          await _apiClient.myCharacters.getMyCharactersMyCharactersGet();
      if (charactersResponse.statusCode == 200 &&
          charactersResponse.data != null) {
        _characterStates = charactersResponse.data!.data
            .map((character) => CharacterState(character: character))
            .toList();
      }
    } catch (e) {
      LoggerService.instance.log("Error fetching characters: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Generic method to handle any character action
  // Generic method to handle any character action
  Future<void> performAction({
    required String characterName,
    required String actionName,
    // This now accepts a function that returns a Future of a dynamic Response
    required Future<Response<dynamic>> Function() apiCall,
  }) async {
    final state =
        _characterStates.firstWhere((s) => s.character.name == characterName);

    if (state.isOnCooldown || state.isPerformingAction) {
      LoggerService.instance
          .log("$characterName is busy. Action '$actionName' skipped.");
      return;
    }

    state.setActionInProgress(actionName);

    try {
      final response = await apiCall();
      final dynamic data = response.data;

      // Check if the response was successful and the data is valid
      if (response.statusCode == 200 && data != null) {
        // --- Robustly extract shared properties ---
        // We assume all successful action responses contain 'character' and 'cooldown'.
        // This is a safe way to access properties on a 'dynamic' object.
        final CharacterSchema? updatedCharacter = data.data.character;
        final CooldownSchema? cooldown = data.data.cooldown;

        if (updatedCharacter != null && cooldown != null) {
          state.setActionComplete(updatedCharacter, cooldown);
        } else {
          // This error means the API changed its response format
          state.setActionFailed('Invalid response format');
        }
      } else {
        state.setActionFailed('API Error ${response.statusCode}');
      }
    } catch (e) {
      state.setActionFailed(e.toString().substring(0, 50)); // Keep error brief
    }
  }

  // Method to get the queue for a character, used by the UI
  Queue<QueuedAction> getQueueFor(String characterName) {
    return _actionQueues[characterName] ?? Queue();
  }

  // New method for the UI to add actions
  void queueAction(String characterName, QueuedAction action) {
    _actionQueues[characterName]?.add(action);
    notifyListeners(); // Notify UI that queue count has changed
  }

  // New method for the UI to clear a queue
  void clearQueue(String characterName) {
    _actionQueues[characterName]?.clear();
    notifyListeners();
  }

  void _startGameLoop() {
    _gameLoopTimer?.cancel(); // Cancel any existing timer
    _gameLoopTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // The loop now does two things:
      // 1. Auto-queue actions based on the current task.
      // 2. Process the next action in the queue.
      _updateCharacterAI();
    });
  }

  // Method to update the reference
  void updateBankProvider(BankProvider newProvider) {
    _bankProvider = newProvider;
  }

  // Method for ChangeNotifierProxyProvider to update the map reference
  void updateMapProvider(MapProvider newMapProvider) {
    _mapProvider = newMapProvider;
  }

  // Method for the proxy provider to update the reference
  void updateWorldDataProvider(WorldDataProvider newProvider) {
    _worldDataProvider = newProvider;
  }

  // Renamed from _processQueues for clarity
  void _updateCharacterAI() {
    // We can't do anything without the map data
    if (_mapProvider.worldMap == null) return;

    // --- Find characters who need help ---
    final CharacterState? gathererNeedingHaul =
        _characterStates.firstWhereOrNull(
      (s) => s.role == CharacterRole.gatherer && s.needsHauling,
    );

    for (final state in _characterStates) {
      final characterName = state.character.name;
      final bool isReady = !state.isPerformingAction && !state.isOnCooldown;
      final queue = _actionQueues[characterName]!;

      // Only process AI if the character is idle and has an empty queue
      if (!isReady || queue.isNotEmpty) continue;

      // --- ROLE-BASED AI LOGIC ---
      switch (state.role) {
        case CharacterRole.gatherer:
          _updateGathererAI(state);
          break;
        case CharacterRole.hauler:
          _updateHaulerAI(state, gathererNeedingHaul);
          break;
        case CharacterRole.crafter:
          _updateCrafterAI(state);
          break;
        case CharacterRole.idle:
          break;
      }
    }

    _processQueues(); // We'll separate queue processing into its own loop
  }

  // --- NEW: AI logic for Crafters ---
  void _updateCrafterAI(CharacterState crafterState) {
    final crafter = crafterState.character;
    final targetItem = _gearPolicy['mining']!;
    final targetItemSchema = _worldDataProvider.getItemByCode(targetItem);

    // Step 1: Does the item already exist in the bank?
    if (_bankProvider.hasItem(targetItem)) {
      LoggerService.instance.log(
          "AI: ${crafter.name} sees '$targetItem' is already in the bank. Standing by.");
      return; // Do nothing, the item is already crafted.
    }

    // Step 2: Look up the recipe for the item.
    final CraftSchema? recipe = _worldDataProvider.getRecipeForItem(targetItem);
    if (recipe == null) {
      LoggerService.instance.log("AI: ${crafter.name} has no recipe for '$targetItem'.", level: LogLevel.warning);
      return;
    }

    // Step 3: Check if we have the required materials in the bank.
    bool hasAllMaterials = true;
    for (final material in recipe.items ?? <SimpleItemSchema>[]) {
      final bankItem = _bankProvider.items.firstWhereOrNull((item) => item.code == material.code);
      if (bankItem == null || bankItem.quantity < material.quantity) {
        hasAllMaterials = false;
        LoggerService.instance.log("AI: ${crafter.name} is waiting for materials for '$targetItem'. Missing: ${material.code}");
        break; // Stop checking, we're missing something.
      }
    }

    if (!hasAllMaterials) {
      return; // Wait for the hauler to deliver more materials.
    }

    // Step 4: If we have materials, check if we are at the correct crafting location.
    final forgeLocation = _findNearestTile(crafter.location, (tile) => tile.content?.code == recipe.station); // e.g., 'forge'
    if (forgeLocation == null) {
      LoggerService.instance.log("AI: ${crafter.name} cannot find a '${recipe.station}' to craft.", level: LogLevel.warning);
      return;
    }

    // Step 5: If we have materials AND are at the right location, queue the full crafting sequence!
    LoggerService.instance.log("AI: ${crafter.name} has materials and is at the forge. Starting crafting sequence for '$targetItem'.");

    // a) Withdraw all necessary materials.
    for (final material in recipe.items ?? <SimpleItemSchema>[]) {
      queueAction(crafter.name, _createWithdrawAction(crafter.name, material));
    }
    LoggerService.instance.log("AI: ${crafter.name} is moving to the '${recipe.station}'.");
    queueAction(crafter.name, _createMoveAction(crafter.name, forgeLocation.x, forgeLocation.y));
    // b) Craft the item.
    queueAction(crafter.name, _createCraftAction(crafter.name, targetItemSchema!.simpleItem));
    // c) Deposit the final product back into the bank.
    queueAction(crafter.name, _createBankAction(crafter.name, targetItemSchema.simpleItem));
  }

  // New AI logic for Gatherers
  void _updateGathererAI(CharacterState gathererState) {
    final gatherer = gathererState.character;

    // If we are waiting for a haul, our top priority is to check for a hauler.
    if (gathererState.needsHauling) {
      // Find a hauler that is on the same tile as us.
      final CharacterState? haulerOnTile = _characterStates.firstWhereOrNull(
        (s) =>
            s.role == CharacterRole.hauler &&
            s.character.location.x == gatherer.location.x &&
            s.character.location.y == gatherer.location.y,
      );

      if (haulerOnTile != null) {
        LoggerService.instance.log(
            "AI: ${gatherer.name} sees ${haulerOnTile.character.name} has arrived. Giving items.");
        // The hauler is here! Give them our items.
        queueAction(gatherer.name,
            _createGiveItemsAction(gatherer, haulerOnTile.character.name));
        // Our job is done, we no longer need hauling.
        gathererState.needsHauling = false;
      }
      // If no hauler is here yet, we just wait.
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
    if (gathererState.currentTask == CharacterTask.mineEndlessly) {
      // --- NEW MINING LOGIC ---
      final currentLocation = gatherer.location;
      final mapTiles = _mapProvider.worldMap!.tiles;

      // NOTE: Assumption: Character model has a map of skills, e.g., character.skills['mining']
      // Adjust 'mining' and the property access as needed.
      final int miningSkill = gatherer.miningLevel;

      // Function to check if a tile is a valid mining node for this character
      bool isMinable(MapSchema tile) {
        if (tile.content == null) return false;
        // Look up the resource details from our new provider!
        final resource =
            _worldDataProvider.getResourceByCode(tile.content!.code);
        if (resource == null) return false;

        // Check the details from the looked-up data
        return resource.skill == GatheringSkill.mining &&
            miningSkill >= resource.level;
      }

      // Step 1: Check if we're standing on a mineable node
      final currentTile = mapTiles.firstWhereOrNull(
        (tile) =>
            tile.x == currentLocation.x &&
            tile.y == currentLocation.y, // This should not happen
      );

      if (currentTile != null && isMinable(currentTile)) {
        LoggerService.instance
            .log("AI: ${gatherer.name} is on a rock. Queuing 'Mine'.");
        queueAction(gatherer.name, _createMineAction(gatherer.name));
      } else {
        // Step 2: If not, find the nearest rock and move to it
        // Find the nearest valid node on the entire map
        DestinationSchema? nearestNode =
            _findNearestTile(currentLocation, isMinable);

        if (nearestNode != null) {
          LoggerService.instance.log(
              "AI: ${gatherer.name} (Mining: $miningSkill) moving to nearest valid node at (${nearestNode.x}, ${nearestNode.y}).");
          queueAction(gatherer.name,
              _createMoveAction(gatherer.name, nearestNode.x, nearestNode.y));
        } else {
          LoggerService.instance.log(
              "AI: ${gatherer.name} (Mining: $miningSkill) cannot find any rocks they can mine on the map.",
              level: LogLevel.warning);
          // We can't find any valid rocks, so stop the task.
          setTask(gatherer.name, CharacterTask.idle);
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
      DestinationSchema? bankLocation = _findNearestTile(
          hauler.location, (tile) => tile.content?.code == 'bank');

      if (bankLocation != null) {
        LoggerService.instance.log(
            "AI: ${hauler.name} has items. Moving to bank at (${bankLocation.x}, ${bankLocation.y}).");
        // Step 2: Move to the bank
        queueAction(hauler.name,
            _createMoveAction(hauler.name, bankLocation.x, bankLocation.y));

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
          queueAction(hauler.name, _createBankAction(hauler.name, firstItem));
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
      // The hauler's only job is to move to the gatherer.
      queueAction(
        hauler.name,
        _createMoveAction(
          hauler.name,
          gathererToHelp.character.location.x,
          gathererToHelp.character.location.y,
        ),
      );
    }
    // If nobody needs help and our inventory is empty, we do nothing.
  }

  // We need to separate queue processing so the AI can queue multiple actions at once
  void _processQueues() {
    for (final state in _characterStates) {
      final characterName = state.character.name;
      final bool isReady = !state.isPerformingAction && !state.isOnCooldown;
      final queue = _actionQueues[characterName]!;

      // --- Queue Processing Logic (from the old loop) ---
      if (isReady && queue.isNotEmpty) {
        final action = queue.removeFirst();
        LoggerService.instance
            .log('Executing ${action.actionName} for $characterName');
        performAction(
          characterName: characterName,
          actionName: action.actionName,
          apiCall: action.apiCall,
        );
        notifyListeners();
      }
    }
  }

  // --- NEW: Logic for the Upgrade Gear task ---
  void _handleGearUpgrade(CharacterState gathererState) {
    final gatherer = gathererState.character;
    final String targetTool = _gearPolicy['mining']!; // e.g., 'Iron Pickaxe'

    // NOTE: Adjust property names for equipped items
    final bool hasBestTool = gatherer.weaponSlot == targetTool;

    if (hasBestTool) {
      LoggerService.instance.log(
          "AI: ${gatherer.name} already has the best tool. Switching to mining.");
      setTask(gatherer.name, CharacterTask.mineEndlessly);
    } else {
      final targetToolItem = (SimpleItemSchemaBuilder()
            ..code = targetTool
            ..quantity = 1)
          .build();
      // NEW: Check if the tool is waiting in the bank first!
      if (_bankProvider.hasItem(targetTool)) {
        LoggerService.instance.log(
            "AI: ${gatherer.name} sees '$targetTool' is in the bank. Moving to get it.");
        final bankLocation = _findNearestTile(
            gatherer.location, (tile) => tile.content?.code == 'bank');
        if (bankLocation != null) {
          queueAction(gatherer.name,
              _createMoveAction(gatherer.name, bankLocation.x, bankLocation.y));
          queueAction(gatherer.name,
              _createWithdrawAction(gatherer.name, targetToolItem));
          queueAction(
              gatherer.name,
              _createEquipAction(
                  gatherer.name, targetToolItem, ItemSlot.weapon));
        }
      } else {
        LoggerService.instance.log(
            "AI: ${gatherer.name} needs '$targetTool', but it's not in the bank. Waiting for crafter.");
        // We just wait. The crafter's AI will handle making the item.
      }
    }
  }

  // --- NEW: Helper for Withdraw and Equip Actions ---
  QueuedAction _createWithdrawAction(
      String characterName, SimpleItemSchema item) {
    return QueuedAction(
      actionName: 'Withdraw $item',
      apiCall: () => apiClient.myCharacters
          .actionWithdrawBankItemMyNameActionBankWithdrawItemPost(
              name: characterName, simpleItemSchema: BuiltList.of([item])),
    );
  }

  QueuedAction _createEquipAction(
      String characterName, SimpleItemSchema item, ItemSlot slot) {
    return QueuedAction(
      actionName: 'Equip $item to $slot',
      apiCall: () =>
          apiClient.myCharacters.actionEquipItemMyNameActionEquipPost(
              name: characterName,
              equipSchema: (EquipSchemaBuilder()
                    ..slot = slot
                    ..code = item.code
                    ..quantity = item.quantity)
                  .build()),
    );
  }

  // --- NEW: Helper for Crafting Action ---
  QueuedAction _createCraftAction(String characterName, SimpleItemSchema item) {
    return QueuedAction(
        actionName: 'Craft $item',
        // NOTE: Adjust to your actual generated API call for crafting
        apiCall: () =>
            apiClient.myCharacters.actionCraftingMyNameActionCraftingPost(
                name: characterName,
                craftingSchema: (CraftingSchemaBuilder()
                      ..code = item.code
                      ..quantity = item.quantity)
                    .build()));
  }

  // --- NEW "Give Items" Helper ---
  QueuedAction _createGiveItemsAction(
      CharacterSchema giver, String receiverName) {
    final inventory = giver.inventory;
    final items =
        BuiltList.of(inventory?.map((item) => (SimpleItemSchemaBuilder()
                  ..code = item.code
                  ..quantity = item.quantity)
                .build()) ??
            []);

    return QueuedAction(
        actionName: 'Give to $receiverName',
        // NOTE: Adjust to your actual generated API call for giving items
        apiCall: () =>
            apiClient.myCharacters.actionGiveItemsMyNameActionGiveItemPost(
              name: receiverName,
              giveItemsSchema: (GiveItemsSchemaBuilder()
                    ..items = ListBuilder(items))
                  .build(),
            ));
  }

  // REVISED Banking Action Helper
  QueuedAction _createBankAction(String characterName, SimpleItemSchema item) {
    return QueuedAction(
        actionName: 'Deposit $item',
        // Use the correct generated API call
        apiCall: () => apiClient.myCharacters
                .actionDepositBankItemMyNameActionBankDepositItemPost(
              name: characterName,
              simpleItemSchema: BuiltList.of([item]),
            ));
  }

  DestinationSchema? _findNearestTile(
      LocationSchema currentLocation, bool Function(MapSchema) predicate) {
    final tiles = _mapProvider.worldMap?.tiles ?? [];
    DestinationSchema? nearest;
    num minDistance = double.infinity;

    for (final tile in tiles) {
      // Use the provided predicate function to check if this is the tile we want
      if (predicate(tile)) {
        // Manhattan distance calculation
        final distance = (currentLocation.x - tile.x).abs() +
            (currentLocation.y - tile.y).abs();
        if (distance < minDistance) {
          minDistance = distance;
          nearest = (DestinationSchemaBuilder()
                ..x = tile.x
                ..y = tile.y)
              .build();
        }
      }
    }
    return nearest;
  }

  QueuedAction _createMoveAction(String characterName, int x, int y) {
    return QueuedAction(
      actionName: 'Move to ($x, $y)',
      apiCall: () => apiClient.myCharacters.actionMoveMyNameActionMovePost(
        name: characterName,
        destinationSchema: (DestinationSchemaBuilder()
              ..x = x
              ..y = y)
            .build(),
      ),
    );
  }

  // Helper function to create a mine action, avoiding code duplication
  QueuedAction _createMineAction(String characterName) {
    return QueuedAction(
      actionName: 'Mine',
      apiCall: () =>
          apiClient.myCharacters.actionGatheringMyNameActionGatheringPost(
        name: characterName,
      ),
    );
  }

  // New method for the UI to set a character's task
  void setTask(String characterName, CharacterTask task) {
    final state =
        _characterStates.firstWhere((s) => s.character.name == characterName);
    state.setTask(task);

    // When a task is changed, it's good practice to clear the old queue
    clearQueue(characterName);
  }

  // Method for the UI to set a role
  void setRole(String characterName, CharacterRole role) {
    final state =
        _characterStates.firstWhere((s) => s.character.name == characterName);
    state.setRole(role);
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    super.dispose();
  }
}
