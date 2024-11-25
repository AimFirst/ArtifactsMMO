import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';
import 'package:artifacts_mmo/presentation/inventory/inventory_model.dart';

class InventoryViewModel extends BaseViewModel<InventoryModel> {
  final ArtifactsClient artifactsClient;

  InventoryViewModel({required this.artifactsClient}) : super(InventoryModelLoading());

  @override
  Future<void> loadAsync() async {
    artifactsClient.character.listen((c) {
      value = InventoryModelLoaded(items: c.inventoryItems);
    });
  }

  @override
  InventoryModel errorModel(Error err) {
    return InventoryModelError(error: err.toString());
  }
}
