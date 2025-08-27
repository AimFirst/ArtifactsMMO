import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';

extension MonsterExtensions on MonsterSchema {
  Map<ElementEnum, int> get attacks => {
    ElementEnum.fire: attackFire,
    ElementEnum.water: attackWater,
    ElementEnum.earth: attackEarth,
    ElementEnum.air: attackAir,
  };

  Map<ElementEnum, int> get damages => {
    ElementEnum.fire: 0,
    ElementEnum.water: 0,
    ElementEnum.earth: 0,
    ElementEnum.air: 0,
  };

  Map<ElementEnum, int> get resistances => {
    ElementEnum.fire: resFire,
    ElementEnum.water: resWater,
    ElementEnum.earth: resEarth,
    ElementEnum.air: resAir,
  };
}