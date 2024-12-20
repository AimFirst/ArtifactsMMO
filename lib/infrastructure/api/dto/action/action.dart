import 'package:artifacts_mmo/infrastructure/api/dto/action/cooldown.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

class ActionResponse with EquatableMixin {
  final Cooldown cooldown;
  final Character character;

  ActionResponse({
    required this.cooldown,
    required this.character,
  });

  @override
  List<Object?> get props => [
        cooldown,
        character,
      ];
}

class Action with EquatableMixin {
  final String characterName;

  Action({required this.characterName});

  @override
  List<Object?> get props => [characterName];
}

class UseSkillResponse with EquatableMixin {
  final int xp;
  final List<ItemQuantity> items;

  UseSkillResponse({
    required this.xp,
    required this.items,
  });

  @override
  List<Object?> get props => [
        xp,
        items,
      ];
}

enum ActionType {
  movement,
  fight,
  crafting,
  gathering,
  buyGE,
  sellGE,
  cancelGE,
  deleteItem,
  deposit,
  withdraw,
  depositGold,
  withdrawGold,
  equip,
  unEquip,
  task,
  recycling,
  rest,
  use,
  buyBankExpansion,
}
