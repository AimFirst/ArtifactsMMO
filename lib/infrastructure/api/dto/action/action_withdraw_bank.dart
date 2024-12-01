import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionWithdrawBankResponse extends ActionResponse {
  final Item item;
  final List<ItemQuantity> bank;

  ActionWithdrawBankResponse({
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

class ActionWithdrawBank extends Action {
  final ItemQuantity itemQuantity;

  ActionWithdrawBank({
    required this.itemQuantity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
