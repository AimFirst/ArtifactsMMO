import 'package:equatable/equatable.dart';

class Effect with EquatableMixin {
  final EffectType effectType;
  final int value;

  Effect({required this.effectType, required this.value});

  @override
  List<Object?> get props => [effectType, value];
}

enum EffectType {
  attackAir,
  resAir,
  dmgAir,
  boostResAir,
  boostDmgAir,
  attackEarth,
  resEarth,
  dmgEarth,
  boostResEarth,
  boostDmgEarth,
  attackFire,
  resFire,
  dmgFire,
  boostResFire,
  boostDmgFire,
  attackWater,
  resWater,
  dmgWater,
  boostResWater,
  boostDmgWater,
  mining,
  woodcutting,
  fishing,
  alchemy,
  heal,
  haste,
  restore,
  hp,
  boostHp,
  gold,
  teleportX,
  teleportY,
  inventorySpace,
  unknown,
}