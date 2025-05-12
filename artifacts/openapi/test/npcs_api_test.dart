import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for NPCsApi
void main() {
  final instance = ArtifactsApi().getNPCsApi();

  group(NPCsApi, () {
    // Get All Npcs
    //
    // Fetch NPCs details.
    //
    //Future<DataPageNPCSchema> getAllNpcsNpcsGet({ NPCType type, int page, int size }) async
    test('test getAllNpcsNpcsGet', () async {
      // TODO
    });

    // Get Npc Items
    //
    // Retrieve the items list of a NPC. If the NPC has items to buy or sell, they will be displayed.
    //
    //Future<DataPageNPCItem> getNpcItemsNpcsCodeItemsGet(String code, { int page, int size }) async
    test('test getNpcItemsNpcsCodeItemsGet', () async {
      // TODO
    });

    // Get Npc
    //
    // Retrieve the details of a NPC.
    //
    //Future<NPCResponseSchema> getNpcNpcsCodeGet(String code) async
    test('test getNpcNpcsCodeGet', () async {
      // TODO
    });
  });
}
