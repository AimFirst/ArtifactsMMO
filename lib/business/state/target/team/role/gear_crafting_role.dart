import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/skill_based_role.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class GearCraftingRole extends SkillBasedRole {
  @override
  SkillType get skillType => SkillType.gearCrafting;

  @override
  RoleType get roleType => RoleType.gearCrafting;
}
