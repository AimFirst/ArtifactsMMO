import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';

enum EquipmentSlot {
  weapon(ItemType.weapon),
  shield(ItemType.shield),
  helmet(ItemType.helmet),
  bodyArmor(ItemType.bodyArmor),
  legArmor(ItemType.legArmor),
  boots(ItemType.boots),
  ring1(ItemType.ring),
  ring2(ItemType.ring),
  amulet(ItemType.amulet),
  artifact1(ItemType.artifact),
  artifact2(ItemType.artifact),
  artifact3(ItemType.artifact),
  utility1(ItemType.utility),
  utility2(ItemType.utility);

  const EquipmentSlot(this.acceptedItemType);

  final ItemType acceptedItemType;
}
