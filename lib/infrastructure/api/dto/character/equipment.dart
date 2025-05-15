import 'package:artifacts_mmo/business/state/target/team/role/item_full_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'equipment.g.dart';

@CopyWith()
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

  Map<EquipmentSlot, QuantityEquipmentSlot> get equipmentSlots => {
        EquipmentSlot.weapon:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: weapon),
        EquipmentSlot.shield:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: shield),
        EquipmentSlot.helmet:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: helmet),
        EquipmentSlot.bodyArmor:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: bodyArmor),
        EquipmentSlot.legArmor:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: legArmor),
        EquipmentSlot.boots:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: boots),
        EquipmentSlot.amulet:
            QuantityEquipmentSlot.fromEquipmentSlotItem(slot: amulet),
        EquipmentSlot.artifact1: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: artifacts.isNotEmpty
                ? artifacts[0]
                : EquipmentSlotItem.empty()),
        EquipmentSlot.artifact2: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: artifacts.length > 1
                ? artifacts[1]
                : EquipmentSlotItem.empty()),
        EquipmentSlot.artifact3: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: artifacts.length > 2
                ? artifacts[2]
                : EquipmentSlotItem.empty()),
        EquipmentSlot.ring1: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: rings.isNotEmpty ? rings[0] : EquipmentSlotItem.empty()),
        EquipmentSlot.ring2: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: artifacts.length > 1 ? rings[1] : EquipmentSlotItem.empty()),
        EquipmentSlot.utility1: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: utilities.isNotEmpty
                ? utilities[1]
                : EquipmentSlotItem.empty()),
        EquipmentSlot.utility2: QuantityEquipmentSlot.fromEquipmentSlotItem(
            slot: utilities.length > 1
                ? utilities[1]
                : EquipmentSlotItem.empty()),
      };

  int count({String? code}) {
    return weapon.count(code: code) +
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

  EquipmentLoadout copyWithEquipment({required EquipmentSlot slot, required ItemFullQuantity item}) {
    switch (slot) {

      case EquipmentSlot.weapon:
        return copyWith(weapon: EquipmentSlotItem(equipmentType: EquipmentType.weapon, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.shield:
        return copyWith(shield: EquipmentSlotItem(equipmentType: EquipmentType.shield, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.helmet:
        return copyWith(helmet: EquipmentSlotItem(equipmentType: EquipmentType.helmet, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.bodyArmor:
        return copyWith(bodyArmor: EquipmentSlotItem(equipmentType: EquipmentType.bodyArmor, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.legArmor:
        return copyWith(legArmor: EquipmentSlotItem(equipmentType: EquipmentType.legArmor, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.boots:
        return copyWith(boots: EquipmentSlotItem(equipmentType: EquipmentType.boots, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.ring1:
        final ring = EquipmentSlotItem(equipmentType: EquipmentType.ring, equipmentSlot: slot, itemCode: item.item.code);
        final newRings = [...rings];
        if (newRings.isNotEmpty) {
          newRings[0] = ring;
        } else {
          newRings.add(ring);
        }
        return copyWith(rings: newRings);
      case EquipmentSlot.ring2:
        final ring = EquipmentSlotItem(equipmentType: EquipmentType.ring, equipmentSlot: slot, itemCode: item.item.code);
        final newRings = [...rings];
        if (newRings.length > 1) {
          newRings[1] = ring;
        } else {
          newRings.add(ring);
        }
        return copyWith(rings: newRings);
      case EquipmentSlot.amulet:
        return copyWith(amulet: EquipmentSlotItem(equipmentType: EquipmentType.amulet, equipmentSlot: slot, itemCode: item.item.code));
      case EquipmentSlot.artifact1:
        final artifact = EquipmentSlotItem(equipmentType: EquipmentType.artifact, equipmentSlot: slot, itemCode: item.item.code);
        final newArtifacts = [...artifacts];
        if (newArtifacts.isNotEmpty) {
          newArtifacts[0] = artifact;
        } else {
          newArtifacts.add(artifact);
        }
        return copyWith(artifacts: newArtifacts);
      case EquipmentSlot.artifact2:
        final artifact = EquipmentSlotItem(equipmentType: EquipmentType.artifact, equipmentSlot: slot, itemCode: item.item.code);
        final newArtifacts = [...artifacts];
        if (newArtifacts.length > 1) {
          newArtifacts[1] = artifact;
        } else {
          newArtifacts.add(artifact);
        }
        return copyWith(artifacts: newArtifacts);
      case EquipmentSlot.artifact3:
        final artifact = EquipmentSlotItem(equipmentType: EquipmentType.artifact, equipmentSlot: slot, itemCode: item.item.code);
        final newArtifacts = [...artifacts];
        if (newArtifacts.length > 2) {
          newArtifacts[2] = artifact;
        } else {
          newArtifacts.add(artifact);
        }
        return copyWith(artifacts: newArtifacts);
      case EquipmentSlot.utility1:
        final utility = QuantityEquipmentSlot(equipmentType: EquipmentType.utility, equipmentSlot: slot, itemCode: item.item.code, quantity: item.quantity);
        final newUtilities = [...utilities];
        if (newUtilities.isNotEmpty) {
          newUtilities[0] = utility;
        } else {
          newUtilities.add(utility);
        }
        return copyWith(utilities: newUtilities);
      case EquipmentSlot.utility2:
        final utility = QuantityEquipmentSlot(equipmentType: EquipmentType.utility, equipmentSlot: slot, itemCode: item.item.code, quantity: item.quantity);
        final newUtilities = [...utilities];
        if (newUtilities.length > 1) {
          newUtilities[1] = utility;
        } else {
          newUtilities.add(utility);
        }
        return copyWith(utilities: newUtilities);
    }
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
  weapon(ItemType.weapon),
  shield(ItemType.shield),
  helmet(ItemType.helmet),
  bodyArmor(ItemType.bodyArmor),
  legArmor(ItemType.legArmor),
  boots(ItemType.boots),
  ring(ItemType.ring),
  amulet(ItemType.amulet),
  artifact(ItemType.artifact),
  utility(ItemType.utility);

  const EquipmentType(this.itemType);

  final ItemType itemType;
}

class QuantityEquipmentSlot extends EquipmentSlotItem {
  final int quantity;

  QuantityEquipmentSlot(
      {required super.equipmentType,
      required super.equipmentSlot,
      required super.itemCode,
      required this.quantity});

  QuantityEquipmentSlot.fromEquipmentSlotItem({required EquipmentSlotItem slot})
      : this(
            equipmentType: slot.equipmentType,
            equipmentSlot: slot.equipmentSlot,
            itemCode: slot.itemCode,
            quantity: 1);

  @override
  List<Object?> get props => [...super.props, quantity];

  @override
  int count({String? code}) {
    if (code != null) return itemCode == code ? quantity : 0;

    return (itemCode?.isNotEmpty ?? false) ? quantity : 0;
  }
}
