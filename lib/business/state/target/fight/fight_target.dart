import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/fight/fight_level_target.dart';
import 'package:artifacts_mmo/business/state/target/fight/heal_target.dart';
import 'package:artifacts_mmo/business/state/target/move/move_to_target.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/business/util/math.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_fight.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/monster/monster.dart';

abstract class FightTarget extends Target {
  FightTarget({required super.parentTarget});

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final progress = getProgress(character: character, boardState: boardState);
    if (progress.finished) {
      return TargetProcessResult(
          progress: progress,
          action: null,
          description: 'Fight target done.',
          imageUrl: 'https://artifactsmmo.com/images/items/iron_sword.png');
    }

    final heal = HealTarget(parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
    if (!heal.progress.finished) {
      return heal;
    }

    List<Monster> targetMonsters =
        getTargetMonster(character: character, boardState: boardState);
    for (final monster in targetMonsters) {
      // If we think we can defeat this monster, use it.
      if (canDefeatMonster(character: character, monster: monster)) {
        // Find the closest one.
        final locations = boardState.contentLocations[Content(
              type: ContentType.monster,
              code: monster.code,
            )] ??
            [];
        locations
            .sort((a, b) => MathUtil.sortDistance(character.location, a, b));

        // Move there.
        final moveAction = MoveToTarget(targetLocation: locations.first, parentTarget: this).update(
            character: character,
            boardState: boardState,
            artifactsClient: artifactsClient);
        if (!moveAction.progress.finished) {
          return moveAction;
        }

        return TargetProcessResult(
            progress: progress,
            action: artifactsClient.fight(
                action: ActionFight(characterName: character.name)),
            description: 'Fighting $monster',
            imageUrl:
                'https://artifactsmmo.com/images/items/christmas_star.png');
      }
    }
    return FightLevelTarget(level: character.overall.level + 1, parentTarget: this).update(
        character: character,
        boardState: boardState,
        artifactsClient: artifactsClient);
  }

  bool canDefeatMonster({
    required Character character,
    required Monster monster,
  }) {
    return monster.level < 10;
  }

  List<Monster> getTargetMonster({
    required Character character,
    required BoardState boardState,
  });

  Progress getProgress({
    required Character character,
    required BoardState boardState,
  });
}
