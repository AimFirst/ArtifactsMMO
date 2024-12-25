import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:rxdart/rxdart.dart';

class MonsterManager extends BoardElementManager {
  final monsterSubject = BehaviorSubject<List<Monster>>.seeded([]);
  final dropsFromMonstersSubject =
      BehaviorSubject<Map<Content, List<Monster>>>.seeded({});

  MonsterManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    final results = await AllPageLoader.loadAllPaged(
      (int page) => artifactsClient.getMonsters(pageNumber: page),
    );

    final dropsFromMonsters = <Content, List<Monster>>{};
    for (final monster in results) {
      for (final drop in monster.drops) {
        final content = Content(type: ContentType.item, code: drop.code);
        final existingEntry = dropsFromMonsters[content] ?? [];
        existingEntry.add(monster);
        dropsFromMonsters[content] = existingEntry;
      }
    }

    monsterSubject.value = results;
    dropsFromMonstersSubject.value = dropsFromMonsters;
  }
}

extension MonsterExtension on List<Monster> {
  List<Monster> monstersThatProvideItem({required String code}) {
    return where(
            (r) => r.drops.fold(0, (o, d) => o + (d.code == code ? 1 : 0)) > 0)
        .toList();
  }
}
