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

    // Forgot Password
    //
    // Request a password reset.
    //
    //Future<PasswordResetResponseSchema> forgotPasswordAccountsForgotPasswordPost(PasswordResetRequestSchema passwordResetRequestSchema) async
    test('test forgotPasswordAccountsForgotPasswordPost', () async {
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

    // Get Account Characters
    //
    // Account character lists.
    //
    //Future<CharactersListSchema> getAccountCharactersAccountsAccountCharactersGet(String account) async
    test('test getAccountCharactersAccountsAccountCharactersGet', () async {
      // TODO
    });

    // Reset Password
    //
    // Reset password with a token. Use /forgot_password to get a token by email.
    //
    //Future<PasswordResetResponseSchema> resetPasswordAccountsResetPasswordPost(PasswordResetConfirmSchema passwordResetConfirmSchema) async
    test('test resetPasswordAccountsResetPasswordPost', () async {
      // TODO
    });
  });
}
