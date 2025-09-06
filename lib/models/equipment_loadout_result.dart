// A simple class to represent a result when using a specific gear combination.
import 'package:artifacts_mmo/models/combat_details.dart';
import 'package:artifacts_mmo/models/equipment_loadout.dart';

sealed class EquipmentLoadoutResult {
  final EquipmentLoadout loadout;

  EquipmentLoadoutResult(this.loadout);
}

final class CombatEquipmentLoadoutResult extends EquipmentLoadoutResult {
  final CombatDetails combatDetails;

  CombatEquipmentLoadoutResult(super.loadout, this.combatDetails);
}

final class SkillEquipmentLoadoutResult extends EquipmentLoadoutResult {
  final String skill;

  SkillEquipmentLoadoutResult(
      super.loadout, this.skill);
}