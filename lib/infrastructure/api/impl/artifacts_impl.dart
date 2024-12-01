import 'dart:async';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
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
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/open_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/past_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/action.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/character.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/event.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/item.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/map.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/order.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/task.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class ArtifactsImpl extends ArtifactsClient {
  final api = ArtifactsApi(basePathOverride: "https://api.artifactsmmo.com");
  final BehaviorSubject<Character> _characterSubject = BehaviorSubject();
  String characterName = "";

  ArtifactsImpl() {
    const token = String.fromEnvironment('ARTIFACTS_TOKEN');
    if (token.isEmpty) {
      throw AssertionError('ARTIFACTS TOKEN is not set.'
          'Use --dart-define-from-file=api_keys.json to load it');
    }
    api.setBearerAuth("JWTBearer", token);
    _updateCharacter(Character.empty());
  }

  @override
  Stream<Character> get character => _characterSubject.stream;

  void _updateCharacter(Character character) {
    characterName = character.name;
    _characterSubject.add(character);
  }

  void _throwIfError(Response<dynamic> response) {
    if (response.statusCode != 200 || response.data == null) {
      throw ArtifactsException(
          errorMessage:
              'Failed to move: ${response.statusCode} - ${response.statusMessage}');
    }
  }

  @override
  Future<PagedResponse<Resource>> getResources({
    SkillType? skillType,
    int? maxSkillLevel,
    int? pageNumber,
  }) async {
    final response = await api.getResourcesApi().getAllResourcesResourcesGet(
          maxLevel: maxSkillLevel,
          skill: skillType?.convert(),
          page: pageNumber,
        );

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((r) => r.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<MapLocation>> getMap({int? pageNumber}) async {
    final response = await api.getMapsApi().getAllMapsMapsGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((r) => r.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<MapLocation>> getLocationsForContent(
      {required String contentCode}) async {
    final response =
        await api.getMapsApi().getAllMapsMapsGet(contentCode: contentCode);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((r) => r.convert()).toList() ?? [],
    );
  }

  @override
  Future<MapLocation> getLocationInfo({required Location location}) async {
    final response =
        await api.getMapsApi().getMapMapsXYGet(x: location.x, y: location.y);

    _throwIfError(response);

    return response.data == null
        ? MapLocation.empty()
        : response.data!.data.convert();
  }

  @override
  Future<List<Character>> getCharacters() async {
    final response =
        await api.getMyCharactersApi().getMyCharactersMyCharactersGet();

    _throwIfError(response);

    final characters = response.data!.data.map((c) => c.convert()).toList();
    if (characters.isNotEmpty) {
      _updateCharacter(characters.first);
    }
    return characters;
  }

  @override
  Future<PagedResponse<Task>> getTasks({int? pageNumber}) async {
    final response =
        await api.getTasksApi().getAllTasksTasksListGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((t) => t.convert()).toList() ?? [],
    );
  }

  @override
  Future<ActionMoveResponse> moveTo({required ActionMove action}) async {
    final response =
        await api.getMyCharactersApi().actionMoveMyNameActionMovePost(
            name: characterName,
            destinationSchema: DestinationSchema(
              (b) => b
                ..x = action.location.x
                ..y = action.location.y,
            ));

    _throwIfError(response);

    final character = response.data!.data.character.convert();
    _updateCharacter(character);
    return response.data!.convert();
  }

  @override
  Future<ActionGatheringResponse> gather(
      {required ActionGathering action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionGatheringMyNameActionGatheringPost(name: characterName);

    _throwIfError(response);

    final character = response.data!.data.character.convert();
    _updateCharacter(character);
    return response.data!.convert();
  }

  @override
  Future<PagedResponse<Achievement>> getAchievements({int? pageNumber}) async {
    final response = await api
        .getAchievementsApi()
        .getAllAchievementsAchievementsGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((a) => a.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<ActiveEvent>> getActiveEvents({int? pageNumber}) async {
    final response = await api
        .getEventsApi()
        .getAllActiveEventsEventsActiveGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((e) => e.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<Event>> getEvents({int? pageNumber}) async {
    final response =
        await api.getEventsApi().getAllEventsEventsGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((e) => e.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<Item>> getItems({int? pageNumber}) async {
    final response =
        await api.getItemsApi().getAllItemsItemsGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((i) => i.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<Monster>> getMonsters({int? pageNumber}) async {
    final response =
        await api.getMonstersApi().getAllMonstersMonstersGet(page: pageNumber);

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((m) => m.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<PastOrder>> getSellHistory(
      {required String itemCode,
      int? pageNumber,
      String? buyer,
      String? seller}) async {
    final response = await api
        .getGrandExchangeApi()
        .getGeSellHistoryGrandexchangeHistoryCodeGet(
          page: pageNumber,
          code: itemCode,
          buyer: buyer,
          seller: seller,
        );

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((o) => o.convert()).toList() ?? [],
    );
  }

  @override
  Future<PagedResponse<OpenOrder>> getSellOrders(
      {int? pageNumber, String? seller}) async {
    final response =
        await api.getGrandExchangeApi().getGeSellOrdersGrandexchangeOrdersGet(
              page: pageNumber,
              seller: seller,
            );

    _throwIfError(response);

    return PagedResponse(
      total: response.data?.total,
      page: response.data?.page,
      size: response.data?.size,
      pages: response.data?.pages,
      data: response.data?.data.map((o) => o.convert()).toList() ?? [],
    );
  }

  @override
  Future<ActionAcceptNewTaskResponse> acceptNewTask(
      {required ActionAcceptNewTask action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionAcceptNewTaskMyNameActionTaskNewPost(name: characterName);

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionBuyBankExpansionResponse> buyBankExpansion(
      {required ActionBuyBankExpansion action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionBuyBankExpansionMyNameActionBankBuyExpansionPost(
            name: characterName);

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionCompleteTaskResponse> completeTask(
      {required ActionCompleteTask action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionCompleteTaskMyNameActionTaskCompletePost(name: characterName);

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionCraftingResponse> craft({required ActionCrafting action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionCraftingMyNameActionCraftingPost(
            name: characterName, craftingSchema: action.convert());

    _throwIfError(response);

    return response.data!.convertToCraftingResponse();
  }

  @override
  Future<ActionDeleteItemResponse> deleteItem(
      {required ActionDeleteItem action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionDeleteItemMyNameActionDeletePost(
            name: characterName, simpleItemSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionDepositBankResponse> depositBank(
      {required ActionDepositBank action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionDepositBankMyNameActionBankDepositPost(
            name: characterName, simpleItemSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionDepositBankGoldResponse> depositBankGold(
      {required ActionDepositBankGold action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionDepositBankGoldMyNameActionBankDepositGoldPost(
            name: characterName, depositWithdrawGoldSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionEquipItemResponse> equipItem(
      {required ActionEquipItem action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionEquipItemMyNameActionEquipPost(
            name: characterName, equipSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionFightResponse> fight({required ActionFight action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionFightMyNameActionFightPost(name: characterName);

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionGEBuyItemResponse> geBuyItem(
      {required ActionGEBuyItem action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionGeBuyItemMyNameActionGrandexchangeBuyPost(
            name: characterName, gEBuyOrderSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionGECancelSellOrderResponse> geCancelSellOrder(
      {required ActionGECancelSellOrder action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost(
            name: characterName, gECancelOrderSchema: action.convert());

    _throwIfError(response);

    return response.data!.convertCancel();
  }

  @override
  Future<ActionGECreateSellOrderResponse> geCreateSellOrder(
      {required ActionGECreateSellOrder action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionGeCreateSellOrderMyNameActionGrandexchangeSellPost(
            name: characterName, gEOrderCreationrSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionRecyclingResponse> recycle(
      {required ActionRecycling action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionRecyclingMyNameActionRecyclingPost(
            name: characterName, recyclingSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionRestResponse> rest({required ActionRest action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionRestMyNameActionRestPost(name: characterName);

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionTaskCancelResponse> taskCancel(
      {required ActionTaskCancel action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionTaskCancelMyNameActionTaskCancelPost(name: characterName);

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionTaskExchangeResponse> taskExchange(
      {required ActionTaskExchange action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionTaskExchangeMyNameActionTaskExchangePost(name: characterName);

    _throwIfError(response);

    return response.data!.convertExchange();
  }

  @override
  Future<ActionTaskTradeResponse> taskTrade(
      {required ActionTaskTrade action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionTaskTradeMyNameActionTaskTradePost(
            name: characterName, simpleItemSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionUnequipItemResponse> unequipItem(
      {required ActionUnequipItem action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionUnequipItemMyNameActionUnequipPost(
            name: characterName, unequipSchema: action.convert());

    _throwIfError(response);

    return response.data!.convertUnequip();
  }

  @override
  Future<ActionUseItemResponse> useItem({required ActionUseItem action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionUseItemMyNameActionUsePost(
            name: characterName, simpleItemSchema: action.convert());

    _throwIfError(response);

    return response.data!.convert();
  }

  @override
  Future<ActionWithdrawBankResponse> withdrawBank(
      {required ActionWithdrawBank action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionWithdrawBankMyNameActionBankWithdrawPost(
            name: characterName, simpleItemSchema: action.convert());

    _throwIfError(response);

    return response.data!.convertWithdraw();
  }

  @override
  Future<ActionWithdrawBankGoldResponse> withdrawBankGold(
      {required ActionWithdrawBankGold action}) async {
    final response = await api
        .getMyCharactersApi()
        .actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost(
            name: characterName, depositWithdrawGoldSchema: action.convert());

    _throwIfError(response);

    return response.data!.convertWithdraw();
  }
}
