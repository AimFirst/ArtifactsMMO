import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for LeaderboardApi
void main() {
  final instance = ArtifactsApi().getLeaderboardApi();

  group(LeaderboardApi, () {
    // Get Accounts Leaderboard
    //
    // Fetch leaderboard details.
    //
    //Future<DataPageAccountLeaderboardSchema> getAccountsLeaderboardLeaderboardAccountsGet({ AccountLeaderboardType sort, int page, int size }) async
    test('test getAccountsLeaderboardLeaderboardAccountsGet', () async {
      // TODO
    });

    // Get Characters Leaderboard
    //
    // Fetch leaderboard details.
    //
    //Future<DataPageCharacterLeaderboardSchema> getCharactersLeaderboardLeaderboardCharactersGet({ CharacterLeaderboardType sort, int page, int size }) async
    test('test getCharactersLeaderboardLeaderboardCharactersGet', () async {
      // TODO
    });
  });
}
