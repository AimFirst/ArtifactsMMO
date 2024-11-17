import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';

class Conversions {
  const Conversions();

  Character characterSchemaToCharacter(CharacterSchema schema) {
    return Character(
        name: schema.name,
        level: schema.level,
        location: Location(x: schema.x, y: schema.y),
        cooldownEnd: DateTime.now().add(Duration(seconds: schema.cooldown)),
    );
  }

  Character movementResponseToCharacter(CharacterMovementDataSchema schema) {
    return characterSchemaToCharacter(schema.character);
  }
}