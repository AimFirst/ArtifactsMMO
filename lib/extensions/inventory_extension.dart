import 'package:artifacts_api/artifacts_api.dart';
import 'package:built_collection/built_collection.dart';

extension InventoryExtension on BuiltList<InventorySlot> {
  int count(String itemCode) {
    return fold(0, (previousValue, element) => element.code == itemCode ? previousValue + element.quantity : previousValue );
  }
}