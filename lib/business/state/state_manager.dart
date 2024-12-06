import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/no_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:rxdart/rxdart.dart';
import 'package:async/async.dart';

class StateManager {
  final BoardState boardState = BoardState();

  final ArtifactsClient artifactsClient;
  final BehaviorSubject<State> _stateSubject = BehaviorSubject();
  Character character = Character.empty();
  Target _target = NoTarget();
  bool needsToStop = false;

  CancelableOperation<void>? _cancelableProcess;

  Stream<State> get stateStream => _stateSubject.stream;

  StateManager({required this.artifactsClient});

  Future<void> init() async {
    await Future.wait([
      _fetchMap(),
      _fetchItems(),
      _fetchMonsters(),
      // _fetchActiveEvents(),
      _fetchTasks(),
      // _fetchAchievements(),
      _fetchResources(),
    ]);
    final characters = await artifactsClient.getCharacters();
    character = characters.first;
    _stateSubject.value = State(boardState: boardState, character: characters.first, target: _target, processResult: TargetProcessResult.empty());
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
    final items = await _loadAllPaged((int page) => artifactsClient.getItems(pageNumber: page),);
    boardState.items = items;
    for (final skillType in SkillType.values) {
      final itemsForType = items.where((i) => i.craft?.skill == skillType).toList();
      boardState.itemsByCraftType[skillType] = itemsForType;
    }
  }

  Future<void> _fetchMonsters() async {
    final results = await _loadAllPaged((int page) => artifactsClient.getMonsters(pageNumber: page),);
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

  Future<void> startTargetBasedUpa() async {
    final future = _startProcessingNextTarget();
    _cancelableProcess = CancelableOperation.fromFuture(future);
    await future;
  }

  Future<void> stopTargetBasedUpa() async {
    await _cancelableProcess?.cancel();
    _target = NoTarget();
    _stateSubject.value = _stateSubject.value.copyWith(target: _target, processResult: TargetProcessResult.empty());
  }

  Future<void> startNewTarget(Target target) async {
    await stopTargetBasedUpa();
    _target = target;
    await startTargetBasedUpa();
  }

  Future<void> _startProcessingNextTarget() async {
    while (true) {
      // Wait for cooldown.
      final now = DateTime.now();
      if (character.cooldownEnd.isAfter(now)) {
        await Future.delayed(character.cooldownEnd.difference(now));
      }

      // Process an update.
      final update = _target.update(character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);

      // Target reached?
      if (update.progress.finished) {
        return;
      }

      // Update the character after this action.
      final result = await update.action;
      character = result?.character ?? character;
      _stateSubject.value = State(boardState: boardState, character: character, target: _target, processResult: update);
    }
  }
}
