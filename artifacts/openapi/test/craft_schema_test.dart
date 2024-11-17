import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for CraftSchema
void main() {
  final instance = CraftSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(CraftSchema, () {
    // Skill required to craft the item.
    // CraftSkill skill
    test('to test the property `skill`', () async {
      // TODO
    });

    // The skill level required to craft the item.
    // int level
    test('to test the property `level`', () async {
      // TODO
    });

    // List of items required to craft the item.
    // BuiltList<SimpleItemSchema> items
    test('to test the property `items`', () async {
      // TODO
    });

    // Quantity of items crafted.
    // int quantity
    test('to test the property `quantity`', () async {
      // TODO
    });
  });
}
