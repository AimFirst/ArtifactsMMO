import 'package:artifacts_mmo/business/state/character_target_manager.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:rxdart/rxdart.dart';

class StateManager {
  final BoardState boardState = BoardState();

  final ArtifactsClient artifactsClient;

  final BehaviorSubject<State> _stateSubject = BehaviorSubject();
  final Map<String, CharacterTargetManager> characterTargetManagers = {};

  Stream<State> get stateStream => _stateSubject.stream;

  StateManager({required this.artifactsClient});

  Future<void> init() async {
    await Future.wait([
      _fetchMap(),
      _fetchItems(),
      _fetchMonsters(),
      _fetchActiveEvents(),
      _fetchTasks(),
      _fetchAchievements(),
      _fetchResources(),
    ]);
    _stateSubject.value =
        State(boardState: boardState, characterStates: {});
    final characters = await artifactsClient.getCharacters();
    for (final c in characters) {
      final characterTargetManager = CharacterTargetManager(
        character: c,
        artifactsClient: artifactsClient,
        boardState: boardState,
      );
      characterTargetManagers[c.name] = characterTargetManager;
      await characterTargetManager.init();
      characterTargetManager.stateStream.listen((c) {
        final currentState = {..._stateSubject.value.characterStates};
        currentState[c.character.name] = c;
        _stateSubject.value = _stateSubject.value.copyWith(characterStates: {...currentState});
      });
    }
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
    final items = await _loadAllPaged(
      (int page) => artifactsClient.getItems(pageNumber: page),
    );
    boardState.items = items;
    for (final skillType in SkillType.values) {
      final itemsForType =
          items.where((i) => i.craft?.skill == skillType).toList();
      boardState.itemsByCraftType[skillType] = itemsForType;
    }
  }

  Future<void> _fetchMonsters() async {
    final results = await _loadAllPaged(
      (int page) => artifactsClient.getMonsters(pageNumber: page),
    );
    boardState.monsters = results;
    for (final monster in results) {
      for (final drop in monster.drops) {
        final content = Content(type: ContentType.item, code: drop.code);
        final existingEntry = boardState.dropsFromMonsters[content] ?? [];
        existingEntry.add(monster);
        boardState.dropsFromMonsters[content] = existingEntry;
      }
    }
  }

  Future<void> _fetchActiveEvents() async {
    boardState.activeEvents = await _loadAllPaged(
      (int page) => artifactsClient.getActiveEvents(pageNumber: page),
    );
  }

  Future<void> _fetchTasks() async {
    boardState.tasks = await _loadAllPaged(
      (int page) => artifactsClient.getTasks(pageNumber: page),
    );
  }

  Future<void> _fetchAchievements() async {
    boardState.achievements = await _loadAllPaged(
      (int page) => artifactsClient.getAchievements(pageNumber: page),
    );
  }

  Future<void> _fetchResources() async {
    final results = await _loadAllPaged(
        (int page) => artifactsClient.getResources(pageNumber: page));
    boardState.resources = results;
    for (final resource in results) {
      for (final drop in resource.drops) {
        final content = Content(type: ContentType.item, code: drop.code);
        final existingEntry = boardState.dropsFromResources[content] ?? [];
        existingEntry.add(resource);
        boardState.dropsFromResources[content] = existingEntry;
      }
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
}
