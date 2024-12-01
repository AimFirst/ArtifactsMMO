import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_move.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:artifacts_mmo/presentation/base_view_model.dart';
import 'package:flutter/cupertino.dart';

import 'map_model.dart';

class MapViewModel extends BaseViewModel<MapModel> {
  final ArtifactsClient artifactsClient;
  final TextEditingController textEditingController = TextEditingController();
  Location location = Location(x: 0, y: 0);

  MapViewModel({required this.artifactsClient}) : super(MapModelLoading());

  @override
  MapModel errorModel(Error err) {
    return MapModelError(error: err.toString());
  }

  @override
  Future<void> loadAsync() async {
    artifactsClient.character.listen((c) async {
      location = c.location;
    });
    value = MapModelLoaded(locations: [], characterLocation: location);
  }

  Future<void> searchMap() async {
    final text = textEditingController.text;
    final locations = await artifactsClient.getLocationsForContent(contentCode: text);
    value = MapModelLoaded(locations: locations.data, characterLocation: location);
  }

  Future<void> moveTo(MapLocation mapLocation) async {
    await artifactsClient.moveTo(action: ActionMove(location: mapLocation.location),);
  }
}
