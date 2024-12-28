import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/team_state.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'target_based_upa_model.g.dart';

// Unassisted Process Algorithm
sealed class TargetBasedUpaModel implements BaseModel {}

class TargetBasedUpaModelLoading
    with EquatableMixin
    implements TargetBasedUpaModel {
  @override
  List<Object?> get props => [];
}

class TargetBasedUpaModelError
    with EquatableMixin
    implements TargetBasedUpaModel {
  final String error;

  TargetBasedUpaModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

@CopyWith()
class TargetBasedUpaModelLoaded
    with EquatableMixin
    implements TargetBasedUpaModel {
  final State state;
  final List<MenuOption> menuOptions;
  final String selectedChar;
  final TeamState teamState;

  TargetBasedUpaModelLoaded({
    required this.state,
    required this.menuOptions,
    required this.selectedChar,
    required this.teamState,
  });

  @override
  List<Object?> get props => [
        state,
        menuOptions,
        selectedChar,
      ];
}

@CopyWith()
class MenuOption with EquatableMixin {
  final MenuItemType type;
  final String url;
  final String name;
  final bool selected;

  MenuOption({
    required this.type,
    required this.url,
    required this.name,
    this.selected = false,
  });

  @override
  List<Object?> get props => [type, url, name, selected];
}

enum MenuItemType {
  logs,
  inventory,
  skills,
  items,
  tasks,
  bank,
  team
}
