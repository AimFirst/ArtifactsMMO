import 'package:equatable/equatable.dart';

class DropRate with EquatableMixin {
  final String code;
  /// \>= 1. Where actual rate is 1/rate
  final int rate;
  final int minQuantity;
  final int maxQuantity;

  DropRate({required this.code, required this.rate, required this.minQuantity, required this.maxQuantity});

  @override
  List<Object?> get props => [code, rate, minQuantity, maxQuantity];
}