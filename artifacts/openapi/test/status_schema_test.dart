import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for StatusSchema
void main() {
  final instance = StatusSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(StatusSchema, () {
    // Game version.
    // String version
    test('to test the property `version`', () async {
      // TODO
    });

    // Server time.
    // DateTime serverTime
    test('to test the property `serverTime`', () async {
      // TODO
    });

    // Maximum level.
    // int maxLevel
    test('to test the property `maxLevel`', () async {
      // TODO
    });

    // Maximum skill level.
    // int maxSkillLevel
    test('to test the property `maxSkillLevel`', () async {
      // TODO
    });

    // Characters online.
    // int charactersOnline
    test('to test the property `charactersOnline`', () async {
      // TODO
    });

    // Server announcements.
    // BuiltList<AnnouncementSchema> announcements
    test('to test the property `announcements`', () async {
      // TODO
    });

    // Rate limits.
    // BuiltList<RateLimitSchema> rateLimits
    test('to test the property `rateLimits`', () async {
      // TODO
    });

    // Current season details.
    // SeasonSchema season
    test('to test the property `season`', () async {
      // TODO
    });
  });
}
