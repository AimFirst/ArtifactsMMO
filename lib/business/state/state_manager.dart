import 'dart:async';

import 'package:artifacts_mmo/business/state/board/achievement_manager.dart';
import 'package:artifacts_mmo/business/state/board/bank_manager.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/business/state/board/event_manager.dart';
import 'package:artifacts_mmo/business/state/board/item_element_manager.dart';
import 'package:artifacts_mmo/business/state/board/map_manager.dart';
import 'package:artifacts_mmo/business/state/board/monster_manager.dart';
import 'package:artifacts_mmo/business/state/board/resource_manager.dart';
import 'package:artifacts_mmo/business/state/board/task_manager.dart';
import 'package:artifacts_mmo/business/state/character_target_manager.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/no_target.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/business/state/target/team/team_target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank.dart';
import 'package:rxdart/rxdart.dart';

class StateManager {
  late final BehaviorSubject<BoardState> boardStateStream;
  BoardState _boardState = BoardState.empty();
  final AchievementManager achievementManager;
  final BankManager bankManager;
  final EventManager eventManager;
  final ItemElementManager itemManager;
  final MapManager mapManager;
  final MonsterManager monsterManager;
  final ResourceManager resourceManager;
  final TaskManager taskManager;

  final teamManager = TeamManager();

  final ArtifactsClient artifactsClient;

  final BehaviorSubject<State> _stateSubject =
      BehaviorSubject.seeded(State.empty());
  final Map<String, CharacterTargetManager> characterTargetManagers = {};

  Stream<State> get stateStream => _stateSubject.stream;

  List<BoardElementManager> get _managers => [
        achievementManager,
        bankManager,
        eventManager,
        itemManager,
        mapManager,
        monsterManager,
        resourceManager,
        taskManager,
      ];

  StateManager({required this.artifactsClient})
      : achievementManager =
            AchievementManager(artifactsClient: artifactsClient),
        bankManager = BankManager(artifactsClient: artifactsClient),
        eventManager = EventManager(artifactsClient: artifactsClient),
        itemManager = ItemElementManager(artifactsClient: artifactsClient),
        mapManager = MapManager(artifactsClient: artifactsClient),
        monsterManager = MonsterManager(artifactsClient: artifactsClient),
        resourceManager = ResourceManager(artifactsClient: artifactsClient),
        taskManager = TaskManager(artifactsClient: artifactsClient) {
    boardStateStream = BehaviorSubject.seeded(BoardState.empty())
      ..addStream(combineLatestAll(
        achievementManager.achievementsSubject,
        bankManager.bankItemsSubject,
        bankManager.bankDetailsSubject,
        eventManager.activeEventsSubject,
        itemManager.itemsSubject,
        mapManager.contentLocationSubject,
        mapManager.mapSubject,
        monsterManager.dropsFromMonstersSubject,
        monsterManager.monsterSubject,
        resourceManager.dropsFromResourcesSubject,
        resourceManager.resourcesSubject,
        taskManager.tasksSubject,
        (a, b, c, d, f, g, h, i, j, k, l, m) => BoardState(
          map: h,
          resources: l,
          contentLocations: g,
          dropsFromResources: k,
          items: ItemManager(items: f),
          monsters: j,
          dropsFromMonsters: i,
          activeEvents: d,
          tasks: m,
          achievements: a,
          bank: Bank(bankDetails: c, items: b),
        ),
      ));
  }

  static Stream<T> combineLatestAll<A, B, C, D, E, F, G, H, I, J, K, L, T>(
    Stream<A> streamA,
    Stream<B> streamB,
    Stream<C> streamC,
    Stream<D> streamD,
    Stream<E> streamE,
    Stream<F> streamF,
    Stream<G> streamG,
    Stream<H> streamH,
    Stream<I> streamI,
    Stream<J> streamJ,
    Stream<K> streamK,
    Stream<L> streamL,
    T Function(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l)
        combiner,
  ) =>
      CombineLatestStream<dynamic, T>(
        [
          streamA,
          streamB,
          streamC,
          streamD,
          streamE,
          streamF,
          streamG,
          streamH,
          streamI,
          streamJ,
          streamK,
          streamL,
        ],
        (List<dynamic> values) {
          return combiner(
            values[0] as A,
            values[1] as B,
            values[2] as C,
            values[3] as D,
            values[4] as E,
            values[5] as F,
            values[6] as G,
            values[7] as H,
            values[8] as I,
            values[9] as J,
            values[10] as K,
            values[11] as L,
          );
        },
      );

  Future<void> init() async {
    await Future.wait(_managers.map((m) => m.init()));
    boardStateStream.listen((b) {
      _boardState = b;
      var tempValue = _stateSubject.value;
      tempValue = tempValue.copyWith(boardState: b);
      _stateSubject.value = tempValue;
    });
    _stateSubject.value = State(boardState: _boardState, characterStates: {});
    final characters = await artifactsClient.getCharacters();
    for (final c in characters) {
      final characterTargetManager = CharacterTargetManager(
        character: c,
        artifactsClient: artifactsClient,
        boardStateStream: boardStateStream,
        bankManager: bankManager,
      );
      characterTargetManagers[c.name] = characterTargetManager;
      await characterTargetManager.init();
      characterTargetManager.stateStream.listen((c) {
        final currentState = {..._stateSubject.value.characterStates};
        currentState[c.character.name] = c;
        _stateSubject.value =
            _stateSubject.value.copyWith(characterStates: {...currentState});
      });
    }
  }

  void toggleTeamPlayer(String characterName) {
    final targetManager = characterTargetManagers[characterName];
    if (targetManager != null) {
      if (teamManager.characters.containsKey(characterName)) {
        removeCharacterFromTeam(characterName);
      } else {
        addCharacterToTeam(characterName);
      }
    }
  }

  void addCharacterToTeam(String characterName) {
    final targetManager = characterTargetManagers[characterName];
    if (targetManager != null) {
      teamManager.addCharacter(targetManager.stateStream);
      targetManager.startNewTarget(TeamTarget(teamManager: teamManager));
    }
  }

  void removeCharacterFromTeam(String characterName) {
    final targetManager = characterTargetManagers[characterName];
    if (targetManager != null) {
      teamManager.removeCharacter(targetManager.stateStream);
      targetManager.startNewTarget(NoTarget());
    }
  }
}
