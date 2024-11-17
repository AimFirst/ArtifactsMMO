import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for AccountsApi
void main() {
  final instance = ArtifactsApi().getAccountsApi();

  group(AccountsApi, () {
    // Create Account
    //
    //Future<ResponseSchema> createAccountAccountsCreatePost(AddAccountSchema addAccountSchema) async
    test('test createAccountAccountsCreatePost', () async {
      // TODO
    });

    // Get Account
    //
    // Retrieve the details of a character.
    //
    //Future<AccountDetailsSchema> getAccountAccountsAccountGet(String account) async
    test('test getAccountAccountsAccountGet', () async {
      // TODO
    });

    // Get Account Achievements
    //
    // Retrieve the achievements of a account.
    //
    //Future<DataPageAccountAchievementSchema> getAccountAchievementsAccountsAccountAchievementsGet(String account, { AchievementType type, bool completed, int page, int size }) async
    test('test getAccountAchievementsAccountsAccountAchievementsGet', () async {
      // TODO
    });
  });
}
