import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/equipment_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class IntermediateFightTeamRequestGoal extends AIGoal {
  @override
  String get name => 'Intermediate Fight Team Request';

  @override
  int get priority => 50;

  @override
  bool canRun(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) {
    for (final request in teamBrainProvider.openRequests) {
      // We can gather this item by fighting, so do it.
      if (_canGather(
          state, request.requestedItem.code, worldDataProvider, combatService) != null) {
        return true;
      }
    }

    return false;
  }

  @override
  void execute(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) {
    for (final request in teamBrainProvider.openRequests) {

      // We can gather this item, so do it.
      final monster =
          _canGather(state, request.requestedItem.code, worldDataProvider, combatService);
      if (monster != null) {
        final location = mapProvider.findNearestTile(
            state.character.location,
            (tile) =>
                tile.content?.type == MapContentType.monster &&
                tile.content?.code == monster.code);
        if (location == null) {
          LoggerService.instance.log(
              'No monster location found for ${monster.code}',
              level: LogLevel.warning,
              character: state.character);
          continue;
        }
        teamProvider.queueMoveTo(state.character, location);
        teamProvider.queueAction(state.character.name,
            actionFactory.createFightAction(state.character.name, monster.code));
        return;
      }
    }
  }

  @override
  GearEvaluationContext? gearEvaluationContext(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) {
    for (final request in teamBrainProvider.openRequests) {

      // We can gather this item by fighting, so do it.
      final monster =
          _canGather(state, request.requestedItem.code, worldDataProvider, combatService);
      if (monster != null) {
        return GearEvaluationContext(
            taskType: 'overall', targetMonster: monster);
      }
    }

    return null;
  }

  MonsterSchema? _canGather(CharacterState character, String itemCode,
      WorldDataProvider worldDataProvider, CombatService combatService) {
    final monsters = worldDataProvider.getMonstersByDropCode(itemCode);

    for (final monster in monsters) {
      if (combatService.canWinFight(character.character, monster)) {
        return monster;
      }
    }

    return null;
  }
}
