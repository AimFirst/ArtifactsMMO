// import 'package:artifacts_api/artifacts_api.dart';
// import 'package:artifacts_mmo/ai/ai_strategy.dart';
// import 'package:artifacts_mmo/ai/fighter_strategy.dart';
// import 'package:artifacts_mmo/extensions/character_extension.dart';
// import 'package:artifacts_mmo/factories/action_factory.dart';
// import 'package:artifacts_mmo/models/character_state.dart';
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
// class TaskingStrategy implements AIStrategy {
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
//     final character = state.character;
//
//     // --- State 1: No Active Task ---
//     // If the character has no task, their goal is to get one.
//     if (character.task.isEmpty) {
//       final taskMaster = mapProvider.findNearestTile(character.location,
//           (t) => t.content?.type == MapContentType.tasksMaster);
//       if (taskMaster == null) {
//         LoggerService.instance.log(
//             "AI: ${character.name} can't find a task master.",
//             level: LogLevel.warning);
//         return;
//       }
//
//       final taskMasterLocation =
//           LocationSchema(x: taskMaster.x, y: taskMaster.y);
//       if (character.location.x != taskMasterLocation.x ||
//           character.location.y != taskMasterLocation.y) {
//         LoggerService.instance.log(
//             "AI: ${character.name} moving to Task Master at $taskMasterLocation.");
//         teamProvider.queueAction(
//             character.name,
//             actionFactory.createMoveAction(
//                 character.name, taskMasterLocation.x, taskMasterLocation.y));
//       } else {
//         LoggerService.instance.log(
//             "AI: ${character.name} is at Task Master, accepting new task.");
//         final acceptAction =
//             actionFactory.createAcceptTaskAction(character.name);
//         teamProvider.queueAction(character.name, acceptAction);
//         // Remember where we got the task
//         state.taskGiverLocation = taskMasterLocation;
//       }
//       return;
//     }
//
//     // --- State 2: Task is Complete ---
//     // If progress is met, the goal is to turn it in.
//     if (character.taskProgress >= character.taskTotal) {
//       final turnInLocation = state.taskGiverLocation;
//       if (turnInLocation == null) {
//         LoggerService.instance.log(
//             "AI: ${character.name} has a completed task but forgot where to turn it in!",
//             level: LogLevel.error);
//         return;
//       }
//
//       if (character.location.x != turnInLocation.x ||
//           character.location.y != turnInLocation.y) {
//         LoggerService.instance.log(
//             "AI: ${character.name} moving to turn in task at $turnInLocation.");
//         teamProvider.queueAction(
//             character.name,
//             actionFactory.createMoveAction(
//                 character.name, turnInLocation.x, turnInLocation.y));
//       } else {
//         LoggerService.instance.log(
//             "AI: ${character.name} turning in completed task: ${character.task}.");
//         final completeAction =
//             actionFactory.createCompleteTaskAction(character.name);
//         teamProvider.queueAction(character.name, completeAction);
//       }
//       return;
//     }
//
//     // --- State 3: Task is In Progress ---
//     // Perform the action needed to make progress.
//     switch (character.taskType) {
//       case 'monsters':
//         final targetMonsterCode = character.task;
//         FighterStrategy().updateFighterAi(
//           state,
//           actionFactory,
//           mapProvider,
//           teamProvider,
//           (character, tile) => tile.content?.code == targetMonsterCode,
//         );
//         break;
//       case 'items':
//         final targetItemName = character.task;
//         // This is the most complex part, requiring team cooperation.
//         // For now, we'll assume the character must acquire it themselves.
//         // A future step is to create a team-wide "request" for the item.
//         if (character.inventory?.any((item) => item.code == targetItemName) ??
//             false) {
//           // We have the item, now we just need the full quantity.
//           // For now, we'll assume we have enough and head to turn-in.
//           // state.character.taskProgress = state.character.taskTotal;
//         } else {
//           LoggerService.instance.log(
//               "AI: ${character.name} needs to acquire '$targetItemName'. Delegating to Crafter AI.");
//           // We can temporarily assign a crafting sub-task
//           // This is a great place for more advanced team-wide AI later.
//         }
//         break;
//     }
//   }
// }
