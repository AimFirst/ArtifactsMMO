import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/achievement/achievement.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/event/active_event.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
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

  @override
  List<Object?> get props => [boardState, characterStates,];
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
