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
  overall,
  mining,
  woodcutting,
  fishing,
  weaponCrafting,
  gearCrafting,
  jewelryCrafting,
  cooking,
  alchemy,
}
