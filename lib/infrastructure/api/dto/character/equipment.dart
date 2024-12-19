import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:equatable/equatable.dart';

class EquipmentLoadout with EquatableMixin {
  final EquipmentSlotItem weapon;
  final EquipmentSlotItem shield;
  final EquipmentSlotItem helmet;
  final EquipmentSlotItem bodyArmor;
  final EquipmentSlotItem legArmor;
  final EquipmentSlotItem boots;
  final List<EquipmentSlotItem> rings;
  final EquipmentSlotItem amulet;
  final List<EquipmentSlotItem> artifacts;
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
      : weapon = EquipmentSlotItem.empty(),
        shield = EquipmentSlotItem.empty(),
        helmet = EquipmentSlotItem.empty(),
        bodyArmor = EquipmentSlotItem.empty(),
        legArmor = EquipmentSlotItem.empty(),
        boots = EquipmentSlotItem.empty(),
        rings = [],
        amulet = EquipmentSlotItem.empty(),
        artifacts = [],
        utilities = [];

  @override
  List<Object?> get props =>
      [
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

  Map<EquipmentSlot, QuantityEquipmentSlot> get equipmentSlots => {
    EquipmentSlot.weapon: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: weapon),
    EquipmentSlot.shield: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: shield),
    EquipmentSlot.helmet: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: helmet),
    EquipmentSlot.bodyArmor: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: bodyArmor),
    EquipmentSlot.legArmor: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: legArmor),
    EquipmentSlot.boots: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: boots),
    EquipmentSlot.amulet: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: amulet),
    EquipmentSlot.artifact1: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: artifacts.isNotEmpty ? artifacts[0] : EquipmentSlotItem.empty()),
    EquipmentSlot.artifact2: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: artifacts.length > 1 ? artifacts[1] : EquipmentSlotItem.empty()),
    EquipmentSlot.artifact3: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: artifacts.length > 2 ? artifacts[2] : EquipmentSlotItem.empty()),
    EquipmentSlot.ring1: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: rings.isNotEmpty ? rings[0] : EquipmentSlotItem.empty()),
    EquipmentSlot.ring2: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: artifacts.length > 1 ? rings[1] : EquipmentSlotItem.empty()),
    EquipmentSlot.utility1: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: utilities.isNotEmpty ? utilities[1] : EquipmentSlotItem.empty()),
    EquipmentSlot.utility2: QuantityEquipmentSlot.fromEquipmentSlotItem(slot: utilities.length > 1 ? utilities[1] : EquipmentSlotItem.empty()),
  };


  int count({String? code}) {
    return
      weapon.count(code: code) +
      shield.count(code: code) +
      helmet.count(code: code) +
      bodyArmor.count(code: code) +
      legArmor.count(code: code) +
      boots.count(code: code) +
      amulet.count(code: code) +
      artifacts.count(code: code) +
      rings.count(code: code) +
      utilities.count(code: code);
  }

}

extension EquipmentSlotListExtensions on List<EquipmentSlotItem> {
  int count({String? code}) {
    return fold(0, (o, e) => o + e.count(code: code));
  }
}

class EquipmentSlotItem with EquatableMixin {
  final EquipmentType equipmentType;
  final EquipmentSlot equipmentSlot;
  final String? itemCode;

  EquipmentSlotItem({
    required this.equipmentType,
    required this.equipmentSlot,
    required this.itemCode,
  });

  EquipmentSlotItem.empty()
      : equipmentType = EquipmentType.weapon,
        equipmentSlot = EquipmentSlot.weapon,
        itemCode = null;

  @override
  List<Object?> get props => [equipmentType, equipmentSlot, itemCode];

  int count({String? code}) {
    if (code != null) return itemCode == code ? 1 : 0;

    return (itemCode?.isNotEmpty ?? false) ? 1 : 0;
  }

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

class QuantityEquipmentSlot extends EquipmentSlotItem {
  final int quantity;

  QuantityEquipmentSlot({required super.equipmentType,
    required super.equipmentSlot,
    required super.itemCode,
    required this.quantity});

  QuantityEquipmentSlot.fromEquipmentSlotItem({required EquipmentSlotItem slot}) : this(equipmentType: slot.equipmentType, equipmentSlot: slot.equipmentSlot, itemCode: slot.itemCode, quantity: 1);

  @override
  List<Object?> get props => [...super.props, quantity];

  @override
  int count({String? code}) {
    if (code != null) return itemCode == code ? quantity : 0;

    return (itemCode?.isNotEmpty ?? false) ? quantity : 0;
  }
}
