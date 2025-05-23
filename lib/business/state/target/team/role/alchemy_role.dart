import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/role/skill_based_role.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class AlchemyRole extends SkillBasedRole {
  AlchemyRole({required super.characterLog});

  @override
  RoleType get roleType => RoleType.alchemy;

  @override
  SkillType get skillType => SkillType.alchemy;
}
