import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';

class StateManager {
  late final Map<Location, MapLocation> map;
  late final List<Resource> resources;
  late final Map<Content, List<Location>> contentLocations;
  late final Map<Content, List<Resource>> dropsFromResources;

  final ArtifactsClient artifactsClient;

  StateManager({required this.artifactsClient});

  Future<void> init() async {
    await Future.wait([
      _fetchMap(),
      _fetchResources(),
    ]);
  }

  Future<void> _fetchMap() async {
    final results = await _loadAllPaged(
        (int page) => artifactsClient.getMap(pageNumber: page));
    for (final mapLocation in results) {
      map[mapLocation.location] = mapLocation;
      final content = mapLocation.content;
      if (content != null) {
        final existingContentList = contentLocations[content] ?? [];
        existingContentList.add(mapLocation.location);
        contentLocations[content] = existingContentList;
      }
    }
  }

  Future<void> _fetchResources() async {
    final results = await _loadAllPaged(
        (int page) => artifactsClient.getResources(pageNumber: page));
    resources = results;
    for (final resource in results) {
      final content = Content.item(code: resource.code);
      final existingEntry = dropsFromResources[content] ?? [];
      existingEntry.add(resource);
      dropsFromResources[content] = existingEntry;
    }
  }

  Future<List<V>> _loadAllPaged<V, T extends PagedResponse<V>>(
    Future<PagedResponse<V>> Function(int) fetcher,
  ) async {
    final result = <V>[];
    var nextPage = 1;
    var totalPages = 0;
    do {
      final response = await fetcher(nextPage);
      result.addAll(response.data);
      totalPages = response.pages ?? 1;
    } while (nextPage++ < totalPages);
    return result;
  }
}
