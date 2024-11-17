import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for ResourcesApi
void main() {
  final instance = ArtifactsApi().getResourcesApi();

  group(ResourcesApi, () {
    // Get All Resources
    //
    // Fetch resources details.
    //
    //Future<DataPageResourceSchema> getAllResourcesResourcesGet({ int minLevel, int maxLevel, GatheringSkill skill, String drop, int page, int size }) async
    test('test getAllResourcesResourcesGet', () async {
      // TODO
    });

    // Get Resource
    //
    // Retrieve the details of a resource.
    //
    //Future<ResourceResponseSchema> getResourceResourcesCodeGet(String code) async
    test('test getResourceResourcesCodeGet', () async {
      // TODO
    });
  });
}
