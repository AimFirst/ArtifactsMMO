import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/ai/goals/ai_goal.dart';
import 'package:artifacts_mmo/extensions/character_extension.dart';
import 'package:artifacts_mmo/extensions/inventory_extension.dart';
import 'package:artifacts_mmo/extensions/simple_item_schema_extension.dart';
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
import 'package:built_collection/built_collection.dart';

class DefaultCraftGoal extends AIGoal {
  @override
  String get name => 'Default Craft';

  @override
  int get priority => 15;

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
    List<CharacterState> characterStates,
  ) async {
    // Find any crafting skills that we are the "expert" on and see if we can craft anything.
    return _expertWithCraftability(
            state, worldDataProvider, bankProvider, characterStates) !=
        null;
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
    List<CharacterState> characterStates,
  ) async {
    final recipe = _expertWithCraftability(
        state, worldDataProvider, bankProvider, characterStates);

    if (recipe == null) {
      LoggerService.instance
          .log('No craft recipe found.', character: state.character);
      return;
    }

    // Need to fetch anything from the bank?
    List<SimpleItemSchema> itemsToPullFromBank = [];
    for (final ingredient in recipe.value.items ?? <SimpleItemSchema>[]) {
      int countNeeded = ingredient.quantity;
      countNeeded -= (state.character.inventory?.count(ingredient.code) ?? 0);
      if (countNeeded > 0) {
        if (bankProvider.count(ingredient.code) < countNeeded) {
          LoggerService.instance.log('Not enough ${ingredient.code} in bank.',
              character: state.character);
          return;
        }

        itemsToPullFromBank.add(SimpleItemSchemaBuilder()
            .fromCodeAndQuantity(ingredient.code, countNeeded));
      }
    }

    // Fetch all bank items
    if (itemsToPullFromBank.isNotEmpty) {
      teamProvider.queueBankWithdraw(
          state.character, BuiltList.of(itemsToPullFromBank));
    }

    // Find and move to our craft workbench location.
    final craftLocation = mapProvider.findNearestTile(
        state.character.location,
        (tile) =>
            tile.content?.type == MapContentType.workshop &&
            tile.content?.code == recipe.value.skill?.name);
    if (craftLocation == null) {
      LoggerService.instance.log(
          'Can\'t find craft workbench for ${recipe.value.skill}',
          character: state.character,
          level: LogLevel.warning);
      return;
    }
    teamProvider.queueMoveTo(state.character, craftLocation);

    // Craft the item!
    teamProvider.queueAction(
        state.character.name,
        actionFactory.createCraftAction(state.character.name,
            SimpleItemSchemaBuilder().fromCodeAndQuantity(recipe.key, 1)));
  }

  MapEntry<String, CraftSchema>? _expertWithCraftability(
      CharacterState state,
      WorldDataProvider worldDataProvider,
      BankProvider bankProvider,
      List<CharacterState> characters) {
    for (final skill in CraftSkill.values) {
      final myLevel = state.character.craftSkills[skill]?.level ?? 1;

      bool best = true;
      for (final char in characters) {
        // Someone else is better, leave it up to them
        if ((char.character.craftSkills[skill]?.level ?? 1) > myLevel) {
          best = false;
          break;
        }
      }

      // Someone else is better than us, let's keep looking for other skills.
      if (!best) {
        continue;
      }

      // Can we craft anything in this profession?
      final recipesForSkill = (worldDataProvider.recipesPerSkill[skill] ??
              <MapEntry<String, CraftSchema>>[])
          .where((recipe) =>
              recipe.value.level != null && recipe.value.level! <= myLevel)
          .toList();
      recipesForSkill.sort((a, b) =>
          b.value.level == null || a.value.level == null
              ? 0
              : b.value.level!.compareTo(a.value.level!));

      // Check each recipe to see if there's one we can craft.
      for (final recipe in recipesForSkill) {
        bool hasIngredients = true;
        for (final ingredient in recipe.value.items ?? <SimpleItemSchema>[]) {
          int countNeeded = ingredient.quantity;
          countNeeded -=
              (state.character.inventory?.count(ingredient.code) ?? 0);

          // Need more, does the bank have any?
          if (countNeeded > 0) {
            countNeeded -= bankProvider.count(ingredient.code);
          }

          // Not enough items :(
          if (countNeeded > 0) {
            hasIngredients = false;
            break;
          }
        }

        // Have all the ingredients, we can craft this one.
        if (hasIngredients) {
          return recipe;
        }
      }
    }
    return null;
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
    List<CharacterState> characterStates,
  ) async {
    return null;
  }
}
