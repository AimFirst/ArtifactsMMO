import 'package:artifacts_mmo/business/state/board/all_page_loader.dart';
import 'package:artifacts_mmo/business/state/board/board_element_manager.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank_details.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:rxdart/rxdart.dart';

class BankManager extends BoardElementManager {
  final bankItemsSubject = BehaviorSubject<List<ItemQuantity>>.seeded([]);
  final bankDetailsSubject =
      BehaviorSubject<BankDetails>.seeded(BankDetails.empty());

  BankManager({required super.artifactsClient});

  @override
  Future<void> init() async {
    bankItemsSubject.value = await AllPageLoader.loadAllPaged(
      (int page) => artifactsClient.getBankItems(pageNumber: page),
    );

    bankDetailsSubject.value = await artifactsClient.getBankDetails();
  }

  void updateBankItems(List<ItemQuantity> items) {
    bankItemsSubject.value = items;
  }

  void updateBankGold(int gold) {
    var tempValue = bankDetailsSubject.value;
    tempValue = tempValue.copyWith(gold: gold);
    bankDetailsSubject.value = tempValue;
  }
}
