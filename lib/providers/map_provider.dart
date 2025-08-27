// lib/providers/map_provider.dart

import 'package:artifacts_mmo/models/location_schema.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/foundation.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/artifacts_api.dart';
import '../services/api_client.dart';
import '../models/world_map.dart'; // Import our new model

class MapProvider with ChangeNotifier {
  final ApiClient _apiClient;
  WorldMap? _worldMap;
  WorldMap? get worldMap => _worldMap;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MapProvider(this._apiClient) {
    fetchMap();
  }

  Future<void> fetchMap() async {
    _isLoading = true;
    notifyListeners();

    final List<MapSchema> allTiles = [];
    int currentPage = 1;
    int totalPages = 1; // Start with 1, the first response will give us the actual total.

    try {
      do {
        LoggerService.instance.log('🗺️ Fetching map data, page $currentPage of $totalPages...');
        // Use the correct API call with the current page number
        final response = await _apiClient.maps.getAllMapsMapsGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;
          // Update totalPages with the value from the API response
          totalPages = pageData.pages ?? 1;

          // Extract the list of maps from the current page's data
          final BuiltList<MapSchema> mapsOnPage = pageData.data;

          // Add all tiles from each map on this page to our master list
          allTiles.addAll(mapsOnPage);

          // Move to the next page for the next loop iteration
          currentPage++;
        } else {
          // If any page fails, stop the process
          throw Exception('Failed to load page $currentPage with status ${response.statusCode}');
        }
      } while (currentPage <= totalPages); // Continue until we've fetched all pages

      // Once the loop is done, create the final WorldMap object
      _worldMap = WorldMap(tiles: allTiles);
      LoggerService.instance.log('🗺️ Map data loaded successfully! Found ${allTiles.length} total tiles.');

    } catch (e) {
      LoggerService.instance.log('Failed to load map data: $e', level: LogLevel.error);
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify all listeners that the complete map is ready
    }
  }

  DestinationSchema? findNearestTile(
      LocationSchema currentLocation, bool Function(MapSchema) predicate) {
    final tiles = worldMap?.tiles ?? [];
    DestinationSchema? nearest;
    num minDistance = double.infinity;

    for (final tile in tiles) {
      // Use the provided predicate function to check if this is the tile we want
      if (predicate(tile)) {
        // Manhattan distance calculation
        final distance = (currentLocation.x - tile.x).abs() +
            (currentLocation.y - tile.y).abs();
        if (distance < minDistance) {
          minDistance = distance;
          nearest = (DestinationSchemaBuilder()
            ..x = tile.x
            ..y = tile.y)
              .build();
        }
      }
    }
    return nearest;
  }
}