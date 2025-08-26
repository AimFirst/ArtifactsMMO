import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for ServerDetailsApi
void main() {
  final instance = ArtifactsApi().getServerDetailsApi();

  group(ServerDetailsApi, () {
    // Get Server Details
    //
    // Return the status of the game server.
    //
    //Future<StatusResponseSchema> getServerDetailsGet() async
    test('test getServerDetailsGet', () async {
      // TODO
    });
  });
}
