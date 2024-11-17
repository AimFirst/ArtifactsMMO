import 'dart:async';
import 'package:dio/dio.dart';

import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversions.dart';

class ArtifactsImpl extends ArtifactsClient {
  final api = ArtifactsApi(basePathOverride: "https://api.artifactsmmo.com");
  final StreamController<Character> characterController =
      StreamController.broadcast();
  late final Stream<Character> _characterStream;
  final conversions = const Conversions();
  String characterName = "";

  ArtifactsImpl() {
    const token = String.fromEnvironment('ARTIFACTS_TOKEN');
    if (token.isEmpty) {
      throw AssertionError('ARTIFACTS TOKEN is not set.'
          'Use --dart-define-from-file=api_keys.json to load it');
    }
    api.setBearerAuth("JWTBearer", token);
    _characterStream = characterController.stream.asBroadcastStream();
    _updateCharacter(Character.empty());
  }

  @override
  Stream<Character> get character => _characterStream;

  void _updateCharacter(Character character) {
    characterName = character.name;
    characterController.add(character);
  }

  void _throwIfError(Response<dynamic> response) {
    if (response.statusCode != 200 || response.data == null) {
      throw ArtifactsExceptions(
          errorMessage:
              'Failed to move: ${response.statusCode} - ${response.statusMessage}');
    }
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
}
