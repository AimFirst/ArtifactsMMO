import 'dart:async';

import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:rxdart/rxdart.dart';

class TeamManager {
  static const Map<TeamRole, List<SkillType>> skillsForRole = {
    TeamRole.fighter: [SkillType.overall],
    TeamRole.gearAndMine: [SkillType.gearCrafting, SkillType.mining],
    TeamRole.weaponAndWood: [SkillType.weaponCrafting, SkillType.woodcutting],
    TeamRole.jewelAndAlchemy: [SkillType.jewelryCrafting, SkillType.alchemy],
    TeamRole.cookAndFish: [SkillType.cooking, SkillType.fishing],
  };
  final Map<String, CharacterState> characters = {};
  final Map<String, TeamRole> roleForCharacter = {};
  final Map<TeamRole, String> characterForRole = {};
  final Map<String, StreamSubscription<CharacterState>> subscriptions = {};

  void addCharacter(ValueStream<CharacterState> characterStream) {
    characters[characterStream.value.character.name] = characterStream.value;
    subscriptions[characterStream.value.character.name] = characterStream.listen((c) => characters[c.character.name] = c);
    _recalculateTeamCharacters();
  }

  void removeCharacter(ValueStream<CharacterState> characterStream) {
    characters.remove(characterStream.value.character.name);
    subscriptions.remove(characterStream.value.character.name)?.cancel();
    _recalculateTeamCharacters();
  }

  void _recalculateTeamCharacters() {
    final allCharacters = characters.values.toList();
    roleForCharacter.clear();
    characterForRole.clear();

    skillsForRole.forEach((k, v) {
      if (allCharacters.isNotEmpty) {
        allCharacters.sort((a, b) {
          for (final skill in v) {
            final aLevel = [...a.character.allSkills, a.character.overall].where((s) => s.skillType == skill).first.level;
            final bLevel = [...b.character.allSkills, b. character.overall].where((s) => s.skillType == skill).first.level;
            if (aLevel != bLevel) {
              return bLevel - aLevel;
            }
          }
            return 0;
        });
        final character = allCharacters.removeAt(0);
        roleForCharacter[character.character.name] = k;
        characterForRole[k] = character.character.name;
      }
    });

    while (allCharacters.isNotEmpty) {
      roleForCharacter[allCharacters.removeAt(0).character.name] = TeamRole.float;
    }

  }
}

enum TeamRole {
  fighter,
  weaponAndWood,
  gearAndMine,
  jewelAndAlchemy,
  cookAndFish,
  float,
}
