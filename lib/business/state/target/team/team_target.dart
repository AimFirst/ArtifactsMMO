import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target_cook_fish.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target_fighter.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target_float.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target_gear_mine.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target_jewel_alchemy.dart';
import 'package:artifacts_mmo/business/state/target/team/team_role_target_weapon_wood.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';

class TeamTarget extends Target {
  final TeamManager teamManager;
  TeamRole lastRole = TeamRole.float;
  TeamRoleTarget target;

  TeamTarget({required this.teamManager}) : target = TeamRoleTargetNone(teamManager: teamManager, character: Character.empty(), boardState: BoardState.empty());

  @override
  String get name => 'TeamTarget: $lastRole';

  @override
  TargetProcessResult update({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    final newRole = teamManager.roleForCharacter[character.name] ?? TeamRole.float;
    if (lastRole != newRole) {
      lastRole = newRole;
      switch (lastRole) {
        case TeamRole.fighter:
          target = TeamRoleTargetFighter(teamManager: teamManager, character: character, boardState: boardState);
        case TeamRole.weaponAndWood:
          target = TeamRoleTargetWeaponAndWood(teamManager: teamManager, character: character, boardState: boardState);
        case TeamRole.gearAndMine:
          target = TeamRoleTargetGearAndMine(teamManager: teamManager, character: character, boardState: boardState);
        case TeamRole.jewelAndAlchemy:
          target = TeamRoleTargetJewelAndAlchemy(teamManager: teamManager, character: character, boardState: boardState);
        case TeamRole.cookAndFish:
          target = TeamRoleTargetCookAndFish(teamManager: teamManager, character: character, boardState: boardState);
        case TeamRole.float:
          target = TeamRoleTargetNone(teamManager: teamManager, character: character, boardState: boardState);
      }
    }
    return target.update(character: character, boardState: boardState, artifactsClient: artifactsClient);
  }

}