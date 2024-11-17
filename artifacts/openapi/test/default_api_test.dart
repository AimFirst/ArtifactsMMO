import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for DefaultApi
void main() {
  final instance = ArtifactsApi().getDefaultApi();

  group(DefaultApi, () {
    // Get Status
    //
    // Return the status of the game server.
    //
    //Future<StatusResponseSchema> getStatusGet() async
    test('test getStatusGet', () async {
      // TODO
    });
  });
}
