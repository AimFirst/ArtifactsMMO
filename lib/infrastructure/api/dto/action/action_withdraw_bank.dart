import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank_item.dart';

class ActionWithdrawBankResponse extends ActionBankItemResponse {
  ActionWithdrawBankResponse({required super.cooldown, required super.character, required super.item, required super.bank});
}

class ActionWithdrawBank extends ActionBankItem {
  ActionWithdrawBank({required super.itemQuantity, required super.characterName});
}
