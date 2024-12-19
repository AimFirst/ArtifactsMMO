import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/craft/craft_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';

class CraftLevelTarget extends CraftTarget {
  final SkillType skillType;
  final int targetLevel;

  CraftLevelTarget({
    required this.skillType,
    required this.targetLevel,
  });

  @override
  Item getItemCraft({
    required Character character,
    required BoardState boardState,
  }) {
    final options = boardState.items.itemsByCraftType(skillType);
    
    if (options.isEmpty) {
      throw ArtifactsException(errorMessage: 'No crafts for $skillType');
    }
    options.sort((a, b) => b.level - a.level);

    return options.firstWhere((i) => i.craft != null && i.code != 'wooden_staff' && ((i.craft!.level ?? 1)  <= getCurrentSkill(character: character, skillType: skillType).level));
  }

  @override
  Progress getProgress(
      {required Character character, required BoardState boardState}) {
    return Progress(
      current: character.allSkills
          .firstWhere((s) => s.skillType == skillType)
          .level
          .toDouble(),
      target: targetLevel.toDouble(),
    );
  }

  Skill getCurrentSkill({required Character character, required SkillType skillType}) {
    return character.allSkills.firstWhere((s) => s.skillType == skillType);
  }

  @override
  String get name => 'Craft level: $skillType, $targetLevel';
}
