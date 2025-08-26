// Openapi Generator last run: : 2025-08-24T23:27:31.688617
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

// Regenerate with
// flutter pub run build_runner build --delete-conflicting-outputs
@Openapi(
  additionalProperties: DioProperties(pubName: 'artifacts_api'),
  inputSpec: RemoteSpec(path: 'https://api.artifactsmmo.com/openapi.json'),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'artifacts/openapi/',
  apiPackage: 'artifacts_api',
  skipIfSpecIsUnchanged: false,
)
class OpenapiSpec {}
