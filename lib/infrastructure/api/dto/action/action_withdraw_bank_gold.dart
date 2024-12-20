import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';

class ActionWithdrawBankGoldResponse extends ActionResponse {
  final int bank;

  ActionWithdrawBankGoldResponse({
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

class ActionWithdrawBankGold extends Action {
  final int quantity;

  ActionWithdrawBankGold({
    required this.quantity,
    required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        quantity,
      ];
}
