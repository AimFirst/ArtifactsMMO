import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for BadgesApi
void main() {
  final instance = ArtifactsApi().getBadgesApi();

  group(BadgesApi, () {
    // Get All Badges
    //
    // List of all badges.
    //
    //Future<DataPageBadgeSchema> getAllBadgesBadgesGet({ int page, int size }) async
    test('test getAllBadgesBadgesGet', () async {
      // TODO
    });

    // Get Badge
    //
    // Retrieve the details of a badge.
    //
    //Future<BadgeResponseSchema> getBadgeBadgesCodeGet(String code) async
    test('test getBadgeBadgesCodeGet', () async {
      // TODO
    });
  });
}
