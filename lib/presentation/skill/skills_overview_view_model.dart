import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';

import 'skills_overview_model.dart';

class SkillsOverviewViewModel extends BaseViewModel<SkillsOverviewModel> {
  final ArtifactsClient artifactsClient;

  SkillsOverviewViewModel({required this.artifactsClient}) : super(SkillsOverviewModelLoading());

  @override
  Future<void> loadAsync() async {
      artifactsClient.character.listen((c) {
        value = SkillsOverviewModelLoaded(skills: c.allSkills);
      });
  }

  @override
  SkillsOverviewModel errorModel(Error err) {
    return SkillsOverviewModelError(error: err.toString());
  }
}
