import 'package:artifacts_mmo/business/state/board/bank_manager.dart';
import 'package:artifacts_mmo/business/state/character_log.dart';
import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/no_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/business/state/target/team/team_target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank_gold.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';

class CharacterTargetManager {
  Character character = Character.empty();
  final CharacterLog characterLog = CharacterLog();
  Target _target = NoTarget(parentTarget: null, characterLog: CharacterLog());
  Target _overrideTarget =
      NoTarget(parentTarget: null, characterLog: CharacterLog());
  bool needsToStop = false;

  final ArtifactsClient artifactsClient;
  final Stream<BoardState> boardStateStream;
  BoardState boardState = BoardState.empty();
  final BehaviorSubject<CharacterState> _stateSubject = BehaviorSubject();
  final BankManager bankManager;
  final TeamManager teamManager;

  ValueStream<CharacterState> get stateStream => _stateSubject;

  CancelableOperation<void>? _cancelableProcess;

  CharacterTargetManager({
    required this.character,
    required this.artifactsClient,
    required this.boardStateStream,
    required this.bankManager,
    required this.teamManager,
  });

  Future<void> init() async {
    boardStateStream.listen((b) => boardState = b);

    _target = TeamTarget(
      teamManager: teamManager,
      desiredRoleTypes: _desiredRolesForCharacter(character.name),
      parentTarget: null,
      characterLog: characterLog,
    );

    _stateSubject.value = CharacterState(
      character: character,
      target: _target,
      processResult: TargetProcessResult(
        progress: Progress.done(),
        action: null,
        description: 'Waiting for target',
        imageUrl: null,
      ),
      characterLog: characterLog.current,
    );

    startTargetBasedUpa();
  }

  List<RoleType> _desiredRolesForCharacter(String characterName) {
    if (characterName == 'AimLater') {
      return [RoleType.fighting];
    } else if (characterName == 'Worker1') {
      return [RoleType.gearCrafting, RoleType.mining];
    } else if (characterName == 'Worker2') {
      return [RoleType.weaponCrafting, RoleType.woodcutting];
    } else if (characterName == 'Worker3') {
      return [RoleType.cooking, RoleType.fishing];
    } else if (characterName == 'Worker4') {
      return [RoleType.jewelryCrafting, RoleType.alchemy];
    } else {
      return [];
    }
  }

  Future<void> startTargetBasedUpa() async {
    final future = _startProcessingNextTarget();
    _cancelableProcess = CancelableOperation.fromFuture(future);
    await future;
  }

  Future<void> stopTargetBasedUpa() async {
    _overrideTarget = NoTarget(parentTarget: null, characterLog: characterLog);
    _stateSubject.value = _stateSubject.value
        .copyWith(target: _target, processResult: TargetProcessResult.empty());
  }

  Future<void> startNewTarget(Target target) async {
    _overrideTarget = target;
  }

  Future<void> _startProcessingNextTarget() async {
    while (true) {
      // Wait for cooldown.
      final now = DateTime.now();
      if (character.cooldownEnd.isAfter(now)) {
        await Future.delayed(character.cooldownEnd.difference(now));
      }

      // Wait for the board to be initialized.
      if (boardState == BoardState.empty()) {
        await Future.delayed(const Duration(seconds: 1));
        continue;
      }

      characterLog.startNewLogSet();

      // Try override first.
      TargetProcessResult? update;
      final overrideUpdate = _overrideTarget.update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient,
      );
      if (!overrideUpdate.progress.finished) {
        update = overrideUpdate;
      }

      // Process a normal update if we didn't have an override.
      update ??= _target.update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient,
      );

      if (overrideUpdate.progress.finished) {
        _overrideTarget =
            NoTarget(parentTarget: null, characterLog: characterLog);
      }

      // Target reached?
      if (update.progress.finished) {
        return;
      }

      // Update the character after this action.
      try {
        final result = await update.action;
        if (result is ActionBankGoldResponse) {
          bankManager.updateBankGold(result.bank);
        } else if (result is ActionBankItemResponse) {
          bankManager.updateBankItems(result.bank);
        }
        character = result?.character ?? character;
      } catch (ex) {
        characterLog.addLog('Error encountered. $ex');
        character = character.copyWith(
            cooldownEnd: DateTime.now().add(const Duration(seconds: 10)));
      }
      _stateSubject.value = CharacterState(
        character: character,
        target: _target,
        processResult: update,
        characterLog: characterLog.current,
      );
    }
  }
}
