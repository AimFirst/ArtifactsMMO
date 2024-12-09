import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/no_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';

class CharacterTargetManager {
  Character character = Character.empty();
  Target _target = NoTarget();
  bool needsToStop = false;

  final ArtifactsClient artifactsClient;
  final BoardState boardState;
  final BehaviorSubject<CharacterState> _stateSubject = BehaviorSubject();

  Stream<CharacterState> get stateStream => _stateSubject.stream;

  CancelableOperation<void>? _cancelableProcess;

  CharacterTargetManager({
    required this.character,
    required this.artifactsClient,
    required this.boardState,
  });

  Future<void> init() async {
    _stateSubject.value = CharacterState(
        character: character,
        target: NoTarget(),
        processResult: TargetProcessResult(
          progress: Progress.done(),
          action: null,
          description: 'Waiting for target',
          imageUrl: null,
        ));
  }

  Future<void> startTargetBasedUpa() async {
    final future = _startProcessingNextTarget();
    _cancelableProcess = CancelableOperation.fromFuture(future);
    await future;
  }

  Future<void> stopTargetBasedUpa() async {
    await _cancelableProcess?.cancel();
    _target = NoTarget();
    _stateSubject.value = _stateSubject.value
        .copyWith(target: _target, processResult: TargetProcessResult.empty());
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
      final update = _target.update(
          character: character,
          boardState: boardState,
          artifactsClient: artifactsClient);

      // Target reached?
      if (update.progress.finished) {
        return;
      }

      // Update the character after this action.
      final result = await update.action;
      character = result?.character ?? character;
      _stateSubject.value = CharacterState(
          character: character, target: _target, processResult: update);
    }
  }
}
