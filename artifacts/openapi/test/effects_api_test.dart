import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for EffectsApi
void main() {
  final instance = ArtifactsApi().getEffectsApi();

  group(EffectsApi, () {
    // Get All Effects
    //
    // List of all effects. Effects are used by equipment, tools, runes, consumables and monsters. An effect is an action that produces an effect on the game.
    //
    //Future<DataPageEffectSchema> getAllEffectsEffectsGet({ int page, int size }) async
    test('test getAllEffectsEffectsGet', () async {
      // TODO
    });

    // Get Effect
    //
    // Retrieve the details of a badge.
    //
    //Future<EffectResponseSchema> getEffectEffectsCodeGet(String code) async
    test('test getEffectEffectsCodeGet', () async {
      // TODO
    });
  });
}
