// A simple class to represent a result when using a specific gear combination.
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'equipment_loadout_result.mapper.dart';

@MappableClass()
abstract class EquipmentLoadoutResult with EquipmentLoadoutResultMappable {
  final EquipmentLoadout loadout;

  EquipmentLoadoutResult({required this.loadout});

}

@MappableClass(discriminatorKey: 'combat')
class CombatEquipmentLoadoutResult extends EquipmentLoadoutResult with CombatEquipmentLoadoutResultMappable {
  final CombatDetails combatDetails;
  CombatEquipmentLoadoutResult({required super.loadout, required this.combatDetails});
}

@MappableClass(discriminatorKey: 'skill')
class SkillEquipmentLoadoutResult extends EquipmentLoadoutResult with SkillEquipmentLoadoutResultMappable {
  final String skill;
  SkillEquipmentLoadoutResult({required super.loadout, required this.skill});
}