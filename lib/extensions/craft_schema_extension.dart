import 'package:artifacts_api/artifacts_api.dart';

extension RecipeSchemaExtension on CraftSchema {
  bool get canRecycle =>
      skill == CraftSkill.gearcrafting ||
      skill == CraftSkill.jewelrycrafting ||
      skill == CraftSkill.weaponcrafting;
}
