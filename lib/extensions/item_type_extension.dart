import 'package:artifacts_api/artifacts_api.dart';

extension ItemSlotExtension on ItemSlot {
  String get type {
    switch (this) {
      case ItemSlot.artifact1:
      case ItemSlot.artifact2:
      case ItemSlot.artifact3:
        return 'artifact';
      case ItemSlot.ring1:
      case ItemSlot.ring2:
        return 'ring';
      default:
        return this.name;
    }
  }
}