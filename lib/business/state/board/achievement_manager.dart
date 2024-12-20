import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:rxdart/rxdart.dart';

class AchievementManager extends BoardElementManager {
  final achievementsSubject = BehaviorSubject<List<Achievement>>.seeded([]);

  AchievementManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    achievementsSubject.value = await AllPageLoader.loadAllPaged(
      (int page) => artifactsClient.getAchievements(pageNumber: page),
    );
  }
}
