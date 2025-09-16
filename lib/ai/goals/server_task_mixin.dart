import 'package:artifacts_api/artifacts_api.dart' show CharacterSchema;
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/task_type.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';

mixin class ServerTaskMixin {
  bool taskDone(CharacterState state, BankProvider bankProvider,
      {bool checkBank = true}) {
    bool hasItems = false;
    if (state.character.taskType == TaskType.items.name) {
      final character = state.character;
      final targetItemName = character.task;
      int targetQuantity = character.taskTotal - character.taskProgress;

      // Check if we have enough items already
      targetQuantity -= character.inventory?.count(targetItemName) ?? 0;
      hasItems = targetQuantity <= 0;

      // Check if we have enough in the bank
      if (!hasItems && checkBank) {
        targetQuantity -= bankProvider.count(targetItemName);
        hasItems = targetQuantity <= 0;
      }
    }
    return state.character.taskProgress >= state.character.taskTotal ||
        hasItems;
  }

  bool hasTask(CharacterState state) {
    return state.character.task.isNotEmpty;
  }

  TaskType? taskType(CharacterState state) {
    if (state.character.taskType == TaskType.monsters.name) {
      return TaskType.monsters;
    } else if (state.character.taskType == TaskType.items.name) {
      return TaskType.items;
    } else {
      return null;
    }
  }

  String buildBrainRequestKeyPrefix(CharacterSchema character) {
    return 'task-${character.task}';
  }
}