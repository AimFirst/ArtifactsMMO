import 'package:artifacts_mmo/business/state/state_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';
import 'package:artifacts_mmo/presentation/target/target_based_upa_model.dart';

class TargetBasedUpaViewModel extends BaseViewModel<TargetBasedUpaModel> {
  final ArtifactsClient artifactsClient;
  final StateManager stateManager;

  TargetBasedUpaViewModel({required this.artifactsClient, required this.stateManager}) : super(TargetBasedUpaModelLoading());

  @override
  Future<void> loadAsync() async {
    await stateManager.init();

    stateManager.stateStream.listen((s) {
      value = TargetBasedUpaModelLoaded(state: s);
    });

    stateManager.startTargetBasedUpa();
  }

  @override
  TargetBasedUpaModelError errorModel(Error err) {
    return TargetBasedUpaModelError(error: err.toString());
  }
}
