import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';

abstract class BoardElementManager {
  final ArtifactsClient artifactsClient;

  BoardElementManager({required this.artifactsClient});

  Future<void> init();
}
