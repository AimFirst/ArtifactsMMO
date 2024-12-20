import 'package:artifacts_mmo/business/state/target/team/team_role_target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamRoleTargetFighter extends TeamRoleTarget {
  TeamRoleTargetFighter(
      {required super.teamManager,
      required super.character,
      required super.boardState});

  @override
  String get name => 'Team fighter';

  @override
  SkillType get fightingSkill => SkillType.overall;

  @override
  SkillType get craftingSkill => SkillType.unknown;

  @override
  SkillType get gatheringSkill => SkillType.unknown;

  @override
  List<SkillType> get skillTypes => [fightingSkill];
}
