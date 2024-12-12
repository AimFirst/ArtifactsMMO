import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:rxdart/rxdart.dart';

class MapManager extends BoardElementManager {

  final mapSubject = BehaviorSubject<Map<Location,MapLocation>>.seeded({});
  final contentLocationSubject = BehaviorSubject<Map<Content, List<Location>>>.seeded({});


  MapManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    final results = await AllPageLoader.loadAllPaged(
            (int page) => artifactsClient.getMap(pageNumber: page));

    Map<Location, MapLocation> map = {};
    Map<Content, List<Location>> contentLocations = {};

    for (final mapLocation in results) {
      map[mapLocation.location] = mapLocation;
      final content = mapLocation.content;
      if (content != null) {
        final existingContentList = contentLocations[content] ?? [];
        existingContentList.add(mapLocation.location);
        contentLocations[content] = existingContentList;
      }
    }

    mapSubject.value = map;
    contentLocationSubject.value = contentLocations;
  }

}