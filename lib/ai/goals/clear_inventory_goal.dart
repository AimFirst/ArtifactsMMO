import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/equipment_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';

class ClearInventoryGoal extends AIGoal {
  @override
  int get priority => 90;

  @override
  String get name => 'Bank';

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
    // This goal can only run if the character's inventory is almost full.
    return state.isInventoryNearlyFull;
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
    final character = state.character;

    // If we are working on a quest and have quest items, deposit those first.
    if (character.task.isNotEmpty &&
        character.taskType == 'items' &&
        (character.inventory?.count(character.task) ?? 0) > 0) {
      teamProvider.queueTaskDeposit(state);
    } else {
      teamProvider.queueBankDeposit(
          state.character,
          BuiltList.of(character.inventory
                  ?.map((i) => ((SimpleItemSchemaBuilder()
                        ..code = i.code
                        ..quantity = i.quantity)
                      .build()))
                  .where((i) => i.quantity > 0) ??
              <SimpleItemSchema>[]));
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
    return null;
  }
}
