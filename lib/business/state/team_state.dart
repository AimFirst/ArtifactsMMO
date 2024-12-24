import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/business/state/target/team/team_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'team_state.g.dart';

@CopyWith()
class TeamState with EquatableMixin {
  final Map<String, List<RoleType>> playerSkillRolesMap;
  final PrioritizedList<UniqueItemQuantityRequest> neededItems;

  TeamState({
    required this.playerSkillRolesMap,
    required this.neededItems,
  });

  TeamState.empty() : playerSkillRolesMap = {}, neededItems = PrioritizedList();

  @override
  List<Object?> get props => [playerSkillRolesMap, neededItems,];
}
