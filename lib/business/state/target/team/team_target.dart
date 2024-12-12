import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_level_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/task/accept_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/complete_task_target.dart';
import 'package:artifacts_mmo/business/state/target/task/perform_task_target.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamTarget extends Target {
  final TeamManager teamManager;
  TeamRole lastRole = TeamRole.float;

  TeamTarget({required this.teamManager});

  @override
  String get name => 'TeamTarget: $lastRole';

  @override
  TargetProcessResult update({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    lastRole = teamManager.roleForCharacter[character.name] ?? TeamRole.float;
    switch (lastRole) {
      case TeamRole.fighter:
        return updateFighter(character: character, boardState: boardState, artifactsClient: artifactsClient);
      case TeamRole.weaponAndWood:
        return updateWeaponAndWood(character: character, boardState: boardState, artifactsClient: artifactsClient);
      case TeamRole.gearAndMine:
        return updateGearAndMine(character: character, boardState: boardState, artifactsClient: artifactsClient);
      case TeamRole.jewelAndAlchemy:
        return updateJewelAndAlchemy(character: character, boardState: boardState, artifactsClient: artifactsClient);
      case TeamRole.cookAndFish:
        return updateCookAndFish(character: character, boardState: boardState, artifactsClient: artifactsClient);
      case TeamRole.float:
        return updateFloat(character: character, boardState: boardState, artifactsClient: artifactsClient);
    }
  }

  TargetProcessResult updateFighter({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    if (character.taskProgress == null) {
      return AcceptTaskTarget().update(character: character, boardState: boardState, artifactsClient: artifactsClient);
    }

    final progressTask = PerformTaskTarget().update(character: character, boardState: boardState, artifactsClient: artifactsClient);
    if (!progressTask.progress.finished) {
      return progressTask;
    }

    return CompleteTaskTarget().update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

  TargetProcessResult updateWeaponAndWood({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    return CraftLevelTarget(skillType: SkillType.weaponCrafting, targetLevel: 40).update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

  TargetProcessResult updateGearAndMine({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    return CraftLevelTarget(skillType: SkillType.gearCrafting, targetLevel: 40).update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

  TargetProcessResult updateJewelAndAlchemy({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    return CraftLevelTarget(skillType: SkillType.jewelryCrafting, targetLevel: 40).update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

  TargetProcessResult updateCookAndFish({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    return CraftLevelTarget(skillType: SkillType.cooking, targetLevel: 40).update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

  TargetProcessResult updateFloat({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    final sortedSkills = character.craftingSkills..sort((a,b) => b.level - a.level);
    return CraftLevelTarget(skillType: sortedSkills.first.skillType, targetLevel: 40).update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

}