import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for MonstersApi
void main() {
  final instance = ArtifactsApi().getMonstersApi();

  group(MonstersApi, () {
    // Get All Monsters
    //
    // Fetch monsters details.
    //
    //Future<DataPageMonsterSchema> getAllMonstersMonstersGet({ int minLevel, int maxLevel, String drop, int page, int size }) async
    test('test getAllMonstersMonstersGet', () async {
      // TODO
    });

    // Get Monster
    //
    // Retrieve the details of a monster.
    //
    //Future<MonsterResponseSchema> getMonsterMonstersCodeGet(String code) async
    test('test getMonsterMonstersCodeGet', () async {
      // TODO
    });
  });
}
