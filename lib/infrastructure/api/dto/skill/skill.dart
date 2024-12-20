import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:equatable/equatable.dart';

class Skill with EquatableMixin {
  final SkillType skillType;
  final int level;
  final int xp;
  final int nextLevelTargetXp;

  Skill({
    required this.skillType,
    required this.level,
    required this.xp,
    required this.nextLevelTargetXp,
  });

  Skill.empty({required this.skillType})
      : level = 0,
        xp = 0,
        nextLevelTargetXp = 1;

  @override
  List<Object?> get props => [skillType, level, xp, nextLevelTargetXp];

  int get xpUntilNextLevel => nextLevelTargetXp - xp;

  String get imageUrl => skillType.image;
}

enum SkillType {
  overall(
    'https://artifactsmmo.com/images/items/gift.png',
    EffectType.unknown,
    ItemSubType.unknown,
  ),
  mining('https://artifactsmmo.com/images/items/iron_pickaxe.png',
      EffectType.mining, ItemSubType.mining),
  woodcutting('https://artifactsmmo.com/images/items/iron_axe.png',
      EffectType.woodcutting, ItemSubType.woodcutting),
  fishing('https://artifactsmmo.com/images/items/spruce_fishing_rod.png',
      EffectType.fishing, ItemSubType.fishing),
  weaponCrafting('https://artifactsmmo.com/images/items/iron_dagger.png',
      EffectType.unknown, ItemSubType.unknown),
  gearCrafting('https://artifactsmmo.com/images/items/iron_armor.png',
      EffectType.unknown, ItemSubType.unknown),
  jewelryCrafting('https://artifactsmmo.com/images/items/ring_of_chance.png',
      EffectType.unknown, ItemSubType.unknown),
  cooking('https://artifactsmmo.com/images/items/cooked_wolf_meat.png',
      EffectType.unknown, ItemSubType.unknown),
  alchemy('https://artifactsmmo.com/images/items/maple_syrup.png',
      EffectType.alchemy, ItemSubType.alchemy),
  unknown('', EffectType.unknown, ItemSubType.unknown);

  const SkillType(this.image, this.effectType, this.itemSubtype);

  final String image;
  final EffectType effectType;
  final ItemSubType itemSubtype;
}
