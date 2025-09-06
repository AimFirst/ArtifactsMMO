import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/providers/bank_provider.dart';
import 'package:artifacts_mmo/providers/map_provider.dart';
import 'package:artifacts_mmo/providers/team_brain_provider.dart';
import 'package:artifacts_mmo/providers/team_provider.dart';
import 'package:artifacts_mmo/providers/world_data_provider.dart';
import 'package:artifacts_mmo/services/combat_service.dart';
import 'package:artifacts_mmo/services/loadout_optimizer_service.dart';
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
    LoadoutOptimizerService loadoutOptimizerService,
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

    // Nothing to do for equipping for this goal.
    if (gearContext == null) {
      return;
    }

    // Currently equipped items
    final EquipmentLoadout currentLoadout =
        EquipmentLoadout.fromCharacter(state.character, worldDataProvider);

    // Find our ideal equipment and request any that is missing.
    final bestEquipment = loadoutOptimizerService.bestLoadout(
        state.character, gearContext, worldDataProvider.allItems);
    for (final itemWithSlot in bestEquipment.loadout.itemsBySlot.entries) {
      final item = itemWithSlot.value;
      final slot = itemWithSlot.key;
      if (item == null) {
        continue;
      }

      // Check to see if it's already equipped
      if (currentLoadout.itemsBySlot[slot]?.code == item.code) {
        continue;
      }

      // Check to see if it's in our inventory
      if ((state.character.inventory
                  ?.where((inventoryItem) => inventoryItem.code == item.code) ??
              [])
          .isNotEmpty) {
        continue;
      }

      // Check to see if it's in the bank
      if (bankProvider.items
          .where((bankItem) => bankItem.code == item.code)
          .isNotEmpty) {
        continue;
      }

      // Not found anywhere, let's request it.
      final keyPrefix = _createEquipRequestKeyPrefix(slot, gearContext);
      if (!teamBrainProvider.hasRequest(
          null, keyPrefix, item.code, state.character.name)) {
        teamBrainProvider.postRequest(ItemRequest(
          keyPrefix: keyPrefix,
          requestedBy: state.character.name,
          requestedItem:
              SimpleItemSchemaBuilder().fromCodeAndQuantity(item.code, 1),
          childrenRequests: [],
        ));
      }
    }

    // Find the best equipment that we have available right now.
    final bestAvailableEquipment =
        loadoutOptimizerService.bestLoadoutOfAvailableItems(
            state.character,
            gearContext,
            state.character.inventory
                    ?.map((item) => worldDataProvider.getItemByCode(item.code))
                    .toList() ??
                <ItemSchema?>[],
            bankProvider.items
                .map((item) => worldDataProvider.getItemByCode(item.code))
                .toList());

    for (final itemWithSlot in bestAvailableEquipment.loadout.itemsBySlot.entries) {
      final item = itemWithSlot.value;
      final slot = itemWithSlot.key;
      // If it's null, whatever item is currently equipped in this slot will be fine.
      if (item == null) {
        continue;
      }

      // Check to see if it's already equipped
      if (currentLoadout.itemsBySlot[slot]?.code == item.code) {
        continue;
      }

      bool foundOneToEquip = false;
      // Check to see if it's in our inventory
      if ((state.character.inventory
          ?.where((inventoryItem) => inventoryItem.code == item.code) ??
          [])
          .isNotEmpty) {
        foundOneToEquip = true;
      }

      // Check to see if it's in the bank
      if (!foundOneToEquip && bankProvider.items
          .where((bankItem) => bankItem.code == item.code)
          .isNotEmpty) {
        teamBrainProvider.completeRequest(
            null,
            _createEquipRequestKeyPrefix(slot, gearContext),
            item.code,
            state.character.name);
        teamProvider.queueBankWithdraw(
            state.character,
            BuiltList.of([
              SimpleItemSchemaBuilder()
                  .fromCodeAndQuantity(item.code, 1)
            ]));
        foundOneToEquip = true;
      }

      // We found one to equip, let's do it.
      if (foundOneToEquip) {
        // Queue up an equip action
        teamProvider.queueAction(
            state.character.name,
            actionFactory.createEquipAction(
                state.character.name,
                SimpleItemSchemaBuilder()
                    .fromCodeAndQuantity(item.code, 1),
                slot));
      }
    }
  }

  String _createEquipRequestKeyPrefix(
      ItemSlot slot, GearEvaluationContext gearContext) {
    return '${slot.name}-${gearContext.taskType}';
  }
}
