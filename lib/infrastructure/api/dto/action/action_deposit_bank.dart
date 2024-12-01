import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionDepositBankResponse extends ActionResponse {
  final Item item;
  final List<ItemQuantity> bank;

  ActionDepositBankResponse({
    required super.cooldown,
    required super.character,
    required this.item,
    required this.bank,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        item,
        bank,
      ];
}

class ActionDepositBank extends Action {
  final ItemQuantity itemQuantity;

  ActionDepositBank({
    required this.itemQuantity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
