import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for CharactersApi
void main() {
  final instance = ArtifactsApi().getCharactersApi();

  group(CharactersApi, () {
    // Create Character
    //
    // Create new character on your account. You can create up to 5 characters.
    //
    //Future<CharacterResponseSchema> createCharacterCharactersCreatePost(AddCharacterSchema addCharacterSchema) async
    test('test createCharacterCharactersCreatePost', () async {
      // TODO
    });

    // Delete Character
    //
    // Delete character on your account.
    //
    //Future<CharacterResponseSchema> deleteCharacterCharactersDeletePost(DeleteCharacterSchema deleteCharacterSchema) async
    test('test deleteCharacterCharactersDeletePost', () async {
      // TODO
    });

    // Get Character
    //
    // Retrieve the details of a character.
    //
    //Future<CharacterResponseSchema> getCharacterCharactersNameGet(String name) async
    test('test getCharacterCharactersNameGet', () async {
      // TODO
    });
  });
}
