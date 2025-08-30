import 'package:artifacts_mmo/models/monster_drop_info.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/material.dart';

import 'package:artifacts_api/artifacts_api.dart';

class WorldDataProvider with ChangeNotifier {
  final ApiClient _apiClient;

  final List<ItemSchema> _items = [];
  final Map<String, ItemSchema> _itemMap = {};
  final List<ResourceSchema> _resources = [];
  final Map<String, ResourceSchema> _resourceMap = {};
  final List<CraftSchema> _recipes = [];
  final Map<String, CraftSchema> _recipeMap = {};
  final List<MonsterSchema> _monsters = [];
  final Map<String, MonsterSchema> _monsterMap = {};
  final Map<String, List<MonsterDropInfo>> _monstersThatDropItem = {};

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<CraftSchema> get allRecipes => _recipes;

  Map<String, CraftSchema> get allRecipeMap => _recipeMap;

  List<MonsterSchema> get allMonsters => _monsters;

  WorldDataProvider(this._apiClient) {
    _loadWorldData();
  }

  Future<void> _loadResourceData() async {
    int currentPage = 1;
    int totalPages = 1; // This will be updated by the first API response.

    try {
      // Use a do-while loop to ensure we make at least one call.
      do {
        LoggerService.instance.log(
            '📚 Fetching resource data, page $currentPage of $totalPages...');

        // Make the paginated API call.
        final response = await _apiClient.resources
            .getAllResourcesResourcesGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;

          // Update the total number of pages from the response.
          totalPages = pageData.pages ?? 1;

          // Add all resources from the current page to our map.
          _resources.addAll(pageData.data);
          for (final resource in pageData.data) {
            _resourceMap[resource.code] = resource;
          }

          // Prepare for the next iteration.
          currentPage++;
        } else {
          // If any page fails, stop the process.
          throw Exception(
              'Failed to load resource page ${currentPage - 1} with status ${response.statusCode}');
        }
      } while (
          currentPage <= totalPages); // Continue until all pages are fetched.

      LoggerService.instance.log(
          '📚 Resources Data loaded successfully! Found ${_resources.length} total resources.');
    } catch (e) {
      LoggerService.instance
          .log('Failed to load resource data: $e', level: LogLevel.error);
    }
  }

  Future<void> _loadItemData() async {
    int currentPage = 1;
    int totalPages = 1; // This will be updated by the first API response.

    try {
      // Use a do-while loop to ensure we make at least one call.
      do {
        LoggerService.instance
            .log('📚 Fetching items data, page $currentPage of $totalPages...');

        // Make the paginated API call.
        final response =
            await _apiClient.items.getAllItemsItemsGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;

          // Update the total number of pages from the response.
          totalPages = pageData.pages ?? 1;

          // Add all items from the current page to our map.
          _items.addAll(pageData.data);
          for (final item in pageData.data) {
            _itemMap[item.code] = item;
            if (item.craft != null) {
              _recipes.add(item.craft!);
              _recipeMap[item.code] = item.craft!;
            }
          }

          // Prepare for the next iteration.
          currentPage++;
        } else {
          // If any page fails, stop the process.
          throw Exception(
              'Failed to load items page ${currentPage - 1} with status ${response.statusCode}');
        }
      } while (
          currentPage <= totalPages); // Continue until all pages are fetched.

      LoggerService.instance.log(
          '📚 Item Data loaded successfully! Found ${_items.length} total items.');
    } catch (e) {
      LoggerService.instance
          .log('Failed to load item data: $e', level: LogLevel.error);
    }
  }

  Future<void> _loadMonsterData() async {
    int currentPage = 1;
    int totalPages = 1; // This will be updated by the first API response.

    try {
      // Use a do-while loop to ensure we make at least one call.
      do {
        LoggerService.instance.log(
            '📚 Fetching monster data, page $currentPage of $totalPages...');

        // Make the paginated API call.
        final response = await _apiClient.monster
            .getAllMonstersMonstersGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;

          // Update the total number of pages from the response.
          totalPages = pageData.pages ?? 1;

          // Add all monsters from the current page to our map.
          _monsters.addAll(pageData.data);
          for (final monster in pageData.data) {
            _monsterMap[monster.code] = monster;
            for (final drop in monster.drops) {
              _monstersThatDropItem.putIfAbsent(monster.code, () => []);
              _monstersThatDropItem[monster.code]!
                  .add(MonsterDropInfo(monster.code, drop));
            }
          }

          // Prepare for the next iteration.
          currentPage++;
        } else {
          // If any page fails, stop the process.
          throw Exception(
              'Failed to load monster page ${currentPage - 1} with status ${response.statusCode}');
        }
      } while (
          currentPage <= totalPages); // Continue until all pages are fetched.

      LoggerService.instance.log(
          '📚 Monster Data loaded successfully! Found ${_monsters.length} total monsters.');
    } catch (e) {
      LoggerService.instance
          .log('Failed to load monster data: $e', level: LogLevel.error);
    }
  }

  Future<void> _loadWorldData() async {
    _isLoading = true;
    notifyListeners();

    await _loadResourceData();
    await _loadItemData();
    await _loadMonsterData();

    _isLoading = false;
    notifyListeners();
  }

  // Public method to look up resource details by its code.
  ResourceSchema? getResourceByCode(String code) {
    return _resourceMap[code];
  }

  // Public method to look up a recipe by the item it creates
  CraftSchema? getRecipeForItem(String code) {
    return _recipeMap[code];
  }

  ItemSchema? getItemByCode(String code) {
    return _itemMap[code];
  }

  MonsterSchema? getMonsterByCode(String code) {
    return _monsterMap[code];
  }
}
