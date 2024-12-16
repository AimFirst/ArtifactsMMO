import 'package:artifacts_mmo/infrastructure/api/dto/character/equipment.dart';

extension EquipmentExtensions on EquipmentLoadout {
  int countOfItem({required String itemCode}) {
    var count = 0;
    count += weapon.itemCode == itemCode ? 1 : 0;
    count += amulet.itemCode == itemCode ? 1 : 0;
    count += boots.itemCode == itemCode ? 1 : 0;
    count += legArmor.itemCode == itemCode ? 1 : 0;
    count += bodyArmor.itemCode == itemCode ? 1 : 0;
    count += helmet.itemCode == itemCode ? 1 : 0;
    count += shield.itemCode == itemCode ? 1 : 0;
    count += artifacts.fold(0, (o, a) => o + (a.itemCode == itemCode ? 1 : 0));
    count += rings.fold(0, (o, r) => o + (r.itemCode == itemCode ? 1 : 0));
    count += utilities.fold(0, (o, u) => o + (u.itemCode == itemCode ? u.quantity : 0));
    return count;
  }
}