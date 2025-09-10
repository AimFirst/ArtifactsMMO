// Defines the context for a gear decision
import 'package:artifacts_api/artifacts_api.dart';

sealed class GearEvaluationContext {
  GearEvaluationContext();

  String toCacheKey();
}

final class CombatGearEvaluationContext extends GearEvaluationContext {
  final MonsterSchema targetMonster;
  CombatGearEvaluationContext({required this.targetMonster});

  @override
  toString() {
    return 'CombatGearEvaluationContext(targetMonster: ${targetMonster.name})';
  }

  @override
  String toCacheKey() {
    return 'combat-${targetMonster.code}';
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
  String toCacheKey() {
    return 'skill-$skillType';
  }
}

final class HealGearEvaluationContext extends GearEvaluationContext {
  final int hpToRestore;
  HealGearEvaluationContext({required this.hpToRestore});

  @override
  String toString() {
    return 'HealGearEvaluationContext(hpToRestore: $hpToRestore)';
  }

  @override
  String toCacheKey() {
    return 'heal-$hpToRestore';
  }
}