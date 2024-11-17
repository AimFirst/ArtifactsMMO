import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for CooldownSchema
void main() {
  final instance = CooldownSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(CooldownSchema, () {
    // The total seconds of the cooldown.
    // int totalSeconds
    test('to test the property `totalSeconds`', () async {
      // TODO
    });

    // The remaining seconds of the cooldown.
    // int remainingSeconds
    test('to test the property `remainingSeconds`', () async {
      // TODO
    });

    // The start of the cooldown.
    // DateTime startedAt
    test('to test the property `startedAt`', () async {
      // TODO
    });

    // The expiration of the cooldown.
    // DateTime expiration
    test('to test the property `expiration`', () async {
      // TODO
    });

    // The reason of the cooldown.
    // ActionType reason
    test('to test the property `reason`', () async {
      // TODO
    });
  });
}
