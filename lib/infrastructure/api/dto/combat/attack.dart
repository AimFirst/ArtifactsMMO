import 'package:artifacts_mmo/infrastructure/api/dto/combat/combat_type.dart';
import 'package:equatable/equatable.dart';

class Attack with EquatableMixin {
  final CombatType type;
  final int attack;

  Attack({required this.type, required this.attack});

  @override
  List<Object?> get props => [type, attack];
}