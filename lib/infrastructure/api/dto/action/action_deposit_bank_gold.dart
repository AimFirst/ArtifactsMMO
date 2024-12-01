import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';

class ActionDepositBankGoldResponse extends ActionResponse {
  final int bank;

  ActionDepositBankGoldResponse({
    required super.cooldown,
    required super.character,
    required this.bank,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        bank,
      ];
}

class ActionDepositBankGold extends Action {
  final int quantity;

  ActionDepositBankGold({
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        quantity,
      ];
}
