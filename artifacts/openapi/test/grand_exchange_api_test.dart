import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for GrandExchangeApi
void main() {
  final instance = ArtifactsApi().getGrandExchangeApi();

  group(GrandExchangeApi, () {
    // Get Ge Sell History
    //
    // Fetch the sales history of the item for the last 7 days.
    //
    //Future<DataPageGeOrderHistorySchema> getGeSellHistoryGrandexchangeHistoryCodeGet(String code, { String seller, String buyer, int page, int size }) async
    test('test getGeSellHistoryGrandexchangeHistoryCodeGet', () async {
      // TODO
    });

    // Get Ge Sell Order
    //
    // Retrieve the sell order of a item.
    //
    //Future<GEOrderReponseSchema> getGeSellOrderGrandexchangeOrdersIdGet(String id) async
    test('test getGeSellOrderGrandexchangeOrdersIdGet', () async {
      // TODO
    });

    // Get Ge Sell Orders
    //
    // Fetch all sell orders.
    //
    //Future<DataPageGEOrderSchema> getGeSellOrdersGrandexchangeOrdersGet({ String code, String seller, int page, int size }) async
    test('test getGeSellOrdersGrandexchangeOrdersGet', () async {
      // TODO
    });
  });
}
