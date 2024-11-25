import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';

abstract class ArtifactsClient {
  // Maps
  Future<List<Resource>> getResources({SkillType? skillType, int? maxSkillLevel});
  Future<List<MapLocation>> getLocationsForContent({required String contentCode});
  Future<MapLocation> getLocationInfo({required Location location});

  // Characters
  Future<List<Character>> getCharacters();
  Stream<Character> get character;

  // Actions
  Future<Character> moveTo({required Location location});
  Future<Character> gather();
}