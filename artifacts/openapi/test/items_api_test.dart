import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for ItemsApi
void main() {
  final instance = ArtifactsApi().getItemsApi();

  group(ItemsApi, () {
    // Get All Items
    //
    // Fetch items details.
    //
    //Future<DataPageItemSchema> getAllItemsItemsGet({ int minLevel, int maxLevel, String name, ItemType type, CraftSkill craftSkill, String craftMaterial, int page, int size }) async
    test('test getAllItemsItemsGet', () async {
      // TODO
    });

    // Get Item
    //
    // Retrieve the details of a item.
    //
    //Future<ItemResponseSchema> getItemItemsCodeGet(String code) async
    test('test getItemItemsCodeGet', () async {
      // TODO
    });
  });
}
