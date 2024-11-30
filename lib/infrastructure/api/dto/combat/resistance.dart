import 'package:artifacts_mmo/infrastructure/api/dto/combat/combat_type.dart';
import 'package:equatable/equatable.dart';

class Resistance with EquatableMixin {
  final CombatType type;
  final int percentage;

  Resistance({
    required this.type,
    required this.percentage,
  });

  @override
  List<Object?> get props => [type, percentage];
}
