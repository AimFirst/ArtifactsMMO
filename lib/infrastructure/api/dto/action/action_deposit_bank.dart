import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank_item.dart';

class ActionDepositBankResponse extends ActionBankItemResponse {
  ActionDepositBankResponse({required super.cooldown, required super.character, required super.item, required super.bank});
}

class ActionDepositBank extends ActionBankItem {
  ActionDepositBank({required super.itemQuantity, required super.characterName});
}
