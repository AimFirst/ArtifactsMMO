// import 'package:artifacts_api/artifacts_api.dart';
// import 'package:artifacts_mmo/ai/ai_strategy.dart';
// import 'package:artifacts_mmo/extensions/character_extension.dart';
// import 'package:artifacts_mmo/factories/action_factory.dart';
// import 'package:artifacts_mmo/models/character_state.dart';
// import 'package:artifacts_mmo/models/character_task.dart';
// import 'package:artifacts_mmo/models/location_schema.dart';
// import 'package:artifacts_mmo/providers/bank_provider.dart';
// import 'package:artifacts_mmo/providers/log_provider.dart';
// import 'package:artifacts_mmo/providers/map_provider.dart';
// import 'package:artifacts_mmo/providers/team_brain_provider.dart';
// import 'package:artifacts_mmo/providers/team_provider.dart';
// import 'package:artifacts_mmo/providers/world_data_provider.dart';
// import 'package:artifacts_mmo/services/combat_service.dart';
// import 'package:artifacts_mmo/services/logger_service.dart';
// import 'package:artifacts_mmo/services/team_ai_service.dart';
//
// class FighterStrategy implements AIStrategy {
//   @override
//   void update(
//     CharacterState state,
//     TeamAIService aiService,
//     CombatService combatService,
//     WorldDataProvider worldDataProvider,
//     ActionFactory actionFactory,
//     MapProvider mapProvider,
//     TeamProvider teamProvider,
//     BankProvider bankProvider,
//     TeamBrainProvider teamBrainProvider,
//     List<CharacterState> characterStates,
//   ) {
//     // If we are assigned the hunt task, let's find a monster.
//     if (state.currentTask == CharacterTask.huntMonsters) {
//       updateFighterAi(state, actionFactory, mapProvider, teamProvider,
//           (fighter, tile) {
//         final monsterData =
//             worldDataProvider.getMonsterByCode(tile.content!.code);
//         return monsterData != null &&
//             combatService.canWinFight(fighter, monsterData);
//       });
//     }
//   }
//
//   void updateFighterAi(
//     CharacterState fighterState,
//     ActionFactory actionFactory,
//     MapProvider mapProvider,
//     TeamProvider teamProvider,
//     bool Function(CharacterSchema, MapSchema) test,
//   ) {
//     final fighter = fighterState.character;
//
//     // Priority 1: SURVIVAL. Heal if health is low.
//     if (fighter.hp < fighter.maxHp) {
//       LoggerService.instance
//           .log("AI: ${fighter.name}'s health is low. Resting.");
//       final restAction = actionFactory.createRestAction(fighter.name);
//       teamProvider.queueAction(fighter.name, restAction);
//       return; // Do nothing else until health is restored.
//     }
//
//     // Step 1: Find ALL monster tiles.
//     final allMonsterTiles = mapProvider.worldMap?.tiles
//             .where((tile) => tile.content?.type == MapContentType.monster) ??
//         <MapSchema>[];
//
//     // Step 2: Find all targets that match our criteria
//     final winnableTargets =
//         allMonsterTiles.where((tile) => test(fighter, tile)).toList();
//
//     // Step 3: Find the closest winnable target
//     if (winnableTargets.isEmpty) {
//       LoggerService.instance.log(
//           "AI: ${fighter.name} cannot find any monsters.",
//           level: LogLevel.warning);
//       return;
//     }
//
//     final monsterTile = mapProvider.findNearestTile(
//       fighter.location,
//       (tile) => winnableTargets.contains(tile),
//     );
//
//     if (monsterTile == null) {
//       LoggerService.instance.log(
//           "AI: ${fighter.name} cannot find any monsters.",
//           level: LogLevel.warning);
//       return; // No targets found, do nothing.
//     }
//
//     final monsterLocation = LocationSchema(x: monsterTile.x, y: monsterTile.y);
//     final currentLocation =
//         LocationSchema(x: fighter.location.x, y: fighter.location.y);
//
//     // Priority 3: Engage the target.
//     if (currentLocation != monsterLocation) {
//       // We are not on the monster's tile yet, so move there.
//       LoggerService.instance.log(
//           "AI: ${fighter.name} moving to engage monster at $monsterLocation.");
//       final moveAction = actionFactory.createMoveAction(
//           fighter.name, monsterLocation.x, monsterLocation.y);
//       teamProvider.queueAction(fighter.name, moveAction);
//     } else {
//       // We are on the same tile. Fight!
//       LoggerService.instance.log(
//           "AI: ${fighter.name} is on the monster's tile. Engaging in combat!");
//       final fightAction = actionFactory.createFightAction(fighter.name);
//       teamProvider.queueAction(fighter.name, fightAction);
//     }
//   }
// }
