import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionTaskTradeResponse extends ActionResponse {
  final ItemQuantity trade;

  ActionTaskTradeResponse({
    required super.cooldown,
    required super.character,
    required this.trade,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        trade,
      ];
}

class ActionTaskTrade extends Action {
  final ItemQuantity itemQuantity;

  ActionTaskTrade({
    required this.itemQuantity, required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
