import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/skill_based_role.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class JewelryCraftingRole extends SkillBasedRole {
  @override
  SkillType get skillType => SkillType.jewelryCrafting;

  @override
  RoleType get roleType => RoleType.jewelryCrafting;
}
