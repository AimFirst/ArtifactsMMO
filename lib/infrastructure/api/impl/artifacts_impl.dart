import 'dart:async';
import 'package:artifacts_mmo/infrastructure/api/dto/map_location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';
import 'package:dio/dio.dart';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversions.dart';
import 'package:rxdart/rxdart.dart';

class ArtifactsImpl extends ArtifactsClient {
  final api = ArtifactsApi(basePathOverride: "https://api.artifactsmmo.com");
  final BehaviorSubject<Character> _characterSubject = BehaviorSubject();
  final conversions = const Conversions();
  String characterName = "";

  ArtifactsImpl() {
    const token = String.fromEnvironment('ARTIFACTS_TOKEN');
    if (token.isEmpty) {
      throw AssertionError('ARTIFACTS TOKEN is not set.'
          'Use --dart-define-from-file=api_keys.json to load it');
    }
    api.setBearerAuth("JWTBearer", token);
    _updateCharacter(Character.empty());
  }

  @override
  Stream<Character> get character => _characterSubject.stream;

  void _updateCharacter(Character character) {
    characterName = character.name;
    _characterSubject.add(character);
  }

  void _throwIfError(Response<dynamic> response) {
    if (response.statusCode != 200 || response.data == null) {
      throw ArtifactsException(
          errorMessage:
              'Failed to move: ${response.statusCode} - ${response.statusMessage}');
    }
  }

  @override
  Future<List<Resource>> getResources(
      {SkillType? skillType, int? maxSkillLevel}) async {
    final response = await api.getResourcesApi().getAllResourcesResourcesGet(
        maxLevel: maxSkillLevel, skill: skillType?.toGatheringSkill());

    _throwIfError(response);

    return response.data?.data
            .map((r) => conversions.resourceSchemaToResource(r))
            .toList() ??
        [];
  }

  @override
  Future<List<MapLocation>> getLocationsForContent(
      {required String contentCode}) async {
    final response =
        await api.getMapsApi().getAllMapsMapsGet(contentCode: contentCode);

    _throwIfError(response);

    return response.data?.data
            .map((r) => conversions.mapToMapLocation(r))
            .toList() ??
        [];
  }

  @override
  Future<MapLocation> getLocationInfo({required Location location}) async {
    final response =
        await api.getMapsApi().getMapMapsXYGet(x: location.x, y: location.y);

    _throwIfError(response);

    return response.data == null
        ? MapLocation.empty()
        : conversions.mapToMapLocation(response.data!.data);
  }

  @override
  Future<List<Character>> getCharacters() async {
    final response =
        await api.getMyCharactersApi().getMyCharactersMyCharactersGet();

    _throwIfError(response);

    final characters = response.data!.data
        .map((c) => conversions.characterSchemaToCharacter(c))
        .toList();
    if (characters.isNotEmpty) {
      _updateCharacter(characters.first);
    }
    return characters;
  }

  @override
  Future<Character> moveTo({required Location location}) async {
    final response =
        await api.getMyCharactersApi().actionMoveMyNameActionMovePost(
            name: characterName,
            destinationSchema: DestinationSchema(
              (b) => b
                ..x = location.x
                ..y = location.y,
            ));

    _throwIfError(response);

    final character =
        conversions.movementResponseToCharacter(response.data!.data);
    _updateCharacter(character);
    return character;
  }

  @override
  Future<Character> gather() async {
    final response = await api
        .getMyCharactersApi()
        .actionGatheringMyNameActionGatheringPost(name: characterName);

    _throwIfError(response);

    final character = conversions.skillResponseToCharacter(response.data!.data);
    _updateCharacter(character);
    return character;
  }
}
