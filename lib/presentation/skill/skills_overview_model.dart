import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';

sealed class SkillsOverviewModel implements BaseModel {}

class SkillsOverviewModelLoading with EquatableMixin implements SkillsOverviewModel {
  @override
  List<Object?> get props => [];

}

class SkillsOverviewModelError with EquatableMixin implements SkillsOverviewModel {
  final String error;

  SkillsOverviewModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

class SkillsOverviewModelLoaded with EquatableMixin implements SkillsOverviewModel {
  final List<Skill> skills;

  SkillsOverviewModelLoaded({required this.skills});

  @override
  List<Object?> get props => [skills];
}
