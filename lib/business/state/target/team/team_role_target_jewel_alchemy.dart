import 'package:artifacts_mmo/business/state/target/team/team_role_target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamRoleTargetJewelAndAlchemy extends TeamRoleTarget {
  TeamRoleTargetJewelAndAlchemy({required super.teamManager, required super.character, required super.boardState});

  @override
  String get name => 'Team jewel and alchemy';

  @override
  SkillType get fightingSkill => SkillType.unknown;

  @override
  SkillType get craftingSkill => SkillType.jewelryCrafting;

  @override
  SkillType get gatheringSkill => SkillType.alchemy;

  @override
  List<SkillType> get skillTypes => [craftingSkill, gatheringSkill];
}