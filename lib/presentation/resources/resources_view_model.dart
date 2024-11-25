import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';

import 'resources_model.dart';

class ResourcesViewModel extends BaseViewModel<ResourcesModel> {
  final ArtifactsClient artifactsClient;

  ResourcesViewModel({required this.artifactsClient}) : super(ResourcesModelLoading());

  @override
  ResourcesModel errorModel(Error err) {
    return ResourcesModelError(error: err.toString());
  }

  @override
  Future<void> loadAsync() async {
    final result = await artifactsClient.getResources();
    value = ResourcesModelLoaded(resources: result);
  }
}
