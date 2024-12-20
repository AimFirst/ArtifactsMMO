import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_accept_new_task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_buy_bank_expansion.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_complete_task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_crafting.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_delete_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_deposit_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_deposit_bank_gold.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_equip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_fight.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_gathering.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_ge_buy_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_ge_cancel_sell_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_ge_create_sell_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_move.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_recycling.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_rest.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_task_cancel.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_task_exchange.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_task_trade.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_unequip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_use_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_withdraw_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_withdraw_bank_gold.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank_details.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/open_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/past_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';

abstract class ArtifactsClient {
  // Maps
  Future<PagedResponse<Resource>> getResources(
      {SkillType? skillType, int? maxSkillLevel, int? pageNumber});

  Future<PagedResponse<MapLocation>> getMap({int? pageNumber});

  Future<PagedResponse<MapLocation>> getLocationsForContent(
      {required String contentCode});

  Future<MapLocation> getLocationInfo({required Location location});

  // Characters
  Future<List<Character>> getCharacters();

  // Items
  Future<PagedResponse<Item>> getItems({int? pageNumber});

  // Monsters
  Future<PagedResponse<Monster>> getMonsters({int? pageNumber});

  // Events
  Future<PagedResponse<ActiveEvent>> getActiveEvents({int? pageNumber});

  Future<PagedResponse<Event>> getEvents({int? pageNumber});

  // Tasks
  Future<PagedResponse<Task>> getTasks({int? pageNumber});

  // Achievements
  Future<PagedResponse<Achievement>> getAchievements({int? pageNumber});

  // Exchange
  Future<PagedResponse<OpenOrder>> getSellOrders({
    int? pageNumber,
    String? seller,
  });

  Future<PagedResponse<PastOrder>> getSellHistory({
    required String itemCode,
    int? pageNumber,
    String? buyer,
    String? seller,
  });

  // Bank
  Future<PagedResponse<ItemQuantity>> getBankItems({required int pageNumber});

  Future<BankDetails> getBankDetails();

  // Actions
  Future<ActionMoveResponse> moveTo({required ActionMove action});

  Future<ActionRestResponse> rest({required ActionRest action});

  Future<ActionEquipItemResponse> equipItem({required ActionEquipItem action});

  Future<ActionUnequipItemResponse> unequipItem(
      {required ActionUnequipItem action});

  Future<ActionUseItemResponse> useItem({required ActionUseItem action});

  Future<ActionFightResponse> fight({required ActionFight action});

  Future<ActionGatheringResponse> gather({required ActionGathering action});

  Future<ActionCraftingResponse> craft({required ActionCrafting action});

  Future<ActionDepositBankGoldResponse> depositBankGold(
      {required ActionDepositBankGold action});

  Future<ActionDepositBankResponse> depositBank(
      {required ActionDepositBank action});

  Future<ActionWithdrawBankResponse> withdrawBank(
      {required ActionWithdrawBank action});

  Future<ActionWithdrawBankGoldResponse> withdrawBankGold(
      {required ActionWithdrawBankGold action});

  Future<ActionBuyBankExpansionResponse> buyBankExpansion(
      {required ActionBuyBankExpansion action});

  Future<ActionRecyclingResponse> recycle({required ActionRecycling action});

  Future<ActionGEBuyItemResponse> geBuyItem({required ActionGEBuyItem action});

  Future<ActionGECreateSellOrderResponse> geCreateSellOrder(
      {required ActionGECreateSellOrder action});

  Future<ActionGECancelSellOrderResponse> geCancelSellOrder(
      {required ActionGECancelSellOrder action});

  Future<ActionCompleteTaskResponse> completeTask(
      {required ActionCompleteTask action});

  Future<ActionTaskExchangeResponse> taskExchange(
      {required ActionTaskExchange action});

  Future<ActionAcceptNewTaskResponse> acceptNewTask(
      {required ActionAcceptNewTask action});

  Future<ActionTaskTradeResponse> taskTrade({required ActionTaskTrade action});

  Future<ActionTaskCancelResponse> taskCancel(
      {required ActionTaskCancel action});

  Future<ActionDeleteItemResponse> deleteItem(
      {required ActionDeleteItem action});
}
