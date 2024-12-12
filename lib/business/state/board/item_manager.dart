import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:rxdart/rxdart.dart';

class ItemManager extends BoardElementManager {
  final itemsByCraftTypeSubject = BehaviorSubject<Map<SkillType, List<Item>>>.seeded({});
  final itemsSubject = BehaviorSubject<List<Item>>.seeded([]);

  ItemManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    final items = await AllPageLoader.loadAllPaged(
          (int page) => artifactsClient.getItems(pageNumber: page),
    );

    final itemsByCraftType = <SkillType, List<Item>>{};
    for (final skillType in SkillType.values) {
      final itemsForType =
      items.where((i) => i.craft?.skill == skillType).toList();
      itemsByCraftType[skillType] = itemsForType;
    }

    itemsSubject.value = items;
    itemsByCraftTypeSubject.value = itemsByCraftType;
  }

}