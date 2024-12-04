import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for BadgeSchema
void main() {
  final instance = BadgeSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(BadgeSchema, () {
    // Code of the badge. This is the badge's unique identifier (ID).
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // Description of the badge.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Conditions to get the badge.
    // BuiltList<BadgeConditionSchema> conditions
    test('to test the property `conditions`', () async {
      // TODO
    });

    // int season
    test('to test the property `season`', () async {
      // TODO
    });
  });
}
