import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for StatusSchema
void main() {
  final instance = StatusSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(StatusSchema, () {
    // Server status
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Game version.
    // String version
    test('to test the property `version`', () async {
      // TODO
    });

    // Maximum level.
    // int maxLevel
    test('to test the property `maxLevel`', () async {
      // TODO
    });

    // Characters online.
    // int charactersOnline
    test('to test the property `charactersOnline`', () async {
      // TODO
    });

    // Server time.
    // DateTime serverTime
    test('to test the property `serverTime`', () async {
      // TODO
    });

    // Server announcements.
    // BuiltList<AnnouncementSchema> announcements
    test('to test the property `announcements`', () async {
      // TODO
    });

    // Last server wipe.
    // String lastWipe
    test('to test the property `lastWipe`', () async {
      // TODO
    });

    // Next server wipe.
    // String nextWipe
    test('to test the property `nextWipe`', () async {
      // TODO
    });
  });
}
