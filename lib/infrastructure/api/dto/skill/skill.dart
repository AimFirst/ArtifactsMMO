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

  Skill.empty({required this.skillType}) : level = 0, xp = 0, nextLevelTargetXp = 1;

  @override
  List<Object?> get props => [skillType, level, xp, nextLevelTargetXp];

  int get xpUntilNextLevel => nextLevelTargetXp - xp;
}

enum SkillType {
  overall('https://artifactsmmo.com/images/items/gift.png'),
  mining('https://artifactsmmo.com/images/items/iron_pickaxe.png'),
  woodcutting('https://artifactsmmo.com/images/items/iron_axe.png'),
  fishing('https://artifactsmmo.com/images/items/spruce_fishing_rod.png'),
  weaponCrafting('https://artifactsmmo.com/images/items/iron_dagger.png'),
  gearCrafting('https://artifactsmmo.com/images/items/iron_armor.png'),
  jewelryCrafting('https://artifactsmmo.com/images/items/ring_of_chance.png'),
  cooking('https://artifactsmmo.com/images/items/cooked_wolf_meat.png'),
  alchemy('https://artifactsmmo.com/images/items/maple_syrup.png'),
  unknown('');

  const SkillType(this.image);
  final String image;
}
