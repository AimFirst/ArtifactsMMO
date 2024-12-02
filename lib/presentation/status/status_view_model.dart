import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_delete_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_gathering.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_move.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';

import 'status_model.dart';

class StatusViewModel extends BaseViewModel<StatusModel> {
  final ArtifactsClient artifactsClient;

  StatusViewModel({required this.artifactsClient})
      : super(StatusModelLoading());

  Location currentLocation() {
    return (value as StatusModelLoaded).character.location;
  }

  Future<void> moveLeft() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x - 1, y: current.y);
      await artifactsClient.moveTo(action: ActionMove(location: newLocation));
    } catch (error) {
      value = StatusModelError(error: error.toString());
    }
  }

  Future<void> moveUp() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x, y: current.y - 1);
      await artifactsClient.moveTo(action: ActionMove(location: newLocation));
    } catch (error) {
      value = StatusModelError(error: error.toString());
    }
  }

  Future<void> moveRight() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x + 1, y: current.y);
      await artifactsClient.moveTo(action: ActionMove(location: newLocation));
    } catch (error) {
      value = StatusModelError(error: error.toString());
    }
  }

  Future<void> moveDown() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x, y: current.y + 1);
      await artifactsClient.moveTo(action: ActionMove(location: newLocation));
    } catch (error) {
      value = StatusModelError(error: error.toString());
    }
  }

  Future<void> gather() async {
    try {
      await artifactsClient.gather(action: ActionGathering());
    } catch (error) {
      value = StatusModelError(error: error.toString());
    }
  }

  Future<void> deleteTrees() async {
    try {
      await artifactsClient.deleteItem(action: ActionDeleteItem(itemQuantity: ItemQuantity(code: 'ash_wood', quantity: 20)));
    } catch (error) {
      value = StatusModelError(error: error.toString());
    }
  }

  @override
  StatusModelError errorModel(Error err) {
    return StatusModelError(error: err.toString());
  }

  @override
  Future<void> loadAsync() async {
    artifactsClient.character.listen((character) {
      value = StatusModelLoaded(character: character);
    });
    await artifactsClient.getCharacters();
  }
}
