import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';

class ActionBuyBankExpansionResponse extends ActionResponse {
  final int price;

  ActionBuyBankExpansionResponse({
    required super.cooldown,
    required super.character,
    required this.price,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        price,
      ];
}

class ActionBuyBankExpansion extends Action {}
