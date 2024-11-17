import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';

abstract class ArtifactsClient {

  Future<Character> moveTo({required Location location});
  Future<List<Character>> getCharacters();
  Stream<Character> get character;
}