import 'package:artifacts_mmo/infrastructure/api/dto/bank/bank_details.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'bank.g.dart';

@CopyWith()
class Bank with EquatableMixin {
  final BankDetails bankDetails;
  final List<ItemQuantity> items;

  Bank({required this.bankDetails, required this.items});

  Bank.empty()
      : bankDetails = BankDetails.empty(),
        items = [];

  @override
  List<Object?> get props => [bankDetails, items];
}
