import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for EventSchema
void main() {
  final instance = EventSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(EventSchema, () {
    // Name of the event.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Code of the event. This is the event's unique identifier (ID).
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // Map list of the event.
    // BuiltList<EventMapSchema> maps
    test('to test the property `maps`', () async {
      // TODO
    });

    // Map skin of the event.
    // String skin
    test('to test the property `skin`', () async {
      // TODO
    });

    // Duration in minutes.
    // int duration
    test('to test the property `duration`', () async {
      // TODO
    });

    // Rate spawn of the event. (1/rate every minute)
    // int rate
    test('to test the property `rate`', () async {
      // TODO
    });

    // Content of the event.
    // EventContentSchema content
    test('to test the property `content`', () async {
      // TODO
    });
  });
}
