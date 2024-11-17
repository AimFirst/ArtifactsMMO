import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';
import 'package:equatable/equatable.dart';

class Character with EquatableMixin {
  final String name;
  final int gold;
  final int hp;
  final int maxHp;
  final Location location;
  final DateTime cooldownEnd;
  final Skill overall;
  final Skill mining;
  final Skill woodcutting;
  final Skill fishing;
  final Skill weaponCrafting;
  final Skill gearCrafting;
  final Skill jewelryCrafting;
  final Skill cooking;
  final Skill alchemy;

  Character({
    required this.hp,
    required this.maxHp,
    required this.overall,
    required this.mining,
    required this.woodcutting,
    required this.fishing,
    required this.weaponCrafting,
    required this.gearCrafting,
    required this.jewelryCrafting,
    required this.cooking,
    required this.alchemy,
    required this.name,
    required this.gold,
    required this.location,
    required this.cooldownEnd,
  });

  Character.empty()
      : hp = 0,
        maxHp = 0,
        overall = Skill.empty(skillType: SkillType.overall),
        mining = Skill.empty(skillType: SkillType.mining),
        woodcutting = Skill.empty(skillType: SkillType.woodcutting),
        fishing = Skill.empty(skillType: SkillType.fishing),
        weaponCrafting = Skill.empty(skillType: SkillType.weaponCrafting),
        gearCrafting = Skill.empty(skillType: SkillType.gearCrafting),
        jewelryCrafting = Skill.empty(skillType: SkillType.jewelryCrafting),
        cooking = Skill.empty(skillType: SkillType.cooking),
        alchemy = Skill.empty(skillType: SkillType.alchemy),
        name = '',
        gold = 0,
        location = Location.empty(),
        cooldownEnd = DateTime.now();

  @override
  List<Object?> get props => [name];
}
