import 'package:artifacts_mmo/extensions/drop_rate_schema_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/models/monster_drop_info.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/api_client.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:artifacts_api/artifacts_api.dart';

class WorldDataProvider with ChangeNotifier {
  final ApiClient _apiClient;

  final List<ItemSchema> _items = [];
  final Map<String, ItemSchema> _itemMap = {};
  final List<ResourceSchema> _resources = [];
  final Map<String, ResourceSchema> _resourceMap = {};
  final Map<String, ResourceSchema> _resourceDropMap = {};
  final List<CraftSchema> _recipes = [];
  final Map<String, CraftSchema> _recipeMap = {};
  Map<CraftSkill, List<MapEntry<String, CraftSchema>>> _recipesPerSkill = {};
  final List<MonsterSchema> _monsters = [];
  final Map<String, MonsterSchema> _monsterMap = {};
  final Map<String, List<MonsterDropInfo>> _monstersThatDropItem = {};
  final Map<ItemSlot, List<ItemSchema>> _itemsForSlotMap = {};
  final Map<String, NPCItem> _npcItems = {};

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<CraftSchema> get allRecipes => _recipes;

  Map<String, CraftSchema> get allRecipeMap => _recipeMap;

  Map<CraftSkill, List<MapEntry<String, CraftSchema>>> get recipesPerSkill =>
      _recipesPerSkill;

  List<MonsterSchema> get allMonsters => _monsters;

  List<ItemSchema> get allItems => _items;

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
            for (final drop in resource.drops) {
              _resourceDropMap[drop.code] = resource;
            }
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

            // Cache crafting
            if (item.craft != null) {
              _recipes.add(item.craft!);
              _recipeMap[item.code] = item.craft!;
              _recipesPerSkill[item.craft!.skill!] =
                  (_recipesPerSkill[item.craft!.skill] ?? [])
                    ..add(MapEntry(item.code, item.craft!));
            }

            // Cache equipment
            final itemSlot = ItemSlot.values.firstWhereOrNull((e) => e.type == item.type);
            if (itemSlot != null) {
              _itemsForSlotMap.putIfAbsent(itemSlot, () => <ItemSchema>[]).add(item);
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
              _monstersThatDropItem.putIfAbsent(drop.code, () => []);
              _monstersThatDropItem[drop.code]!
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

  Future<void> _loadNPCData() async {
    int currentPage = 1;
    int totalPages = 1; // This will be updated by the first API response.

    try {
      // Use a do-while loop to ensure we make at least one call.
      do {
        LoggerService.instance.log(
            '📚 Fetching npc data, page $currentPage of $totalPages...');

        // Make the paginated API call.
        final response = await _apiClient.npcs.getAllNpcsItemsNpcsItemsGet(page: currentPage);

        if (response.statusCode == 200 && response.data != null) {
          final pageData = response.data!;

          // Update the total number of pages from the response.
          totalPages = pageData.pages ?? 1;

          // Add all npc items from the current page to our map.
          for (final npcItem in pageData.data) {
            _npcItems[npcItem.code] = npcItem;
          }

          // Prepare for the next iteration.
          currentPage++;
        } else {
          // If any page fails, stop the process.
          throw Exception(
              'Failed to load npc item page ${currentPage - 1} with status ${response.statusCode}');
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
    await _loadNPCData();

    _isLoading = false;
    notifyListeners();
  }

  // Public method to look up resource details by its code.
  ResourceSchema? getResourceByCode(String code) {
    return _resourceMap[code];
  }

  ResourceSchema? getResourceByDropCode(String code) {
    return _resourceDropMap[code];
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

  List<MonsterSchema> getMonstersByDropCode(String code) {
    List<MonsterSchema> monsters = [];
    final monsterCodes = _monstersThatDropItem[code];
    monsterCodes?.sort((a,b) => b.drop.averageQuantity.compareTo(a.drop.averageQuantity));
    monsterCodes
        ?.map((drop) => getMonsterByCode(drop.monsterCode))
        .forEach((monster) {
      if (monster != null) monsters.add(monster);
    });
    return monsters;
  }

  NPCItem? getNPCItemWithNoOtherSource(String code) {
    final item = _npcItems[code];
    if (item == null) {
      return null;
    }

    // Can craft it.
    if (getRecipeForItem(code) != null) {
      return null;
    }

    // Can gather it
    if (getResourceByDropCode(code) != null) {
      return null;
    }

    // Can fight for it
    if (getMonstersByDropCode(code).isNotEmpty) {
      return null;
    }

    return item;
  }
}
