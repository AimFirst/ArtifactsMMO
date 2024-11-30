import 'dart:async';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/open_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/past_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/achievement.dart';
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

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
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
  Future<Character> moveTo({required Location location}) async {
    final response =
        await api.getMyCharactersApi().actionMoveMyNameActionMovePost(
            name: characterName,
            destinationSchema: DestinationSchema(
              (b) => b
                ..x = location.x
                ..y = location.y,
            ));

    _throwIfError(response);

    final character = response.data!.data.character.convert();
    _updateCharacter(character);
    return character;
  }

  @override
  Future<Character> gather() async {
    final response = await api
        .getMyCharactersApi()
        .actionGatheringMyNameActionGatheringPost(name: characterName);

    _throwIfError(response);

    final character = response.data!.data.character.convert();
    _updateCharacter(character);
    return character;
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
}
