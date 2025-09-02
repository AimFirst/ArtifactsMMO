import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/foundation.dart';
import 'package:artifacts_api/artifacts_api.dart';

class BankProvider with ChangeNotifier {
  final ApiClient _apiClient;

  List<SimpleItemSchema> _items = [];

  List<SimpleItemSchema> get items => _items;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  BankProvider(this._apiClient) {
    // Initial fetch when the provider is created.
    fetchBankInventory();
  }

  Future<void> fetchBankInventory() async {
    _isLoading = true;
    notifyListeners();

    final List<SimpleItemSchema> allItems = [];
    int currentPage = 1;
    int totalPages = 1; // Will be updated by the first API response.

    try {
      do {
        LoggerService.instance.log(
            '🏦 Fetching bank inventory, page $currentPage of $totalPages...');

        // Make the paginated API call.
        final response = await _apiClient.myAccount
            .getBankItemsMyBankItemsGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;

          // Update the total number of pages from the response.
          totalPages = pageData.pages ?? 1;

          // Add all items from the current page's data to our master list.
          allItems.addAll(pageData.data);

          // Prepare for the next iteration.
          currentPage++;
        } else {
          throw Exception(
              'Failed to load bank inventory page ${currentPage - 1} with status ${response.statusCode}');
        }
      } while (
          currentPage <= totalPages); // Continue until all pages are fetched.

      _items = allItems;
      LoggerService.instance.log(
          '🏦 Bank inventory updated. Found ${_items.length} total item stacks.');
    } catch (e) {
      LoggerService.instance
          .log('Failed to fetch bank inventory: $e', level: LogLevel.error);
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that the complete inventory is ready.
    }
  }

  void updateBankInventory(Iterable<SimpleItemSchema> items) {
    _items = items.toList();
    notifyListeners();
  }

  int count(String itemCode) {
    return _items.fold(0,
        (count, item) => item.code == itemCode ? item.quantity + count : count);
  }

  bool hasItems(SimpleItemSchema items) {
    return count(items.code) >= items.quantity;
  }

  bool hasItem(String itemCode) {
    return count(itemCode) > 0;
  }
}
