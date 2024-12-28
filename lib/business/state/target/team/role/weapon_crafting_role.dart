import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/skill_based_role.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class WeaponCraftingRole extends SkillBasedRole {
  WeaponCraftingRole({required super.characterLog});

  @override
  SkillType get skillType => SkillType.weaponCrafting;

  @override
  RoleType get roleType => RoleType.weaponCrafting;
}
