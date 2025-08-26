// lib/models/character_state.dart

import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/models/character_role.dart';
import 'package:artifacts_mmo/models/character_task.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:artifacts_api/artifacts_api.dart'; // Your generated models

class CharacterState with ChangeNotifier {
  CharacterSchema character;
  String lastAction;
  DateTime? cooldownEndsAt;
  bool isPerformingAction = false;
  CharacterTask currentTask = CharacterTask.idle; // Add this line
  CharacterRole role = CharacterRole.idle; // Default role
  bool needsHauling = false; // Flag to signal for help

  CharacterState({required this.character, this.lastAction = 'Idle'});

  bool get isOnCooldown {
    if (cooldownEndsAt == null) return false;
    return DateTime.now().isBefore(cooldownEndsAt!);
  }

  void updateCharacter(CharacterSchema newCharacterData) {
    character = newCharacterData;
  }

  // Called before an API call
  void setActionInProgress(String actionName) {
    isPerformingAction = true;
    lastAction = '$actionName...';
    notifyListeners();
  }

  // Called after a successful API call
  void setActionComplete(CharacterSchema newCharacterData, CooldownSchema cooldownData) {
    character = newCharacterData;
    isPerformingAction = false;
    lastAction = '${lastAction.replaceAll('...', '')} - Success';
    cooldownEndsAt = cooldownData.expiration;
    notifyListeners();
  }

  // Called after a failed API call
  void setActionFailed(String error) {
    isPerformingAction = false;
    lastAction = '${lastAction.replaceAll('...', '')} - Failed: $error';
    notifyListeners();
  }

  // Add a method to update the task
  void setTask(CharacterTask newTask) {
    if (currentTask != newTask) {
      currentTask = newTask;
      LoggerService.instance.log("${character.name} task set to: $newTask");
      notifyListeners();
    }
  }

  void setRole(CharacterRole newRole) {
    if (role != newRole) {
      role = newRole;
      LoggerService.instance.log("${character.name} role set to: $newRole");
      notifyListeners();
    }
  }

  // Method to check inventory status
  // NOTE: Assumes your generated Character model has these properties.
  // You may need to adjust the field names (e.g., character.inventory.length).
  bool get isInventoryFull {
    return character.inventoryCount >= character.inventoryMaxItems;
  }
}