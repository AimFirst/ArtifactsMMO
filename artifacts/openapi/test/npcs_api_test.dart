import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for NPCsApi
void main() {
  final instance = ArtifactsApi().getNPCsApi();

  group(NPCsApi, () {
    // Get All Npcs Items
    //
    // Retrieve the list of all NPC items.
    //
    //Future<DataPageNPCItem> getAllNpcsItemsNpcsItemsGet({ String code, String npc, String currency, int page, int size }) async
    test('test getAllNpcsItemsNpcsItemsGet', () async {
      // TODO
    });

    // Get All Npcs
    //
    // Fetch NPCs details.
    //
    //Future<DataPageNPCSchema> getAllNpcsNpcsDetailsGet({ String name, NPCType type, int page, int size }) async
    test('test getAllNpcsNpcsDetailsGet', () async {
      // TODO
    });

    // Get Npc Items
    //
    // Retrieve the items list of a NPC. If the NPC has items to buy, sell or trade, they will be displayed.
    //
    //Future<DataPageNPCItem> getNpcItemsNpcsItemsCodeGet(String code, { int page, int size }) async
    test('test getNpcItemsNpcsItemsCodeGet', () async {
      // TODO
    });

    // Get Npc
    //
    // Retrieve the details of a NPC.
    //
    //Future<NPCResponseSchema> getNpcNpcsDetailsCodeGet(String code) async
    test('test getNpcNpcsDetailsCodeGet', () async {
      // TODO
    });
  });
}
