import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/gathering_skill_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:rxdart/rxdart.dart';

class StateManager {
  final BoardState boardState = BoardState();

  final ArtifactsClient artifactsClient;
  final BehaviorSubject<State> _stateSubject = BehaviorSubject();
  Character character = Character.empty();

  Stream<State> get stateStream => _stateSubject.stream;

  StateManager({required this.artifactsClient});

  Future<void> init() async {
    await Future.wait([
      _fetchMap(),
      // _fetchItems(),
      // _fetchMonsters(),
      // _fetchActiveEvents(),
      // _fetchTasks(),
      // _fetchAchievements(),
      _fetchResources(),
    ]);
    final characters = await artifactsClient.getCharacters();
    character = characters.first;
    _stateSubject.value = State(boardState: boardState, character: characters.first, target: getNextTarget(character: character), processResult: TargetProcessResult.empty());
  }

  Target getNextTarget({required Character character}) {
    return GatheringSkillTarget(skillType: SkillType.woodcutting, targetLevel: 7);
  }

  Future<void> _fetchMap() async {
    final results = await _loadAllPaged(
        (int page) => artifactsClient.getMap(pageNumber: page));
    for (final mapLocation in results) {
      boardState.map[mapLocation.location] = mapLocation;
      final content = mapLocation.content;
      if (content != null) {
        final existingContentList = boardState.contentLocations[content] ?? [];
        existingContentList.add(mapLocation.location);
        boardState.contentLocations[content] = existingContentList;
      }
    }
  }

  Future<void> _fetchItems() async {
    boardState.items = await _loadAllPaged((int page) => artifactsClient.getItems(pageNumber: page),);
  }

  Future<void> _fetchMonsters() async {
    boardState.monsters = await _loadAllPaged((int page) => artifactsClient.getMonsters(pageNumber: page),);
  }

  Future<void> _fetchActiveEvents() async {
    boardState.activeEvents = await _loadAllPaged((int page) => artifactsClient.getActiveEvents(pageNumber: page),);
  }

  Future<void> _fetchTasks() async {
    boardState.tasks = await _loadAllPaged((int page) => artifactsClient.getTasks(pageNumber: page),);
  }

  Future<void> _fetchAchievements() async {
    boardState.achievements = await _loadAllPaged((int page) => artifactsClient.getAchievements(pageNumber: page),);
  }

  Future<void> _fetchResources() async {
    final results = await _loadAllPaged(
        (int page) => artifactsClient.getResources(pageNumber: page));
    boardState.resources = results;
    for (final resource in results) {
      final content = Content.item(code: resource.code);
      final existingEntry = boardState.dropsFromResources[content] ?? [];
      existingEntry.add(resource);
      boardState.dropsFromResources[content] = existingEntry;
    }
  }

  Future<List<V>> _loadAllPaged<V, T extends PagedResponse<V>>(
    Future<PagedResponse<V>> Function(int) fetcher,
  ) async {
    final result = <V>[];
    var nextPage = 1;
    var totalPages = 0;
    do {
      final response = await fetcher(nextPage);
      result.addAll(response.data);
      totalPages = response.pages ?? 1;
    } while (nextPage++ < totalPages);
    return result;
  }

  Future<void> startTargetBasedUpa() async {
    final target = getNextTarget(character: character);
    while (true) {
      // Wait for cooldown.
      final now = DateTime.now();
      if (character.cooldownEnd.isAfter(now)) {
        await Future.delayed(character.cooldownEnd.difference(now));
      }

      // Process an update.
      final update = target.update(character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);
      _stateSubject.value = State(boardState: boardState, character: character, target: target, processResult: update);

      // Target reached?
      if (update.progress.finished) {
        return;
      }

      // Update the character after this action.
      final result = await update.action;
      character = result?.character ?? character;
    }
  }
}
