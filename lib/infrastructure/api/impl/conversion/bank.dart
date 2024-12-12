import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank_details.dart';

extension BankDetailsConversion on BankResponseSchema {
  BankDetails convert() {
    return BankDetails(slots: data.slots, expansions: data.expansions, nextExpansionCost: data.nextExpansionCost, gold: data.gold,);
  }
}