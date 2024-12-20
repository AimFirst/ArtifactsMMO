import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:rxdart/rxdart.dart';

class ResourceManager extends BoardElementManager {
  final resourcesSubject = BehaviorSubject<List<Resource>>.seeded([]);
  final dropsFromResourcesSubject =
      BehaviorSubject<Map<Content, List<Resource>>>.seeded({});

  ResourceManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    final results = await AllPageLoader.loadAllPaged(
        (int page) => artifactsClient.getResources(pageNumber: page));

    Map<Content, List<Resource>> dropsFromResources = {};
    for (final resource in results) {
      for (final drop in resource.drops) {
        final content = Content(type: ContentType.item, code: drop.code);
        final existingEntry = dropsFromResources[content] ?? [];
        existingEntry.add(resource);
        dropsFromResources[content] = existingEntry;
      }
    }

    resourcesSubject.value = results;
    dropsFromResourcesSubject.value = dropsFromResources;
  }
}
