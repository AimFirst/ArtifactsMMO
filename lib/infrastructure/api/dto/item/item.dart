import 'package:artifacts_mmo/infrastructure/api/dto/craft/craft.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:equatable/equatable.dart';

class Item with EquatableMixin {
  final String name;
  final String code;
  final int level;
  final ItemType type;
  final ItemSubType subType;
  final String description;
  final List<Effect> effects;
  final Craft? craft;
  final bool tradeable;

  Item({
    required this.name,
    required this.code,
    required this.level,
    required this.type,
    required this.subType,
    required this.description,
    required this.effects,
    required this.craft,
    required this.tradeable,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        level,
        type,
        subType,
        description,
        effects,
        craft,
        tradeable,
      ];

  String get imageUrl => 'https://artifactsmmo.com/images/items/$code.png';

  bool get craftable => craft != null;
}

enum ItemType {
  utility,
  bodyArmor,
  weapon,
  resource,
  legArmor,
  helmet,
  boots,
  shield,
  amulet,
  ring,
  artifact,
  currency,
  consumable,
  unknown,
}

enum ItemSubType {
  tool,
  potion,
  task,
  mob,
  mining,
  woodcutting,
  alchemy,
  fishing,
  unknown,
  food,
  dagger,
  bar,
  staff,
  plank,
  bag,
  candy,
  coat,
  sword,
  bow,
  whip,
  axe,
  alloy,
  preciousStone,
  mask,
  club,
  wand,
  helm,
  sap,
  sceptre,
  cane,
}
