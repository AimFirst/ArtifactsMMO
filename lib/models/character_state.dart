import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:flutter/material.dart';
import 'package:artifacts_api/artifacts_api.dart'; // Your generated models

class CharacterState with ChangeNotifier {
  CharacterSchema character;
  String lastAction;
  DateTime? cooldownEndsAt;
  bool isPerformingAction = false;
  String currentGoal = 'Idle'; // Default goal

  CharacterState({required this.character, this.lastAction = 'Idle'}) {
    cooldownEndsAt = character.cooldownExpiration;
  }

  bool get isOnCooldown {
    if (cooldownEndsAt == null) return false;
    return DateTime.now().isBefore(cooldownEndsAt!);
  }

  void updateCharacter(CharacterSchema newCharacterData) {
    character = newCharacterData;
    notifyListeners();
  }

  void setCurrentGoal(String goalName) {
    if (currentGoal != goalName) {
      currentGoal = goalName;
      notifyListeners();
    }
  }

  // Called before an API call
  void setActionInProgress(String actionName) {
    isPerformingAction = true;
    lastAction = '$actionName...';
    notifyListeners();
  }

  // Called after a successful API call
  void setActionComplete(
      CharacterSchema newCharacterData, CooldownSchema cooldownData) {
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

  void setCooldown(DateTime? cooldownEnd) {
    cooldownEndsAt = cooldownEnd;
    notifyListeners();
  }

  // Method to check inventory status
  // NOTE: Assumes your generated Character model has these properties.
  // You may need to adjust the field names (e.g., character.inventory.length).
  bool get isInventoryFull {
    return character.inventoryCount >= character.inventoryMaxItems;
  }

  bool get isInventoryNearlyFull {
    return character.inventoryCount >= character.inventoryMaxItems * 0.8;
  }
}
