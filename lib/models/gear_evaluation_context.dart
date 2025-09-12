// Defines the context for a gear decision
import 'package:artifacts_api/artifacts_api.dart';

sealed class GearEvaluationContext {
  GearEvaluationContext();

  String typeName();
  String subTypeName();
}

final class CombatGearEvaluationContext extends GearEvaluationContext {
  final MonsterSchema targetMonster;
  CombatGearEvaluationContext({required this.targetMonster});

  @override
  String typeName() {
    return 'combat';
  }

  @override
  String subTypeName() {
    return targetMonster.name;
  }

  @override
  toString() {
    return 'CombatGearEvaluationContext(targetMonster: ${targetMonster.name})';
  }
}

final class SkillGearEvaluationContext extends GearEvaluationContext {
  final String skillType;
  SkillGearEvaluationContext({required this.skillType});

  @override
  String toString() {
    return 'SkillGearEvaluationContext(skillType: $skillType)';
  }

  @override
  String typeName() =>'skill';

  @override
  String subTypeName() => skillType;
}

final class HealGearEvaluationContext extends GearEvaluationContext {
  final int hpToRestore;
  HealGearEvaluationContext({required this.hpToRestore});

  @override
  String toString() {
    return 'HealGearEvaluationContext(hpToRestore: $hpToRestore)';
  }

  @override
  String typeName() => 'heal';

  @override
  String subTypeName() => '';
}