import 'dart:math';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/item_extension.dart';
import 'package:artifacts_mmo/extensions/item_type_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
import 'package:artifacts_mmo/extensions/team_provider_actions.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_state.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/gear_evaluation_context.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
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
import 'package:built_collection/built_collection.dart';

abstract class AIGoal {
  static const consumableItemFetchBatchSize = 10;

  // Higher number means higher priority
  int get priority;

  String get name;

  // Can this goal be pursued by the character right now?
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
    List<CharacterState> characterStates,
  );

  // Execute the logic for this goal (queueing actions, etc.)
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
    List<CharacterState> characterStates,
  );

  Future<void> executeWrapper(
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
  ) async {
    state.setCurrentGoal(name);
    LoggerService.instance.log("GOAL: $name", character: state.character);
    await execute(
        state,
        aiService,
        combatService,
        loadoutOptimizerService,
        worldDataProvider,
        actionFactory,
        mapProvider,
        teamProvider,
        bankProvider,
        teamBrainProvider,
        characterStates);
  }

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
    List<CharacterState> characterStates,
  );

  Future<void> handleBestEquipment(
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
  ) async {
    final gearContext = await gearEvaluationContext(
        state,
        aiService,
        combatService,
        loadoutOptimizerService,
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

    // Find our ideal equipment/items and request missing ones.
    await requestAllMissingBestItems(
      state,
      gearContext,
      loadoutOptimizerService,
      worldDataProvider,
      bankProvider,
      teamBrainProvider,
    );

    // Find our best equipment/items that we have available right now and equip/use them.
    await _useBestAvailableItems(
      state,
      gearContext,
      loadoutOptimizerService,
      worldDataProvider,
      bankProvider,
      teamProvider,
      teamBrainProvider,
      actionFactory,
    );
  }

  Future<void> _useBestAvailableItems(
      CharacterState state,
      GearEvaluationContext gearContext,
      LoadoutOptimizerService loadoutOptimizerService,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      TeamProvider teamProvider,
      TeamBrainProvider teamBrainProvider,
      ActionFactory actionFactory) async {
    // Currently equipped items
    final EquipmentLoadout currentLoadout =
        EquipmentLoadout.fromCharacter(state.character, worldDataProvider);

    // Find the best equipment that we have available right now.
    final bestAvailableEquipment =
        await loadoutOptimizerService.bestLoadoutOfAvailableCharacterItems(
      state.character,
      gearContext,
      worldDataProvider,
      bankProvider,
    );

    for (final itemWithSlot
        in bestAvailableEquipment.loadout.itemsBySlot.entries) {
      final item = itemWithSlot.value;
      final slot = itemWithSlot.key;
      // If it's null, whatever item is currently equipped in this slot will be fine.
      if (item == null) {
        continue;
      }

      // Check to see if it's already equipped
      if (currentLoadout.itemsBySlot[slot]?.item.code == item.item.code) {
        continue;
      }

      bool foundOneToEquip = false;
      // Check to see if it's in our inventory
      if ((state.character.inventory?.count(item.item.code) ?? 0) > 0) {
        foundOneToEquip = true;
      }

      // Check to see if it's in the bank
      if (!foundOneToEquip && bankProvider.count(item.item.code) > 0) {
        teamBrainProvider.completeRequest(
            null,
            _createEquipRequestKeyPrefix(slot),
            item.item.code,
            state.character.name);
        teamProvider.queueBankWithdraw(
            state.character,
            BuiltList.of([
              SimpleItemSchemaBuilder().fromCodeAndQuantity(item.item.code, 1)
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
                    .fromCodeAndQuantity(item.item.code, 1),
                slot));
      }
    }

    // Check if there's any items to use
    List<SimpleItemSchema> itemsToPullFromBank = [];
    List<SimpleItemSchema> itemsToConsume = [];
    for (final item in bestAvailableEquipment.itemsToUse) {
      int quantityNeeded = item.quantity;

      quantityNeeded -= state.character.inventory?.count(item.item.code) ?? 0;
      if (quantityNeeded <= 0) {
        final bankCount = bankProvider.count(item.item.code);
        if (bankCount < quantityNeeded) {
          LoggerService.instance.log(
              'Not enough items in inventory or bank to use ${item.item}.',
              character: state.character,
              level: LogLevel.warning);
          continue;
        }
        teamBrainProvider.completeRequest(
            null,
            _createEquipRequestKeyPrefix(null),
            item.item.code,
            state.character.name);
        itemsToPullFromBank.add((SimpleItemSchemaBuilder()
              ..code = item.item.code
              ..quantity = max(
                  min(bankCount, consumableItemFetchBatchSize), quantityNeeded))
            .build());
        itemsToConsume.add(item.toSimpleItemSchema());
      }
    }

    if (itemsToPullFromBank.isNotEmpty) {
      teamProvider.queueBankWithdraw(
          state.character, BuiltList.of(itemsToPullFromBank));
    }
    for (final item in itemsToConsume) {
      teamProvider.queueAction(state.character.name,
          actionFactory.createUseItemAction(state.character.name, item));
    }
  }

  Future<void> requestAllMissingBestItems(
    CharacterState state,
    GearEvaluationContext gearContext,
    LoadoutOptimizerService loadoutOptimizerService,
    WorldDataProvider worldDataProvider,
    BankProvider bankProvider,
    TeamBrainProvider teamBrainProvider,
  ) async {
    // Currently equipped items
    final EquipmentLoadout currentLoadout =
        EquipmentLoadout.fromCharacter(state.character, worldDataProvider);

    // Find our ideal equipment and request any that is missing.
    final bestEquipment = await loadoutOptimizerService.bestLoadoutOfAllItems(
      state.character,
      gearContext,
      worldDataProvider,
    );

    final allItems = [
      ...bestEquipment.loadout.items,
      ...bestEquipment.itemsToUse
    ];
    for (final item in allItems) {
      if (item == null) {
        continue;
      }

      final slot = item.item.itemSlot;

      // Check to see if it's already equipped
      if (slot != null &&
          currentLoadout.itemsBySlot[slot]?.item.code == item.item.code) {
        continue;
      }

      int quantityNeeded = slot != null
          ? item.quantity
          : max(item.quantity, consumableItemFetchBatchSize);

      // Check to see if it's in our inventory
      quantityNeeded -= state.character.inventory?.count(item.item.code) ?? 0;
      if (quantityNeeded <= 0) {
        continue;
      }

      // Check to see if it's in the bank
      quantityNeeded -= bankProvider.count(item.item.code);
      if (quantityNeeded <= 0) {
        continue;
      }

      // Not found anywhere, let's request it.
      final keyPrefix = _createEquipRequestKeyPrefix(slot);
      if (!teamBrainProvider.hasRequest(
          null, keyPrefix, item.item.code, state.character.name)) {
        teamBrainProvider.postRequest(ItemRequest(
          keyPrefix: keyPrefix,
          requestedBy: state.character.name,
          requestedItem: SimpleItemSchemaBuilder()
              .fromCodeAndQuantity(item.item.code, quantityNeeded),
          childrenRequests: [],
        ));
      }
    }
  }

  String _createEquipRequestKeyPrefix(ItemSlot? slot) {
    return '${slot?.name ?? 'other'}-gear';
  }
}
