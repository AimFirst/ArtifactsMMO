import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
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
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:artifacts_mmo/services/team_ai_service.dart';
import 'package:built_collection/built_collection.dart';

abstract class AIGoal {
  // Higher number means higher priority
  int get priority;

  String get name;

  // Can this goal be pursued by the character right now?
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
  );

  // Execute the logic for this goal (queueing actions, etc.)
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
  );

  void executeWrapper(
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
    state.setCurrentGoal(name);
    LoggerService.instance.log("GOAL: $name", character: state.character);
    execute(
        state,
        aiService,
        combatService,
        worldDataProvider,
        actionFactory,
        mapProvider,
        teamProvider,
        bankProvider,
        teamBrainProvider,
        characterStates);
  }

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
  );

  void handleBestEquipment(
    CharacterState state,
    TeamAIService aiService,
    CombatService combatService,
    EquipmentService equipmentService,
    WorldDataProvider worldDataProvider,
    ActionFactory actionFactory,
    MapProvider mapProvider,
    TeamProvider teamProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
    List<CharacterState> characterStates,
  ) {
    final gearContext = gearEvaluationContext(
        state,
        aiService,
        combatService,
        worldDataProvider,
        actionFactory,
        mapProvider,
        teamProvider,
        bankProvider,
        teamBrainProvider,
        characterStates);

    // Nothing to do for equiping for this goal.
    if (gearContext == null) {
      return;
    }

    for (final slot in ItemSlot.values) {
      final bestInSlot = equipmentService.findBestItemForSlot(
        slot,
        gearContext,
        worldDataProvider.allItems,
        state.character,
        worldDataProvider,
      );
      // Nothing to do for this slot.
      if (bestInSlot == null) {
        continue;
      }

      // Check to see if it's already equipped
      if (state.character.itemInSlot(slot) == bestInSlot.code) {
        continue;
      }

      // Check to see if we have it in inventory
      bool shouldEquip = false;
      if ((state.character.inventory?.count(bestInSlot.code) ?? 0) < 1) {
        // See if we have it in the bank
        if (bankProvider.count(bestInSlot.code) > 0) {
          teamBrainProvider.completeRequest(null, _createEquipRequestKeyPrefix(slot, gearContext), bestInSlot.code, state.character.name);
          teamProvider.queueBankWithdraw(
              state.character,
              BuiltList.of([
                SimpleItemSchemaBuilder()
                    .fromCodeAndQuantity(bestInSlot.code, 1)
              ]));
          shouldEquip = true;
        }
      } else {
        shouldEquip = true;
      }

      if (shouldEquip) {
        if (state.character.itemInSlot(slot).isNotEmpty) {
          teamProvider.queueAction(state.character.name,
              actionFactory.createUnequipAction(state.character.name, slot, 1));
        }
        teamProvider.queueAction(
            state.character.name,
            actionFactory.createEquipAction(
                state.character.name,
                SimpleItemSchemaBuilder()
                    .fromCodeAndQuantity(bestInSlot.code, 1),
                slot));
      } else {
        // Don't have one to equip, request it instead.
        final keyPrefix = _createEquipRequestKeyPrefix(slot, gearContext);
        if (!teamBrainProvider.hasRequest(null, keyPrefix, bestInSlot.code, state.character.name)) {
          teamBrainProvider.postRequest(ItemRequest(
            keyPrefix: keyPrefix,
            requestedBy: state.character.name,
            requestedItem: SimpleItemSchemaBuilder()
                .fromCodeAndQuantity(bestInSlot.code, 1),
            childrenRequests: [],
          ));
        }
      }
    }
  }

  String _createEquipRequestKeyPrefix(
      ItemSlot slot, GearEvaluationContext gearContext) {
    return '${slot.name}-${gearContext.taskType}';
  }
}
