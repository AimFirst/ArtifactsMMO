import 'dart:developer';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';

class ArtifactsImpl extends ArtifactsAPI2 {
  final api = ArtifactsApi(basePathOverride: "https://api.artifactsmmo.com");
  static const CHARACTER_NAME = "Aimlater";

  ArtifactsImpl() {
    const token = String.fromEnvironment('ARTIFACTS_TOKEN');
    if (token.isEmpty) {
      throw AssertionError('ARTIFACTS TOKEN is not set.'
          'Use --dart-define-from-file=api_keys.json to load it');
    }
    api.setBearerAuth("JWTBearer", token);
  }

  @override
  Future<void> moveTo({required int x, required int y}) {
    return api.getMyCharactersApi().actionMoveMyNameActionMovePost(
        name: CHARACTER_NAME,
        destinationSchema: DestinationSchema((b) => b
          ..x = x
          ..y = y));
  }
}
