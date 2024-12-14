import 'package:artifacts_mmo/business/state/target/team/team_role_target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class TeamRoleTargetCookAndFish extends TeamRoleTarget {
  TeamRoleTargetCookAndFish(
      {required super.teamManager,
      required super.character,
      required super.boardState});

  @override
  String get name => 'Team cook and fish';

  @override
  SkillType get fightingSkill => SkillType.unknown;

  @override
  SkillType get craftingSkill => SkillType.cooking;

  @override
  SkillType get gatheringSkill => SkillType.fishing;

  @override
  List<SkillType> get skillTypes => [craftingSkill, gatheringSkill];
}
