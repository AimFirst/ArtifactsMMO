import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/gathering/gathering_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class GatheringSkillTarget extends GatheringTarget {
  final SkillType skillType;
  final int targetLevel;

  GatheringSkillTarget({
    required this.skillType,
    required this.targetLevel, required super.parentTarget, required super.characterLog,
  });

  @override
  String get name => 'Skill $skillType';

  Skill getCurrentSkill(
      {required Character character, required SkillType skillType}) {
    return [...character.allSkills, character.overall]
        .firstWhere((s) => s.skillType == skillType);
  }

  @override
  List<Resource> getTargetResource(
      {required Character character, required BoardState boardState}) {
    final currentSkill =
        getCurrentSkill(character: character, skillType: skillType);

    // Get highest item for skill.
    final resources = boardState.resources
        .where((r) =>
            r.skillType == skillType && r.skillLevel <= currentSkill.level)
        .toList();
    resources.sort((a, b) => b.skillLevel - a.skillLevel);
    return [resources.first];
  }

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    final currentSkill =
        getCurrentSkill(character: character, skillType: skillType);
    return Progress(
        current: currentSkill.level.toDouble() +
            (currentSkill.xp / currentSkill.nextLevelTargetXp),
        target: targetLevel.toDouble());
  }
}
