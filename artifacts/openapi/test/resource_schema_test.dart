import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for ResourceSchema
void main() {
  final instance = ResourceSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(ResourceSchema, () {
    // The name of the resource
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // The code of the resource. This is the resource's unique identifier (ID).
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // The skill required to gather this resource.
    // GatheringSkill skill
    test('to test the property `skill`', () async {
      // TODO
    });

    // The skill level required to gather this resource.
    // int level
    test('to test the property `level`', () async {
      // TODO
    });

    // The drops of this resource.
    // BuiltList<DropRateSchema> drops
    test('to test the property `drops`', () async {
      // TODO
    });
  });
}
