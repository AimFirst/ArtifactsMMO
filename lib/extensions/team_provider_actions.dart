import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:built_collection/built_collection.dart';

extension TeamProviderActions on TeamProvider {
  static final _random = Random();

  void queueMoveTo(CharacterSchema character, DestinationSchema destination) {
    queueAction(
        character.name,
        actionFactory.createMoveAction(
            character.name, destination.x, destination.y));
  }

  void queueBankWithdraw(
      CharacterSchema character, BuiltList<SimpleItemSchema> items) {
    // find closest bank
    final bankLocation = mapProvider.findNearestTile(
        character.location, (tile) => tile.content?.code == 'bank');
    if (bankLocation == null) {
      LoggerService.instance.log('${character.name} couldn\'t find a bank!',
          level: LogLevel.warning);
      return;
    }

    queueMoveTo(character, bankLocation);

    queueAction(character.name,
        actionFactory.createBankWithdrawAction(character.name, items));
  }

  void queueBankDeposit(
      CharacterSchema character, BuiltList<SimpleItemSchema> items) {
    // find closest bank
    final bankLocation = mapProvider.findNearestTile(
        character.location, (tile) => tile.content?.code == 'bank');
    if (bankLocation == null) {
      LoggerService.instance.log('${character.name} couldn\'t find a bank!',
          level: LogLevel.warning);
      return;
    }

    queueMoveTo(character, bankLocation);

    queueAction(character.name,
        actionFactory.createBankDepositAction(character.name, items));
  }

  void queueTaskDeposit(CharacterState state) {
    // If the task is an item task, you have to deposit the items with the trader before you can complete the task
    if (state.character.taskType == TaskType.items.name &&
        (state.character.inventory?.count(state.character.task) ?? 0) > 0) {
      queueMoveToTaskMaster(state);

      final amountNeededToTurnIn =
          state.character.taskTotal - state.character.taskProgress;
      final amountInInventory =
          state.character.inventory?.count(state.character.task) ?? 0;
      final depositItemsAction = actionFactory.createTaskDepositAction(
          state.character.name,
          (SimpleItemSchemaBuilder()
                ..quantity = min(amountInInventory, amountNeededToTurnIn)
                ..code = state.character.task)
              .build());
      queueAction(state.character.name, depositItemsAction);

      // If we didn't deposit all of them, we need to try again.
      if (amountInInventory < amountNeededToTurnIn) {
        return;
      }
    }
  }

  void queueMoveToTaskMaster(CharacterState state) {
    // Find the nearest task master
    final taskMaster = findTaskMaster(state, mapProvider);

    if (taskMaster == null) {
      LoggerService.instance.log("AI: Can't find a task master.",
          level: LogLevel.warning, character: state.character);
      return;
    }

    queueMoveTo(state.character, taskMaster);
  }

  DestinationSchema? findTaskMaster(
      CharacterState state, MapProvider mapProvider) {
    final code = state.character.taskType.isEmpty
        ? (_random.nextBool() ? TaskType.monsters.name : TaskType.items.name)
        : state.character.taskType;
    return mapProvider.findNearestTile(
        state.character.location,
        (t) =>
            t.content?.type == MapContentType.tasksMaster &&
            t.content?.code == code);
  }
}
