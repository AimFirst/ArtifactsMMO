import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/inventory_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task_progress.dart';
import 'package:equatable/equatable.dart';

class Character with EquatableMixin {
  final String name;
  final String skin;
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
  final int inventoryMaxItems;
  final List<InventoryItem> inventoryItems;
  final EquipmentLoadout equipmentLoadout;
  final TaskProgress? taskProgress;

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
    required this.skin,
    required this.gold,
    required this.location,
    required this.cooldownEnd,
    required this.inventoryMaxItems,
    required this.inventoryItems,
    required this.equipmentLoadout,
    required this.taskProgress,
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
        skin = '',
        gold = 0,
        location = Location.empty(),
        cooldownEnd = DateTime.now(),
        inventoryMaxItems = 1,
        inventoryItems = [],
        equipmentLoadout = EquipmentLoadout.empty(),
        taskProgress = null;

  @override
  List<Object?> get props => [
        hp,
        maxHp,
        overall,
        mining,
        woodcutting,
        fishing,
        weaponCrafting,
        gearCrafting,
        jewelryCrafting,
        cooking,
        alchemy,
        name,
        gold,
        location,
        cooldownEnd,
        inventoryMaxItems,
        inventoryItems
      ];

  List<Skill> get allSkills => [
        mining,
        woodcutting,
        fishing,
        weaponCrafting,
        gearCrafting,
        jewelryCrafting,
        cooking,
        alchemy
      ];

  List<Skill> get gatheringSkills => [mining, woodcutting, fishing, alchemy];

  List<Skill> get craftingSkills =>
      [weaponCrafting, gearCrafting, jewelryCrafting, cooking];
}
