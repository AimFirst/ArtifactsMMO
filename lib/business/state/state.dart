import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank_details.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
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

  State.empty() : boardState = BoardState.empty(), characterStates = {};

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
  final Map<SkillType, List<Item>> itemsByCraftType;
  final List<Item> items;
  final List<Monster> monsters;
  final Map<Content, List<Monster>> dropsFromMonsters;
  final List<ActiveEvent> activeEvents;
  final List<Task> tasks;
  final List<Achievement> achievements;
  final List<ItemQuantity> bankItems;
  final BankDetails bankDetails;

  BoardState({
    required this.map,
    required this.resources,
    required this.contentLocations,
    required this.dropsFromResources,
    required this.itemsByCraftType,
    required this.items,
    required this.monsters,
    required this.dropsFromMonsters,
    required this.activeEvents,
    required this.tasks,
    required this.achievements,
    required this.bankItems,
    required this.bankDetails,
  });

  BoardState.empty()
      : map = {},
        resources = [],
        contentLocations = {},
        dropsFromResources = {},
        itemsByCraftType = {},
        items = [],
        monsters = [],
        dropsFromMonsters = {},
        activeEvents = [],
        tasks = [],
        achievements = [],
        bankItems = [],
        bankDetails = BankDetails.empty();

  @override
  List<Object?> get props => [
        map,
        resources,
        contentLocations,
        dropsFromResources,
        itemsByCraftType,
        items,
        monsters,
        dropsFromMonsters,
        activeEvents,
        tasks,
        achievements,
      ];
}
