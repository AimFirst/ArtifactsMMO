import 'package:equatable/equatable.dart';

class EquipmentLoadout with EquatableMixin {
  final EquipmentSlot weapon;
  final EquipmentSlot shield;
  final EquipmentSlot helmet;
  final EquipmentSlot bodyArmor;
  final EquipmentSlot legArmor;
  final EquipmentSlot boots;
  final List<EquipmentSlot> rings;
  final EquipmentSlot amulet;
  final List<EquipmentSlot> artifacts;
  final List<QuantityEquipmentSlot> utilities;

  EquipmentLoadout({
    required this.weapon,
    required this.shield,
    required this.helmet,
    required this.bodyArmor,
    required this.legArmor,
    required this.boots,
    required this.rings,
    required this.amulet,
    required this.artifacts,
    required this.utilities,
  });

  EquipmentLoadout.empty()
      : weapon = EquipmentSlot.empty(),
        shield = EquipmentSlot.empty(),
        helmet = EquipmentSlot.empty(),
        bodyArmor = EquipmentSlot.empty(),
        legArmor = EquipmentSlot.empty(),
        boots = EquipmentSlot.empty(),
        rings = [],
        amulet = EquipmentSlot.empty(),
        artifacts = [],
        utilities = [];

  @override
  List<Object?> get props => [
        weapon,
        shield,
        helmet,
        bodyArmor,
        legArmor,
        boots,
        rings,
        amulet,
        artifacts,
        utilities,
      ];
}

class EquipmentSlot with EquatableMixin {
  final EquipmentType equipmentType;
  final String? itemCode;

  EquipmentSlot({
    required this.equipmentType,
    required this.itemCode,
  });

  EquipmentSlot.empty()
      : equipmentType = EquipmentType.weapon,
        itemCode = null;

  @override
  List<Object?> get props => [equipmentType, itemCode];
}

enum EquipmentType {
  weapon,
  shield,
  helmet,
  bodyArmor,
  legArmor,
  boots,
  ring,
  amulet,
  artifact,
  utility,
}

class QuantityEquipmentSlot extends EquipmentSlot {
  final int quantity;

  QuantityEquipmentSlot(
      {required super.equipmentType,
      required super.itemCode,
      required this.quantity});

  @override
  List<Object?> get props => [...super.props, quantity];
}
