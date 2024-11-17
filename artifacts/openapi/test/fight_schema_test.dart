import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

// tests for FightSchema
void main() {
  final instance = FightSchemaBuilder();
  // TODO add properties to the builder and call build()

  group(FightSchema, () {
    // The amount of xp gained by the fight.
    // int xp
    test('to test the property `xp`', () async {
      // TODO
    });

    // The amount of gold gained by the fight.
    // int gold
    test('to test the property `gold`', () async {
      // TODO
    });

    // The items dropped by the fight.
    // BuiltList<DropSchema> drops
    test('to test the property `drops`', () async {
      // TODO
    });

    // Numbers of the turns of the combat.
    // int turns
    test('to test the property `turns`', () async {
      // TODO
    });

    // The amount of blocked hits by the monster.
    // BlockedHitsSchema monsterBlockedHits
    test('to test the property `monsterBlockedHits`', () async {
      // TODO
    });

    // The amount of blocked hits by the player.
    // BlockedHitsSchema playerBlockedHits
    test('to test the property `playerBlockedHits`', () async {
      // TODO
    });

    // The fight logs.
    // BuiltList<String> logs
    test('to test the property `logs`', () async {
      // TODO
    });

    // The result of the fight.
    // FightResult result
    test('to test the property `result`', () async {
      // TODO
    });
  });
}
