import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank_gold.dart';

class ActionDepositBankGoldResponse extends ActionBankGoldResponse {
  ActionDepositBankGoldResponse(
      {required super.cooldown, required super.character, required super.bank});
}

class ActionDepositBankGold extends ActionBankGold {
  ActionDepositBankGold({required super.bank, required super.characterName});
}
