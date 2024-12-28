import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';

class NoTarget extends Target {
  NoTarget({required super.parentTarget, required super.characterLog});

  @override
  String get name => 'Awaiting target';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    characterLog.addLog('No target target - nothing to do.');
    return TargetProcessResult(
      progress: Progress(current: 1.toDouble(), target: 1.toDouble()),
      action: null,
      description: 'No action. Awaiting target.',
      imageUrl: 'https://artifactsmmo.com/images/items/gingerbread.png',
    );
  }
}
