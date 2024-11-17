import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:flutter/cupertino.dart';

import 'status_model.dart';

class StatusViewModel with ChangeNotifier {
  final ArtifactsClient artifactsClient;

  StatusViewModel({required this.artifactsClient});

  StatusModel _model = StatusModelLoading();

  StatusModel get model => _model;

  Future<void> viewInit() async {
    artifactsClient.character.listen((character) {
      _model = StatusModelLoaded(character: character);
      notifyListeners();
    });
    try {
      await artifactsClient.getCharacters();
    } catch (error) {
      _model = StatusModelError(error: error.toString());
      notifyListeners();
    }
  }

  Location currentLocation() {
      return (_model as StatusModelLoaded).character.location;
  }

  Future<void> moveLeft() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x - 1, y: current.y);
      await artifactsClient.moveTo(location: newLocation);
    } catch (error) {
      _model = StatusModelError(error: error.toString());
      notifyListeners();
    }
  }

  Future<void> moveUp() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x, y: current.y - 1);
      await artifactsClient.moveTo(location: newLocation);
    } catch (error) {
      _model = StatusModelError(error: error.toString());
      notifyListeners();
    }
  }

  Future<void> moveRight() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x + 1, y: current.y);
      await artifactsClient.moveTo(location: newLocation);
    } catch (error) {
      _model = StatusModelError(error: error.toString());
      notifyListeners();
    }
  }

  Future<void> moveDown() async {
    try {
      final current = currentLocation();
      final newLocation = Location(x: current.x, y: current.y + 1);
      await artifactsClient.moveTo(location: newLocation);
    } catch (error) {
      _model = StatusModelError(error: error.toString());
      notifyListeners();
    }
  }
}
