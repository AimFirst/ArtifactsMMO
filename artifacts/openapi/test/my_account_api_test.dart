import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for MyAccountApi
void main() {
  final instance = ArtifactsApi().getMyAccountApi();

  group(MyAccountApi, () {
    // Change Password
    //
    // Change your account password. Changing the password reset the account token.
    //
    //Future<ResponseSchema> changePasswordMyChangePasswordPost(ChangePassword changePassword) async
    test('test changePasswordMyChangePasswordPost', () async {
      // TODO
    });

    // Get Account Details
    //
    // Fetch account details.
    //
    //Future<MyAccountDetailsSchema> getAccountDetailsMyDetailsGet() async
    test('test getAccountDetailsMyDetailsGet', () async {
      // TODO
    });

    // Get Bank Details
    //
    // Fetch bank details.
    //
    //Future<BankResponseSchema> getBankDetailsMyBankGet() async
    test('test getBankDetailsMyBankGet', () async {
      // TODO
    });

    // Get Bank Items
    //
    // Fetch all items in your bank.
    //
    //Future<DataPageSimpleItemSchema> getBankItemsMyBankItemsGet({ String itemCode, int page, int size }) async
    test('test getBankItemsMyBankItemsGet', () async {
      // TODO
    });

    // Get Ge Sell History
    //
    // Fetch your sales history of the last 7 days.
    //
    //Future<DataPageGeOrderHistorySchema> getGeSellHistoryMyGrandexchangeHistoryGet({ String id, String code, int page, int size }) async
    test('test getGeSellHistoryMyGrandexchangeHistoryGet', () async {
      // TODO
    });

    // Get Ge Sell Orders
    //
    // Fetch your sell orders details.
    //
    //Future<DataPageGEOrderSchema> getGeSellOrdersMyGrandexchangeOrdersGet({ String code, int page, int size }) async
    test('test getGeSellOrdersMyGrandexchangeOrdersGet', () async {
      // TODO
    });
  });
}
