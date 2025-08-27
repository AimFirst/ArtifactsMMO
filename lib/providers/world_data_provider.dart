// lib/providers/world_data_provider.dart

import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/material.dart';

import 'package:artifacts_api/artifacts_api.dart';

class WorldDataProvider with ChangeNotifier {
  final ApiClient _apiClient;

  final Map<String, ResourceSchema> _resources = {};

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WorldDataProvider(this._apiClient) {
    _loadWorldData();
  }

  Future<void> _loadWorldData() async {
    _isLoading = true;
    notifyListeners();

    int currentPage = 1;
    int totalPages = 1; // This will be updated by the first API response.

    try {
      // Use a do-while loop to ensure we make at least one call.
      do {
        LoggerService.instance.log('📚 Fetching resource data, page $currentPage of $totalPages...');

        // Make the paginated API call.
        final response = await _apiClient.resources.getAllResourcesResourcesGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;

          // Update the total number of pages from the response.
          totalPages = pageData.pages ?? 1;

          // Add all resources from the current page to our map.
          for (final resource in pageData.data) {
            _resources[resource.code] = resource;
          }

          // Prepare for the next iteration.
          currentPage++;
        } else {
          // If any page fails, stop the process.
          throw Exception('Failed to load resource page ${currentPage - 1} with status ${response.statusCode}');
        }
      } while (currentPage <= totalPages); // Continue until all pages are fetched.

      LoggerService.instance.log('📚 World Data loaded successfully! Found ${_resources.length} total resources.');

    } catch (e) {
      LoggerService.instance.log('Failed to load world data: $e', level: LogLevel.error);
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that the complete data is ready.
    }
  }

  // Public method to look up resource details by its code.
  ResourceSchema? getResourceByCode(String code) {
    return _resources[code];
  }
}