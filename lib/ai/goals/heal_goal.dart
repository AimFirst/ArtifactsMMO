import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/constants/effect_enum.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/item_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';

class HealGoal extends AIGoal {
  @override
  String get name => 'Heal';

  @override
  int get priority => 100;

  @override
  Future<bool> canRun(
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
      List<CharacterState> characterStates) async {
    return state.character.hp < state.character.maxHp;
  }

  @override
  Future<void> execute(
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
      List<CharacterState> characterStates) async {
    teamProvider.queueAction(state.character.name,
        actionFactory.createRestAction(state.character.name));
  }

  @override
  Future<GearEvaluationContext?> gearEvaluationContext(
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
      List<CharacterState> characterStates) async {
    return HealGearEvaluationContext(hpToRestore: state.character.maxHp - state.character.hp);
  }
}
