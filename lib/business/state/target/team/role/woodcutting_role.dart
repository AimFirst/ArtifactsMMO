import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/skill_based_role.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class WoodcuttingRole extends SkillBasedRole {
  WoodcuttingRole({required super.characterLog});

  @override
  SkillType get skillType => SkillType.woodcutting;

  @override
  RoleType get roleType => RoleType.woodcutting;
}
