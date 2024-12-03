import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_rest.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';

class HealTarget extends Target {
  @override
  String get name => 'Heal';

  @override
  TargetProcessResult update({required Character character, required BoardState boardState, required ArtifactsClient artifactsClient}) {
    final progress = Progress(current: character.hp.toDouble(), target: character.maxHp.toDouble());
    
    if (progress.finished) {
      return TargetProcessResult(progress: progress, action: null, description: 'Fully healed', imageUrl: 'https://artifactsmmo.com/images/items/life_crystal.png');
    }

    return TargetProcessResult(progress: progress, action: artifactsClient.rest(action: ActionRest()), description: 'Resting to restore health.', imageUrl: 'https://artifactsmmo.com/images/items/small_health_potion.png');
  }
  
}