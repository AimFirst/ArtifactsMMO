import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/constants/element_enum.dart';
import 'package:artifacts_mmo/models/location_schema.dart';

extension CharacterExtensions on CharacterSchema {
  LocationSchema get location => LocationSchema(x: x, y: y);
  int get inventoryCount => inventory?.fold(0, (sum, item) => ((sum ?? 0) + item.quantity)) ?? 0;

  Map<GatheringSkill, int> get gatheringSkills => {
    GatheringSkill.mining: miningLevel,
    GatheringSkill.woodcutting: woodcuttingLevel,
    GatheringSkill.fishing: fishingLevel,
    GatheringSkill.alchemy: alchemyLevel,
  };

  Map<CraftSkill, int> get craftSkills =>
  {
    CraftSkill.alchemy: alchemyLevel,
    CraftSkill.jewelrycrafting: jewelrycraftingLevel,
    CraftSkill.gearcrafting: gearcraftingLevel,
    CraftSkill.weaponcrafting: weaponcraftingLevel,
    CraftSkill.cooking: cookingLevel,
    CraftSkill.mining: miningLevel,
    CraftSkill.woodcutting: woodcuttingLevel,
  };

  Map<ElementEnum, int> get attacks => {
    ElementEnum.fire: attackFire,
    ElementEnum.water: attackWater,
    ElementEnum.earth: attackEarth,
    ElementEnum.air: attackAir,
  };

  Map<ElementEnum, int> get damages => {
    ElementEnum.fire: dmgFire,
    ElementEnum.water: dmgWater,
    ElementEnum.earth: dmgEarth,
    ElementEnum.air: dmgAir,
  };

  Map<ElementEnum, int> get resistances => {
    ElementEnum.fire: resFire,
    ElementEnum.water: resWater,
    ElementEnum.earth: resEarth,
    ElementEnum.air: resAir,
  };
}