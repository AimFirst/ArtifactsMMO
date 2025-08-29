import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';

class BankItemsGoal extends AIGoal {
  @override
  int get priority => 100; // The highest priority

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
    // This goal can only run if the character's inventory is full.
    return state.isInventoryFull;
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
    LoggerService.instance
        .log("GOAL: ${character.name} is banking full inventory.");

    // This contains the logic to find the bank and queue move/deposit actions.
    final bankLocation = mapProvider.findNearestTile(
      character.location,
      (tile) => tile.content?.code == 'bank',
    );

    if (bankLocation != null) {
      teamProvider.queueAction(
          character.name,
          actionFactory.createMoveAction(
              character.name, bankLocation.x, bankLocation.y));
      teamProvider.queueAction(
          character.name,
          actionFactory.createBankAction(
              character.name,
              BuiltList.of(
                  character.inventory?.map((i) => ((SimpleItemSchemaBuilder()
                            ..code = i.code
                            ..quantity = i.quantity)
                          .build())) ??
                      <SimpleItemSchema>[])));
    }
  }

  @override
  String get name => 'Bank';
}
