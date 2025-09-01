import 'dart:async';
import 'dart:collection';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:artifacts_mmo/models/character_role.dart';
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/character_task.dart';
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

  TeamProvider(this._apiClient, this._mapProvider, this._worldDataProvider,
      this._bankProvider, this._teamBrainProvider) {
    _actionFactory = ActionFactory(_apiClient);
    _aiService = TeamAIService(_apiClient, this, _worldDataProvider,
        _bankProvider, _mapProvider, _combatService, _teamBrainProvider);
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
    required CharacterSchema character,
    required String actionName,
    // This now accepts a function that returns a Future of a dynamic Response
    required Future<Response<dynamic>> Function() apiCall,
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
        final CharacterSchema? updatedCharacter = data.data.character;
        final CooldownSchema? cooldown = data.data.cooldown;

        if (updatedCharacter != null && cooldown != null) {
          state.setActionComplete(updatedCharacter, cooldown);
        } else {
          // This error means the API changed its response format
          LoggerService.instance.log('Invalid response format', level: LogLevel.warning, character: character);
          state.setActionFailed('Invalid response format');
        }

        if (data.data is GiveItemDataSchema) {
          final CharacterSchema? updatedCharacter = data.data.receiverCharacter;
          if (updatedCharacter != null) {
            final characterToUpdate = _characterStates.firstWhereOrNull(
              (s) => s.character.name == updatedCharacter.name,
            );
            characterToUpdate?.updateCharacter(updatedCharacter);
          }
        }
      } else {
        LoggerService.instance.log('API Error ${response.statusCode}', level: LogLevel.warning, character: character);
        state.setActionFailed('API Error ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = "An unknown API error occurred.";
      LogLevel logLevel = LogLevel.error;

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
            state.setCooldown(5); // Assume a default cooldown on failure
            break;
          case 497: // code_character_inventory_full
            logLevel = LogLevel.info; // This is a state change, not an error
            state.needsHauling = true;
            break;
          case 493: // code_character_not_skill_level_required
            logLevel = LogLevel.warning;
            // The AI tried something it can't do. Stop the task to prevent loops.
            state.setTask(CharacterTask.idle);
            break;
          case 452: // code_token_invalid
          case 453: // code_token_expired
            // These are critical errors.
            errorMessage =
                "CRITICAL: API Token is invalid or expired. Please update it in settings.";
            break;
        }
      }

      LoggerService.instance.log(errorMessage, level: logLevel, character: character);
      state.setActionFailed(errorMessage);
    } catch (e) {
      LoggerService.instance.log('Error: $e', level: LogLevel.error, character: character);
      state.setActionFailed(
          'Error: ${character.name} ${e.toString().substring(0, 50)}',); // Keep error brief
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
    _gameLoopTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // --- THE AI LOGIC IS NOW A SINGLE, CLEAN LINE ---
      _aiService.updateAI(_characterStates);

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
        LoggerService.instance
            .log('Executing ${action.actionName}', character: character);
        performAction(
          character: character,
          actionName: action.actionName,
          apiCall: action.apiCall,
        );
        notifyListeners();
      }
    }
  }

  // New method for the UI to set a character's task
  void setTask(String characterName, CharacterTask task) {
    final state =
        _characterStates.firstWhere((s) => s.character.name == characterName);
    state.setTask(task);

    // When a task is changed, it's good practice to clear the old queue
    clearQueue(characterName);
  }

  void setGatheringTask(String characterName, GatheringSkill? skill) {
    final state =
        _characterStates.firstWhere((s) => s.character.name == characterName);
    state.setGatheringTask(skill);

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

  void setCraftingTask(String characterName, String? text) {
    final state =
        _characterStates.firstWhere((s) => s.character.name == characterName);
    state.setCraftingTask(text);
  }
}
