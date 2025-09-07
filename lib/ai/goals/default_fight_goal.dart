import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class DefaultFightGoal extends AIGoal {
  @override
  String get name => 'Default Fight';

  @override
  int get priority => 10;

  @override
  bool canRun(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      LoadoutOptimizerService loadoutOptimizerService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) {
    return true;
  }

  @override
  void execute(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      LoadoutOptimizerService loadoutOptimizerService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) {
    final monsterCode = _monsterToFight(worldDataProvider, combatService,
        state.character, bankProvider, loadoutOptimizerService);

    final location = mapProvider.findNearestTile(
        state.character.location,
        (tile) =>
            tile.content?.type == MapContentType.monster &&
            tile.content?.code == monsterCode);
    if (location == null) {
      LoggerService.instance.log('No monster location found for ${monsterCode}',
          level: LogLevel.warning, character: state.character);
      return;
    }

    teamProvider.queueMoveTo(state.character, location);
    teamProvider.queueAction(
        state.character.name,
        actionFactory.createFightAction(
            state.character.name, monsterCode ?? ''));
  }

  String? _monsterToFight(
    WorldDataProvider worldDataProvider,
    CombatService combatService,
    CharacterSchema character,
    BankProvider bankProvider,
    LoadoutOptimizerService loadoutOptimizerService,
  ) {
    final monsters = worldDataProvider.allMonsters
      ..sort((b, a) => a.level.compareTo(b.level));
    for (final monster in monsters) {
      final idealLoadout = loadoutOptimizerService.bestLoadoutOfAvailableItems(
        character,
        GearEvaluationContext(
            taskType: CharacterExtensions.overallLevelSkillName,
            targetMonster: monster),
        character.inventory
                ?.map((i) => worldDataProvider.getItemByCode(i.code))
                .toList() ??
            [],
        bankProvider.items
            .map((i) => worldDataProvider.getItemByCode(i.code))
            .toList(),
      );
      final tempCharacter = character.copyWithEquippedItems(
          idealLoadout.loadout.itemsBySlot, worldDataProvider);

      if (combatService.canWinFight(tempCharacter, monster)) {
        return monster.code;
      }
    }
    return null;
  }

  @override
  GearEvaluationContext? gearEvaluationContext(
      CharacterState state,
      TeamAIService aiService,
      CombatService combatService,
      LoadoutOptimizerService loadoutOptimizerService,
      WorldDataProvider worldDataProvider,
      ActionFactory actionFactory,
      MapProvider mapProvider,
      TeamProvider teamProvider,
      BankProvider bankProvider,
      TeamBrainProvider teamBrainProvider,
      List<CharacterState> characterStates) {
    final monsterCode = _monsterToFight(
      worldDataProvider,
      combatService,
      state.character,
      bankProvider,
      loadoutOptimizerService,
    );
    if (monsterCode == null) {
      return null;
    }

    final monster = worldDataProvider.getMonsterByCode(monsterCode);
    return GearEvaluationContext(taskType: 'overall', targetMonster: monster);
  }
}
