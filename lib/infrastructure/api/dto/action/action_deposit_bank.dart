import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionDepositBankResponse extends ActionBankItemResponse {
  ActionDepositBankResponse({required super.cooldown, required super.character, required super.item, required super.bank});
}

class ActionDepositBank extends ActionBankItem {
  ActionDepositBank({required super.itemQuantity, required super.characterName});
}
