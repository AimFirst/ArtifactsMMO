import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';

class State {
  final BoardState boardState;
  final Character character;
  final Target target;
  final TargetProcessResult processResult;

  State({
    required this.boardState,
    required this.character,
    required this.target,
    required this.processResult,
  });
}

class BoardState {
  Map<Location, MapLocation> map = {};
  List<Resource> resources = [];
  Map<Content, List<Location>> contentLocations = {};
  Map<Content, List<Resource>> dropsFromResources = {};
  Map<SkillType, List<Item>> itemsByCraftType = {};
  List<Item> items = [];
  List<Monster> monsters = [];
  Map<Content, List<Monster>> dropsFromMonsters = {};
  List<ActiveEvent> activeEvents = [];
  List<Task> tasks = [];
  List<Achievement> achievements = [];
}
