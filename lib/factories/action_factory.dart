// lib/factories/action_factory.dart

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/models/queued_action.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:built_collection/built_collection.dart';

// This is a simple factory class. Its only purpose is to create actions.
class ActionFactory {
  final ApiClient _apiClient;

  ActionFactory(this._apiClient);

  QueuedAction createMoveAction(String characterName, int x, int y) {
    return QueuedAction(
      actionName: 'Move to ($x, $y)',
      apiCall: () => _apiClient.myCharacters.actionMoveMyNameActionMovePost(
        name: characterName,
        destinationSchema: (DestinationSchemaBuilder()
              ..x = x
              ..y = y)
            .build(),
      ),
    );
  }

  QueuedAction createAcceptTaskAction(String characterName) {
    return QueuedAction(
      actionName: 'Accepting Task',
      apiCall: () => _apiClient.myCharacters.actionAcceptNewTaskMyNameActionTaskNewPost(name: characterName),
    );
  }

  QueuedAction createCompleteTaskAction(String characterName) {
    return QueuedAction(
      actionName: 'Completing Task',
      apiCall: () => _apiClient.myCharacters.actionCompleteTaskMyNameActionTaskCompletePost(name: characterName),
    );
  }

  QueuedAction createGiveItemsAction(
      CharacterSchema giver, String receiverName) {
    final inventory = giver.inventory;
    final items = BuiltList.of(inventory
            ?.where((item) => item.quantity > 0)
            .map((item) => (SimpleItemSchemaBuilder()
                  ..code = item.code
                  ..quantity = item.quantity)
                .build()) ??
        []);

    return QueuedAction(
        actionName: 'Give to $receiverName',
        // NOTE: Adjust to your actual generated API call for giving items
        apiCall: () =>
            _apiClient.myCharacters.actionGiveItemsMyNameActionGiveItemPost(
              name: giver.name,
              giveItemsSchema: (GiveItemsSchemaBuilder()
                    ..items = ListBuilder(items)
                    ..character = receiverName)
                  .build(),
            ));
  }

  QueuedAction createWithdrawAction(
      String characterName, SimpleItemSchema item) {
    return QueuedAction(
      actionName: 'Withdraw $item',
      apiCall: () => _apiClient.myCharacters
          .actionWithdrawBankItemMyNameActionBankWithdrawItemPost(
              name: characterName, simpleItemSchema: BuiltList.of([item])),
    );
  }

  QueuedAction createMineAction(String characterName) {
    return QueuedAction(
      actionName: 'Mine',
      apiCall: () =>
          _apiClient.myCharacters.actionGatheringMyNameActionGatheringPost(
        name: characterName,
      ),
    );
  }

  QueuedAction createEquipAction(
      String characterName, SimpleItemSchema item, ItemSlot slot) {
    return QueuedAction(
      actionName: 'Equip $item to $slot',
      apiCall: () =>
          _apiClient.myCharacters.actionEquipItemMyNameActionEquipPost(
              name: characterName,
              equipSchema: (EquipSchemaBuilder()
                    ..slot = slot
                    ..code = item.code
                    ..quantity = item.quantity)
                  .build()),
    );
  }

  QueuedAction createCraftAction(String characterName, SimpleItemSchema item) {
    return QueuedAction(
        actionName: 'Craft $item',
        // NOTE: Adjust to your actual generated API call for crafting
        apiCall: () =>
            _apiClient.myCharacters.actionCraftingMyNameActionCraftingPost(
                name: characterName,
                craftingSchema: (CraftingSchemaBuilder()
                      ..code = item.code
                      ..quantity = item.quantity)
                    .build()));
  }

  QueuedAction createBankAction(String characterName, SimpleItemSchema item) {
    return QueuedAction(
        actionName: 'Deposit $item',
        // Use the correct generated API call
        apiCall: () => _apiClient.myCharacters
                .actionDepositBankItemMyNameActionBankDepositItemPost(
              name: characterName,
              simpleItemSchema: BuiltList.of([item]),
            ));
  }

  QueuedAction createRestAction(String characterName) {
    return QueuedAction(
      actionName: 'Resting',
      apiCall: () => _apiClient.myCharacters
          .actionRestMyNameActionRestPost(name: characterName),
    );
  }

  QueuedAction createFightAction(String characterName) {
    return QueuedAction(
      actionName: 'Fighting',
      apiCall: () => _apiClient.myCharacters
          .actionFightMyNameActionFightPost(name: characterName),
    );
  }
}
