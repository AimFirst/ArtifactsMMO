import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for ItemSchema
void main() {
  final instance = ItemSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(ItemSchema, () {
    // Item name.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Item code. This is the item's unique identifier (ID).
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // Item level.
    // int level
    test('to test the property `level`', () async {
      // TODO
    });

    // Item type.
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Item subtype.
    // String subtype
    test('to test the property `subtype`', () async {
      // TODO
    });

    // Item description.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Item tradeable status. A non-tradeable item cannot be exchanged or sold.
    // bool tradeable
    test('to test the property `tradeable`', () async {
      // TODO
    });

    // List of object effects. For equipment, it will include item stats.
    // BuiltList<ItemEffectSchema> effects
    test('to test the property `effects`', () async {
      // TODO
    });

    // CraftSchema craft
    test('to test the property `craft`', () async {
      // TODO
    });
  });
}
