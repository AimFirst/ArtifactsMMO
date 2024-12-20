import 'package:artifacts_mmo/business/state/target/team/team_role_target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamRoleTargetGearAndMine extends TeamRoleTarget {
  TeamRoleTargetGearAndMine(
      {required super.teamManager,
      required super.character,
      required super.boardState});

  @override
  String get name => 'Team gear and mine';

  @override
  SkillType get fightingSkill => SkillType.unknown;

  @override
  SkillType get craftingSkill => SkillType.gearCrafting;

  @override
  SkillType get gatheringSkill => SkillType.mining;

  @override
  List<SkillType> get skillTypes => [craftingSkill, gatheringSkill];
}
