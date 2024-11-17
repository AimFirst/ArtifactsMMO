import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for TokenApi
void main() {
  final instance = ArtifactsApi().getTokenApi();

  group(TokenApi, () {
    // Generate Token
    //
    // Use your account as HTTPBasic Auth to generate your token to use the API. You can also generate your token directly on the website.
    //
    //Future<TokenResponseSchema> generateTokenTokenPost() async
    test('test generateTokenTokenPost', () async {
      // TODO
    });
  });
}
