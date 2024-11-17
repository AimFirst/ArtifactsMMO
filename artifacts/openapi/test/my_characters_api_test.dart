import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for MyCharactersApi
void main() {
  final instance = ArtifactsApi().getMyCharactersApi();

  group(MyCharactersApi, () {
    // Action Accept New Task
    //
    // Accepting a new task.
    //
    //Future<TaskResponseSchema> actionAcceptNewTaskMyNameActionTaskNewPost(String name) async
    test('test actionAcceptNewTaskMyNameActionTaskNewPost', () async {
      // TODO
    });

    // Action Buy Bank Expansion
    //
    // Buy a 20 slots bank expansion.
    //
    //Future<BankExtensionTransactionResponseSchema> actionBuyBankExpansionMyNameActionBankBuyExpansionPost(String name) async
    test('test actionBuyBankExpansionMyNameActionBankBuyExpansionPost',
        () async {
      // TODO
    });

    // Action Complete Task
    //
    // Complete a task.
    //
    //Future<TasksRewardDataResponseSchema> actionCompleteTaskMyNameActionTaskCompletePost(String name) async
    test('test actionCompleteTaskMyNameActionTaskCompletePost', () async {
      // TODO
    });

    // Action Crafting
    //
    // Crafting an item. The character must be on a map with a workshop.
    //
    //Future<SkillResponseSchema> actionCraftingMyNameActionCraftingPost(String name, CraftingSchema craftingSchema) async
    test('test actionCraftingMyNameActionCraftingPost', () async {
      // TODO
    });

    // Action Delete Item
    //
    // Delete an item from your character's inventory.
    //
    //Future<DeleteItemResponseSchema> actionDeleteItemMyNameActionDeletePost(String name, SimpleItemSchema simpleItemSchema) async
    test('test actionDeleteItemMyNameActionDeletePost', () async {
      // TODO
    });

    // Action Deposit Bank Gold
    //
    // Deposit gold in a bank on the character's map.
    //
    //Future<BankGoldTransactionResponseSchema> actionDepositBankGoldMyNameActionBankDepositGoldPost(String name, DepositWithdrawGoldSchema depositWithdrawGoldSchema) async
    test('test actionDepositBankGoldMyNameActionBankDepositGoldPost', () async {
      // TODO
    });

    // Action Deposit Bank
    //
    // Deposit an item in a bank on the character's map.
    //
    //Future<BankItemTransactionResponseSchema> actionDepositBankMyNameActionBankDepositPost(String name, SimpleItemSchema simpleItemSchema) async
    test('test actionDepositBankMyNameActionBankDepositPost', () async {
      // TODO
    });

    // Action Equip Item
    //
    // Equip an item on your character.
    //
    //Future<EquipmentResponseSchema> actionEquipItemMyNameActionEquipPost(String name, EquipSchema equipSchema) async
    test('test actionEquipItemMyNameActionEquipPost', () async {
      // TODO
    });

    // Action Fight
    //
    // Start a fight against a monster on the character's map.
    //
    //Future<CharacterFightResponseSchema> actionFightMyNameActionFightPost(String name) async
    test('test actionFightMyNameActionFightPost', () async {
      // TODO
    });

    // Action Gathering
    //
    // Harvest a resource on the character's map.
    //
    //Future<SkillResponseSchema> actionGatheringMyNameActionGatheringPost(String name) async
    test('test actionGatheringMyNameActionGatheringPost', () async {
      // TODO
    });

    // Action Ge Buy Item
    //
    // Buy an item at the Grand Exchange on the character's map.
    //
    //Future<GETransactionResponseSchema> actionGeBuyItemMyNameActionGrandexchangeBuyPost(String name, GEBuyOrderSchema gEBuyOrderSchema) async
    test('test actionGeBuyItemMyNameActionGrandexchangeBuyPost', () async {
      // TODO
    });

    // Action Ge Cancel Sell Order
    //
    // Cancel a sell order at the Grand Exchange on the character's map.
    //
    //Future<GETransactionResponseSchema> actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost(String name, GECancelOrderSchema gECancelOrderSchema) async
    test('test actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost',
        () async {
      // TODO
    });

    // Action Ge Create Sell Order
    //
    // Create a sell order at the Grand Exchange on the character's map. Please note that a 5% sales tax is charged.
    //
    //Future<GECreateOrderTransactionResponseSchema> actionGeCreateSellOrderMyNameActionGrandexchangeSellPost(String name, GEOrderCreationrSchema gEOrderCreationrSchema) async
    test('test actionGeCreateSellOrderMyNameActionGrandexchangeSellPost',
        () async {
      // TODO
    });

    // Action Move
    //
    // Moves a character on the map using the map's X and Y position.
    //
    //Future<CharacterMovementResponseSchema> actionMoveMyNameActionMovePost(String name, DestinationSchema destinationSchema) async
    test('test actionMoveMyNameActionMovePost', () async {
      // TODO
    });

    // Action Recycling
    //
    // Recycling an item. The character must be on a map with a workshop (only for equipments and weapons).
    //
    //Future<RecyclingResponseSchema> actionRecyclingMyNameActionRecyclingPost(String name, RecyclingSchema recyclingSchema) async
    test('test actionRecyclingMyNameActionRecyclingPost', () async {
      // TODO
    });

    // Action Rest
    //
    // Recovers hit points by resting. (1 second per 5 HP, minimum 3 seconds)
    //
    //Future<CharacterRestResponseSchema> actionRestMyNameActionRestPost(String name) async
    test('test actionRestMyNameActionRestPost', () async {
      // TODO
    });

    // Action Task Cancel
    //
    // Cancel a task for 1 tasks coin.
    //
    //Future<TaskCancelledResponseSchema> actionTaskCancelMyNameActionTaskCancelPost(String name) async
    test('test actionTaskCancelMyNameActionTaskCancelPost', () async {
      // TODO
    });

    // Action Task Exchange
    //
    // Exchange 6 tasks coins for a random reward. Rewards are exclusive items or resources.
    //
    //Future<TasksRewardDataResponseSchema> actionTaskExchangeMyNameActionTaskExchangePost(String name) async
    test('test actionTaskExchangeMyNameActionTaskExchangePost', () async {
      // TODO
    });

    // Action Task Trade
    //
    // Trading items with a Tasks Master.
    //
    //Future<TaskTradeResponseSchema> actionTaskTradeMyNameActionTaskTradePost(String name, SimpleItemSchema simpleItemSchema) async
    test('test actionTaskTradeMyNameActionTaskTradePost', () async {
      // TODO
    });

    // Action Unequip Item
    //
    // Unequip an item on your character.
    //
    //Future<EquipmentResponseSchema> actionUnequipItemMyNameActionUnequipPost(String name, UnequipSchema unequipSchema) async
    test('test actionUnequipItemMyNameActionUnequipPost', () async {
      // TODO
    });

    // Action Use Item
    //
    // Use an item as a consumable.
    //
    //Future<UseItemResponseSchema> actionUseItemMyNameActionUsePost(String name, SimpleItemSchema simpleItemSchema) async
    test('test actionUseItemMyNameActionUsePost', () async {
      // TODO
    });

    // Action Withdraw Bank Gold
    //
    // Withdraw gold from your bank.
    //
    //Future<BankGoldTransactionResponseSchema> actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost(String name, DepositWithdrawGoldSchema depositWithdrawGoldSchema) async
    test('test actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost',
        () async {
      // TODO
    });

    // Action Withdraw Bank
    //
    // Take an item from your bank and put it in the character's inventory.
    //
    //Future<BankItemTransactionResponseSchema> actionWithdrawBankMyNameActionBankWithdrawPost(String name, SimpleItemSchema simpleItemSchema) async
    test('test actionWithdrawBankMyNameActionBankWithdrawPost', () async {
      // TODO
    });

    // Get All Characters Logs
    //
    // History of the last 100 actions of all your characters.
    //
    //Future<DataPageLogSchema> getAllCharactersLogsMyLogsGet({ int page, int size }) async
    test('test getAllCharactersLogsMyLogsGet', () async {
      // TODO
    });

    // Get My Characters
    //
    // List of your characters.
    //
    //Future<MyCharactersListSchema> getMyCharactersMyCharactersGet() async
    test('test getMyCharactersMyCharactersGet', () async {
      // TODO
    });
  });
}
