import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

abstract class ActionBankItemResponse extends ActionBankResponse {
  final Item item;
  final List<ItemQuantity> bank;

  ActionBankItemResponse({
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

abstract class ActionBankItem extends ActionBank {
  final ItemQuantity itemQuantity;

  ActionBankItem({
    required this.itemQuantity,
    required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
