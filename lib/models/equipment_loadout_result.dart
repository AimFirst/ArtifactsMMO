// A simple class to represent a result when using a specific gear combination.
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';
import 'package:artifacts_mmo/models/quantity_item_schema.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'equipment_loadout_result.mapper.dart';

@MappableClass()
sealed class EquipmentLoadoutResult with EquipmentLoadoutResultMappable {
  final EquipmentLoadout loadout;
  final List<QuantityItemSchema> itemsToUse;

  EquipmentLoadoutResult({required this.loadout, required this.itemsToUse});

}

@MappableClass(discriminatorKey: 'combat')
final class CombatEquipmentLoadoutResult extends EquipmentLoadoutResult with CombatEquipmentLoadoutResultMappable {
  final CombatDetails combatDetails;
  CombatEquipmentLoadoutResult({required super.loadout, required super.itemsToUse, required this.combatDetails});
}

@MappableClass(discriminatorKey: 'skill')
final class SkillEquipmentLoadoutResult extends EquipmentLoadoutResult with SkillEquipmentLoadoutResultMappable {
  SkillEquipmentLoadoutResult({required super.loadout, required super.itemsToUse});
}

@MappableClass(discriminatorKey: 'heal')
final class HealEquipmentLoadoutResult extends EquipmentLoadoutResult with HealEquipmentLoadoutResultMappable {
  HealEquipmentLoadoutResult({required super.loadout, required super.itemsToUse});
}