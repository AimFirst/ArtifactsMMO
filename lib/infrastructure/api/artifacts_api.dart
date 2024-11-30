import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
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

  Stream<Character> get character;

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

  // Actions
  Future<Character> moveTo({required Location location});

  Future<Character> gather();
}
