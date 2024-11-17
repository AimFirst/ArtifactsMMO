import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for AchievementsApi
void main() {
  final instance = ArtifactsApi().getAchievementsApi();

  group(AchievementsApi, () {
    // Get Achievement
    //
    // Retrieve the details of a achievement.
    //
    //Future<AchievementResponseSchema> getAchievementAchievementsCodeGet(String code) async
    test('test getAchievementAchievementsCodeGet', () async {
      // TODO
    });

    // Get All Achievements
    //
    // List of all achievements.
    //
    //Future<DataPageAchievementSchema> getAllAchievementsAchievementsGet({ AchievementType type, int page, int size }) async
    test('test getAllAchievementsAchievementsGet', () async {
      // TODO
    });
  });
}
