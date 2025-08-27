import 'package:artifacts_api/artifacts_api.dart';

extension CraftExtension on CraftSchema {
  String get station => switch (this.skill) {
        CraftSkill.weaponcrafting => 'weapon_shop',
        CraftSkill.gearcrafting => 'armor_shop',
        CraftSkill.jewelrycrafting => 'jewelry_shop',
        CraftSkill.cooking => 'cooking_shop',
        CraftSkill.woodcutting => 'woodcutting_shop',
        CraftSkill.mining => 'mining_shop',
        CraftSkill.alchemy => 'alchemy_shop',
        null => '',
        CraftSkill() => '',
      };
}
