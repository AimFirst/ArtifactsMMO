import 'dart:async';
import 'dart:math';

import 'package:artifacts_mmo/business/state/character_state.dart';
import 'package:artifacts_mmo/business/state/target/team/role/role.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'team_manager.g.dart';

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
  final Map<String, List<RoleType>> skillTypesForCharacter = {};
  final Map<TeamRole, String> characterForRole = {};
  final Map<String, StreamSubscription<CharacterState>> subscriptions = {};

  final PrioritizedList<UniqueItemQuantityRequest> neededItems =
      PrioritizedList();

  void addCharacter(ValueStream<CharacterState> characterStream) {
    characters[characterStream.value.character.name] = characterStream.value;
    subscriptions[characterStream.value.character.name] =
        characterStream.listen((c) => characters[c.character.name] = c);
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
            final aLevel = [...a.character.allSkills, a.character.overall]
                .where((s) => s.skillType == skill)
                .first
                .level;
            final bLevel = [...b.character.allSkills, b.character.overall]
                .where((s) => s.skillType == skill)
                .first
                .level;
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
      roleForCharacter[allCharacters.removeAt(0).character.name] =
          TeamRole.float;
    }
  }

  void addRequestedItem(
      PrioritizedElement<UniqueItemQuantityRequest> itemQuantity) {
    if (!neededItems.list.contains(itemQuantity)) {
      neededItems.list
          .removeWhere((i) => i.element.key == itemQuantity.element.key);
      neededItems.addElement(itemQuantity);
    }
  }

  void removeRequestedItem(
      PrioritizedElement<UniqueItemQuantityRequest> itemQuantity) {
    neededItems.removeElement(itemQuantity);
  }

  void removeItemsForCharacter(String characterName) {
    neededItems.list
        .removeWhere((i) => i.element.requestingCharacter == characterName);
  }
}

@CopyWith()
class UniqueItemQuantityRequest with EquatableMixin {
  final String key;
  final Item item;
  final int quantity;
  final String requestingCharacter;

  UniqueItemQuantityRequest({
    required this.key,
    required this.item,
    required this.quantity,
    required this.requestingCharacter,
  });

  @override
  List<Object?> get props => [
        key,
        item,
        quantity,
        requestingCharacter,
      ];

  ItemQuantity toItemQuantity() {
    return ItemQuantity(code: item.code, quantity: quantity,);
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

class PrioritizedList<T> {
  List<PrioritizedElement<T>> list = [];

  void addElement(PrioritizedElement<T> element) {
    if (list.isEmpty) {
      list.add(element);
      return;
    }

    // Try to insert it into the right place.
    for (var i = 0; i < list.length; i++) {
      if (list[i].itemPriority.code < element.itemPriority.code) {
        list.insert(max(0, i - 1), element);
        return;
      }
    }

    // It goes at the end of the list.
    list.add(element);
  }

  void removeElement(PrioritizedElement<T> element) {
    list.remove(element);
  }
}

class PrioritizedElement<T> with EquatableMixin {
  final ItemPriority itemPriority;
  final T element;

  PrioritizedElement({required this.itemPriority, required this.element});

  @override
  List<Object?> get props => [
        itemPriority,
        element,
      ];
}

enum ItemPriority {
  highest(100),
  high(50),
  medium(0),
  low(-50),
  lowest(-100);

  final int code;

  const ItemPriority(this.code);
}
