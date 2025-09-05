import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
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
import 'package:collection/collection.dart';
import 'package:built_collection/built_collection.dart';

class FulfillTeamRequestGoal extends AIGoal {
  @override
  int get priority => 70;

  @override
  String get name => 'Fulfill Request';

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
      List<CharacterState> characterStates) {
    return teamBrainProvider.openRequests.any((request) =>
        (state.character.inventory?.count(request.requestedItem.code) ?? 0) >=
        request.requestedItem.quantity);
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
      List<CharacterState> characterStates) {
    final request = teamBrainProvider.openRequests.firstWhereOrNull((request) =>
        (state.character.inventory?.count(request.requestedItem.code) ?? 0) >=
        request.requestedItem.quantity);
    if (request == null) {
      LoggerService.instance.log("AI: Can't find a request to fulfill.",
          level: LogLevel.warning, character: state.character);
      return;
    }

    teamProvider.queueBankDeposit(
        state.character,
        BuiltList.of([
          SimpleItemSchemaBuilder().fromCodeAndQuantity(request.requestedItem.code, request.requestedItem.quantity)
        ]));
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
    List<CharacterState> characterStates,
  ) {
    return null;
  }
}
