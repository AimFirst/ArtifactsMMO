import 'package:artifacts_mmo/business/state/target/team/team_role_target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamRoleTargetWeaponAndWood extends TeamRoleTarget {
  TeamRoleTargetWeaponAndWood(
      {required super.teamManager,
      required super.character,
      required super.boardState});

  @override
  String get name => 'Team weapon and wood';

  @override
  SkillType get fightingSkill => SkillType.unknown;

  @override
  SkillType get craftingSkill => SkillType.weaponCrafting;

  @override
  SkillType get gatheringSkill => SkillType.woodcutting;

  @override
  List<SkillType> get skillTypes => [craftingSkill, gatheringSkill];
}
