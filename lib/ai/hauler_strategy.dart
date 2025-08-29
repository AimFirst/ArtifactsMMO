import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/ai_strategy.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/factories/action_factory.dart';
import 'package:artifacts_mmo/models/character_role.dart';
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
import 'package:collection/collection.dart';

class HaulerStrategy implements AIStrategy {
  @override
  void update(
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
    // We can run pre-calculation logic here if needed, like finding who needs help.
    final CharacterState? gathererToHelp = characterStates.firstWhereOrNull(
      (s) => s.role == CharacterRole.gatherer && s.needsHauling,
    );
    final hauler = state.character;

    // Priority 1: If we have items, our job is to bank them.
    if (hauler.inventoryCount > 0) {
      LoggerService.instance
          .log("AI: ${hauler.name} has items. Moving to bank.");
      // Step 1: Find the bank dynamically
      DestinationSchema? bankLocation = mapProvider.findNearestTile(
          hauler.location, (tile) => tile.content?.code == 'bank');

      if (bankLocation != null) {
        LoggerService.instance.log(
            "AI: ${hauler.name} has items. Moving to bank at (${bankLocation.x}, ${bankLocation.y}).");
        // Step 2: Move to the bank
        if (hauler.location.x != bankLocation.x ||
            hauler.location.y != bankLocation.y) {
          teamProvider.queueAction(
              hauler.name,
              actionFactory.createMoveAction(
                  hauler.name, bankLocation.x, bankLocation.y));
        }

        // Step 3: Deposit items (one at a time)
        // For simplicity, we'll just deposit the first item in the inventory.
        // The AI loop will trigger again next cycle to deposit the next one.
        final items = hauler.inventory
            ?.where((i) => i.quantity > 0)
            .map((i) => (SimpleItemSchemaBuilder()
                  ..code = i.code
                  ..quantity = i.quantity)
                .build());
        if (items != null && items.isNotEmpty) {
          teamProvider.queueAction(hauler.name,
              actionFactory.createBankWithdrawAction(hauler.name, BuiltList.of(items)));
        } else {
          LoggerService.instance
              .log("AI: ${hauler.name} has no items to bank.");
        }
      } else {
        LoggerService.instance.log(
            "AI: ${hauler.name} has items but cannot find a bank on the map!");
      }
      return;
    }

    // Priority 2: If we are idle and someone needs help, go to them.
    if (gathererToHelp != null) {
      LoggerService.instance.log(
          "AI: ${hauler.name} is responding to ${gathererToHelp.character.name}'s request.");

      if (hauler.location == gathererToHelp.character.location) {
        // Just waiting for them to give me items.
        return;
      }

      // The hauler's only job is to move to the gatherer.
      teamProvider.queueAction(
        hauler.name,
        actionFactory.createMoveAction(
          hauler.name,
          gathererToHelp.character.location.x,
          gathererToHelp.character.location.y,
        ),
      );
    }
    // If nobody needs help and our inventory is empty, check for requests.
    for (final request in teamBrainProvider.openRequests) {
      if (state.character.inventory?.any((item) => item.code == request.itemName) ?? false) {
        // teamBrainProvider.fulfillRequest(request, state.character.name);

        // deposit it in the bank.
      }
    }
  }
}
