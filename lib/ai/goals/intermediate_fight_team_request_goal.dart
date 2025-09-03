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
      // Someone else is already on it.
      if (request.fulfilledBy != null) {
        continue;
      }

      // We can gather this item by fighting, so do it.
      if (_canGather(state, request.itemName, worldDataProvider, combatService)) {
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
      // Someone else is already on it.
      if (request.fulfilledBy != null) {
        continue;
      }

      // We can gather this item, so do it.
      if (_canGather(state, request.itemName, worldDataProvider, combatService)) {
        final monsters = worldDataProvider.allMonsters;
        for (final monster in monsters) {
          for (final drop in monster.drops) {
            if (drop.code == request.itemName) {
              final location = mapProvider.findNearestTile(state.character.location, (tile) => tile.content?.type == MapContentType.monster && tile.content?.code == monster.code);
              if (location == null) {
                LoggerService.instance.log('No monster location found for ${monster.code}', level: LogLevel.warning, character: state.character);
                continue;
              }
              teamProvider.queueMoveTo(state.character, location);
              teamProvider.queueAction(state.character.name, actionFactory.createFightAction(state.character.name));
              return;
              }
            }
        }
      }
    }
  }

  bool _canGather(CharacterState character, String itemCode, WorldDataProvider worldDataProvider, CombatService combatService) {
    final item = worldDataProvider.getResourceByDropCode(itemCode);
    if (item == null) {
      return false;
    }

    final monsters = worldDataProvider.allMonsters;
    for (final monster in monsters) {
      for (final drop in monster.drops) {
        if (drop.code == itemCode) {
          if (combatService.canWinFight(character.character, monster)) {
            return true;
          }
        }
      }
    }

    return false;
  }
}
