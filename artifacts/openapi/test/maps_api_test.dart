import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for MapsApi
void main() {
  final instance = ArtifactsApi().getMapsApi();

  group(MapsApi, () {
    // Get All Maps
    //
    // Fetch maps details.
    //
    //Future<DataPageMapSchema> getAllMapsMapsGet({ MapContentType contentType, String contentCode, int page, int size }) async
    test('test getAllMapsMapsGet', () async {
      // TODO
    });

    // Get Map
    //
    // Retrieve the details of a map.
    //
    //Future<MapResponseSchema> getMapMapsXYGet(int x, int y) async
    test('test getMapMapsXYGet', () async {
      // TODO
    });
  });
}
