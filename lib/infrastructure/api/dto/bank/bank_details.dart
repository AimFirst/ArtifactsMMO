import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'bank_details.g.dart';

@CopyWith()
class BankDetails with EquatableMixin {
  final int slots;
  final int expansions;
  final int nextExpansionCost;
  final int gold;

  BankDetails(
      {required this.slots,
      required this.expansions,
      required this.nextExpansionCost,
      required this.gold});

  BankDetails.empty()
      : slots = 0,
        expansions = 0,
        nextExpansionCost = 0,
        gold = 0;

  @override
  List<Object?> get props => [
        slots,
        expansions,
        nextExpansionCost,
        gold,
      ];
}
