import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'state.g.dart';

@CopyWith()
class State with EquatableMixin {
  final BoardState boardState;
  final Map<String, CharacterState> characterStates;

  State({
    required this.boardState,
    required this.characterStates,
  });

  State.empty()
      : boardState = BoardState.empty(),
        characterStates = {};

  @override
  List<Object?> get props => [
        boardState,
        characterStates,
      ];
}

@CopyWith()
class BoardState with EquatableMixin {
  final Map<Location, MapLocation> map;
  final List<Resource> resources;
  final Map<Content, List<Location>> contentLocations;
  final Map<Content, List<Resource>> dropsFromResources;
  final ItemManager items;
  final List<Monster> monsters;
  final Map<Content, List<Monster>> dropsFromMonsters;
  final List<ActiveEvent> activeEvents;
  final List<Task> tasks;
  final List<Achievement> achievements;
  final Bank bank;

  BoardState({
    required this.map,
    required this.resources,
    required this.contentLocations,
    required this.dropsFromResources,
    required this.items,
    required this.monsters,
    required this.dropsFromMonsters,
    required this.activeEvents,
    required this.tasks,
    required this.achievements,
    required this.bank,
  });

  BoardState.empty()
      : map = {},
        resources = [],
        contentLocations = {},
        dropsFromResources = {},
        items = ItemManager.empty(),
        monsters = [],
        dropsFromMonsters = {},
        activeEvents = [],
        tasks = [],
        achievements = [],
        bank = Bank.empty();

  @override
  List<Object?> get props => [
        map,
        resources,
        contentLocations,
        dropsFromResources,
        items,
        monsters,
        dropsFromMonsters,
        activeEvents,
        tasks,
        achievements,
      ];
}

class ItemManager with EquatableMixin {
  final List<Item> _allItems;
  final Map<String, Item> _itemsByCode = {};
  final Map<SkillType, List<Item>> _itemsByCraftType = {};
  final Map<ItemType, List<Item>> _itemsByType = {};
  final Map<ItemTypeAndSubType, List<Item>> _itemsBySubType = {};
  final Map<EffectType, List<Item>> _itemsByEffectType = {};

  ItemManager({required List<Item> items}) : _allItems = items {
    for (var i in _allItems) {
      // Items by code.
      _itemsByCode[i.code] = i;

      // Craft skill types.
      final craftSkill = i.craft?.skill;
      if (craftSkill != null) {
        final currentCraftList = _itemsByCraftType[craftSkill] ?? [];
        currentCraftList.add(i);
        _itemsByCraftType[craftSkill] = currentCraftList;
      }

      // Current type lists.
      final currentTypeList = _itemsByType[i.type] ?? [];
      currentTypeList.add(i);
      _itemsByType[i.type] = currentTypeList;

      // Current sub type lists.
      final itemSubType =
          ItemTypeAndSubType(itemType: i.type, itemSubType: i.subType);
      final currentSubTypeList = _itemsBySubType[itemSubType] ?? [];
      currentSubTypeList.add(i);
      _itemsBySubType[itemSubType] = currentSubTypeList;

      // Effects list
      for (final effect in i.effects) {
        final currentEffectList = _itemsByEffectType[effect.effectType] ?? [];
        currentEffectList.add(i);
        _itemsByEffectType[effect.effectType] = currentEffectList;
      }
    }
  }

  ItemManager.empty() : _allItems = [];

  @override
  List<Object?> get props => [_allItems];

  Item itemByCode(String code) {
    return _itemsByCode[code]!;
  }

  List<Item> itemsByCraftType(SkillType skillType) {
    return _itemsByCraftType[skillType] ?? [];
  }

  List<Item> itemsByType(ItemType itemType) {
    return _itemsByType[itemType] ?? [];
  }

  List<Item> itemsByTypeAndSubType(ItemType itemType, ItemSubType itemSubType) {
    return _itemsBySubType[
            ItemTypeAndSubType(itemType: itemType, itemSubType: itemSubType)] ??
        [];
  }

  List<Item> itemsByEffectType(EffectType effectType) {
    return _itemsByEffectType[effectType] ?? [];
  }

  List<Item> get allItems => _allItems;
}

class ItemTypeAndSubType with EquatableMixin {
  final ItemType itemType;
  final ItemSubType itemSubType;

  ItemTypeAndSubType({required this.itemType, required this.itemSubType});

  @override
  List<Object?> get props => [itemType, itemSubType];
}
