import 'package:artifacts_mmo/infrastructure/api/dto/combat/attack.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/drop/drop.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/combat/resistance.dart';
import 'package:equatable/equatable.dart';

class Monster with EquatableMixin {
  final String name;
  final String code;
  final int level;
  final int hp;
  final Attack fireAttack;
  final Attack earthAttack;
  final Attack waterAttack;
  final Attack airAttack;
  final Resistance fireResistance;
  final Resistance earthResistance;
  final Resistance waterResistance;
  final Resistance airResistance;
  final int minGold;
  final int maxGold;
  final List<DropRate> drops;

  Monster({
    required this.name,
    required this.code,
    required this.level,
    required this.hp,
    required this.fireAttack,
    required this.earthAttack,
    required this.waterAttack,
    required this.airAttack,
    required this.fireResistance,
    required this.earthResistance,
    required this.waterResistance,
    required this.airResistance,
    required this.minGold,
    required this.maxGold,
    required this.drops,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        level,
        hp,
        fireAttack,
        earthAttack,
        waterAttack,
        airAttack,
        fireResistance,
        earthResistance,
        waterResistance,
        airResistance,
        minGold,
        maxGold,
        drops,
      ];

  String get imageUrl => 'https://www.artifactsmmo.com/images/monsters/${name.toLowerCase()}.png';
}
