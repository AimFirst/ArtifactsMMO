import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:rxdart/rxdart.dart';

class ItemElementManager extends BoardElementManager {
  final itemsSubject = BehaviorSubject<List<Item>>.seeded([]);

  ItemElementManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    final items = await AllPageLoader.loadAllPaged(
      (int page) => artifactsClient.getItems(pageNumber: page),
    );

    itemsSubject.value = items;
  }
}
