// Openapi Generator last run: : 2025-05-11T23:09:35.148004
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

// Regnerate with
// flutter pub run build_runner build --delete-conflicting-outputs
@Openapi(
  additionalProperties: DioProperties(pubName: 'artifacts_api'),
  inputSpec: RemoteSpec(path: 'https://api.artifactsmmo.com/openapi.json'),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'artifacts/openapi/',
)
class Example {}