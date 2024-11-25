import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';

abstract class ArtifactsClient {
  // Maps
  Future<List<Resource>> getResources({SkillType? skillType, int? maxSkillLevel});

  // Characters
  Future<List<Character>> getCharacters();
  Stream<Character> get character;

  // Actions
  Future<Character> moveTo({required Location location});
}