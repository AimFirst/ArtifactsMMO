// Defines the context for a gear decision
import 'package:artifacts_api/artifacts_api.dart';

class GearEvaluationContext {
  final String taskType; // e.g., 'mining', 'fighting'
  final MonsterSchema?
  targetMonster; // The specific monster for fighting context

  GearEvaluationContext({required this.taskType, this.targetMonster});

  @override
  String toString() {
    return targetMonster == null ? taskType : '$taskType:${targetMonster?.code}';
  }
}