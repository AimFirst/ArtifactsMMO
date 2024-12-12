import 'package:artifacts_mmo/infrastructure/api/dto/action/action_bank.dart';

abstract class ActionBankGoldResponse extends ActionBankResponse {
  final int bank;

  ActionBankGoldResponse({
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

abstract class ActionBankGold extends ActionBank {
  final int bank;

  ActionBankGold({
    required this.bank, required super.characterName,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    bank,
  ];
}
