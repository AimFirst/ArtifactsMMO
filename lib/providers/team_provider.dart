import 'dart:async';
import 'dart:collection';
import 'package:artifacts_mmo/data/database.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/equipment_loadout_result.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/queued_action.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

class TeamProvider with ChangeNotifier {
  final ApiClient _apiClient;
  final _combatService = CombatService();
  MapProvider _mapProvider; // Add a reference to MapProvider
  WorldDataProvider _worldDataProvider; // Add a reference
  BankProvider _bankProvider; // Add a reference
  TeamBrainProvider _teamBrainProvider;
  AppDatabase _appDatabase;
  late ActionFactory _actionFactory;

  List<CharacterState> _characterStates = []; // Use the new wrapper
  List<CharacterState> get characters => _characterStates;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ApiClient get apiClient => _apiClient;

  ActionFactory get actionFactory => _actionFactory;

  MapProvider get mapProvider => _mapProvider;

  Timer? _gameLoopTimer;
  final Map<String, Queue<QueuedAction>> _actionQueues = {};

  late final TeamAIService _aiService;

  TeamProvider(
    this._apiClient,
    this._mapProvider,
    this._worldDataProvider,
    this._bankProvider,
    this._teamBrainProvider,
    this._appDatabase,
  ) {
    _actionFactory = ActionFactory(_apiClient);
    _aiService = TeamAIService(
      _apiClient,
      this,
      _worldDataProvider,
      _bankProvider,
      _mapProvider,
      _combatService,
      _teamBrainProvider,
      _appDatabase,
    );
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

  Future<void> refreshCharacter(CharacterSchema character) async {
    try {
      final state = _characterStates
          .firstWhereOrNull((s) => s.character.name == character.name);
      if (state != null) {
        final updatedCharacter = await _apiClient.character
            .getCharacterCharactersNameGet(name: character.name);
        if (updatedCharacter.data?.data != null) {
          state.updateCharacter(updatedCharacter.data!.data);
        }
      }
    } catch (e) {
      LoggerService.instance.log('Error refreshing character: $e',
          level: LogLevel.warning, character: character);
    }
  }

  // Generic method to handle any character action
  // Generic method to handle any character action
  Future<void> performAction<T>({
    required CharacterSchema character,
    required String actionName,
    // This now accepts a function that returns a Future of a dynamic Response
    required Future<Response<T>> Function() apiCall,
  }) async {
    final state =
        _characterStates.firstWhere((s) => s.character.name == character.name);

    if (state.isOnCooldown || state.isPerformingAction) {
      LoggerService.instance
          .log("Busy. Action '$actionName' skipped.", character: character);
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
        final CharacterSchema? updatedCharacter = data?.data?.character;
        final CooldownSchema? cooldown = data?.data?.cooldown;

        if (updatedCharacter != null && cooldown != null) {
          state.setActionComplete(updatedCharacter, cooldown);
        } else {
          // This error means the API changed its response format
          LoggerService.instance.log('Invalid response format',
              level: LogLevel.warning, character: character);
          state.setActionFailed('Invalid response format');
        }

        if (data is BankItemTransactionResponseSchema) {
          _bankProvider.updateBankInventory(data.data.bank);
        } else if (data is GiveItemReponseSchema) {
          final receiverCharacter = data.data.receiverCharacter;
          final characterToUpdate = _characterStates.firstWhereOrNull(
            (s) => s.character.name == receiverCharacter.name,
          );
          characterToUpdate?.updateCharacter(receiverCharacter);
        } else if (data is CharacterSchema) {
          final characterToUpdate = _characterStates.firstWhereOrNull(
            (s) => s.character.name == character.name,
          );
          characterToUpdate?.updateCharacter(data);
          state.setActionComplete(
              data,
              (CooldownSchemaBuilder()..expiration = data.cooldownExpiration)
                  .build());
        }
      } else {
        _actionQueues[character.name]?.clear();
        LoggerService.instance.log('API Error ${response.statusCode}',
            level: LogLevel.warning, character: character);
        state.setActionFailed('API Error ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = "An unknown API error occurred.";
      LogLevel logLevel = LogLevel.error;
      try {
        if (e.response?.data != null) {
          final errorData = e.response!.data;
          // The API returns errors like {'code': 499, 'message': '...'}
          final code = errorData['code'];
          final message = errorData['message'];

          errorMessage = "Error (${character.name}) $code: $message";

          // Handle specific, non-critical errors
          switch (code) {
            case 499: // code_character_in_cooldown
            case 429: // code_too_many_requests
              logLevel = LogLevel
                  .warning; // This is an expected issue, not a critical error
              // We can also manually sync the cooldown based on the error
              state.setCooldown(DateTime.now().add(const Duration(
                  seconds: 5))); // Assume a default cooldown on failure
              break;
            case 497: // code_character_inventory_full
              logLevel = LogLevel.info; // This is a state change, not an error
              break;
            case 493: // code_character_not_skill_level_required
              logLevel = LogLevel.warning;
              break;
            case 452: // code_token_invalid
            case 453: // code_token_expired
              // These are critical errors.
              errorMessage =
                  "CRITICAL: API Token is invalid or expired. Please update it in settings.";
              break;
          }
        }
      } finally {
        _actionQueues[character.name]?.clear();
        LoggerService.instance
            .log(errorMessage, level: logLevel, character: character);
        state.setActionFailed(errorMessage);

        // Try to reset this character's status.
        await refreshCharacter(character);
      }
    } catch (e) {
      _actionQueues[character.name]?.clear();
      LoggerService.instance
          .log('Error: $e', level: LogLevel.error, character: character);
      state.setActionFailed(
        'Error: ${character.name} ${e.toString().substring(0, 50)}',
      ); // Keep error brief
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
    _gameLoopTimer?.cancel();
    _gameLoopTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      // --- THE AI LOGIC IS NOW A SINGLE, CLEAN LINE ---
      await _aiService.updateAI(_characterStates);

      // The queue processing remains here
      _processQueues();
    });
  }

  // Method to update the reference
  void updateBankProvider(BankProvider newProvider) {
    _bankProvider = newProvider;
  }

  void updateTeamBrainProvider(TeamBrainProvider newProvider) {
    _teamBrainProvider = newProvider;
  }

  // Method for ChangeNotifierProxyProvider to update the map reference
  void updateMapProvider(MapProvider newMapProvider) {
    _mapProvider = newMapProvider;
  }

  // Method for the proxy provider to update the reference
  void updateWorldDataProvider(WorldDataProvider newProvider) {
    _worldDataProvider = newProvider;
  }

  // We need to separate queue processing so the AI can queue multiple actions at once
  void _processQueues() {
    for (final state in _characterStates) {
      final character = state.character;
      final bool isReady = !state.isPerformingAction && !state.isOnCooldown;
      final queue = _actionQueues[character.name]!;

      // --- Queue Processing Logic (from the old loop) ---
      if (isReady && queue.isNotEmpty) {
        final action = queue.removeFirst();

        if (action.shouldPerform == null || action.shouldPerform!(state)) {
          LoggerService.instance
              .log('Executing ${action.actionName}', character: character);

          performAction(
            character: character,
            actionName: action.actionName,
            apiCall: action.apiCall,
          );
          notifyListeners();
        } else {
          LoggerService.instance.log(
              'Failed precheck, skipping ${action.actionName}',
              character: character);
        }
      }
    }
  }

  void togglePause(String characterName) {
    final state = _characterStates
        .firstWhereOrNull((s) => s.character.name == characterName);
    state?.togglePaused();
  }

  void togglePauseAll() {
    // Check if any character is currently active.
    final bool shouldPause = _characterStates.any((c) => !c.isPaused);

    // Set the paused state for every character.
    for (final state in _characterStates) {
      state.isPaused = shouldPause;
      // Also update their goal display if they are being resumed.
      if (!shouldPause) {
        state.currentGoal = 'Idle';
      }
    }

    LoggerService.instance.log(shouldPause
        ? "TEAM: Pausing all characters."
        : "TEAM: Resuming all characters.");
    notifyListeners();
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAvailableCharacterItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      {bool forceCalculate = false}) {
    return _aiService.bestLoadoutOfAvailableCharacterItems(
      character,
      gearContext,
      worldDataProvider,
      bankProvider,
      forceCalculate: forceCalculate,
    );
  }

  Future<EquipmentLoadoutResult> bestLoadoutOfAllItems(
      CharacterSchema character,
      GearEvaluationContext gearContext,
      WorldDataProvider worldDataProvider,
      {bool forceCalculate = false}) async {
    return await _aiService.bestLoadoutOfAllItems(
      character,
      gearContext,
      worldDataProvider,
      forceCalculate: forceCalculate,
    );
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    super.dispose();
  }
}
