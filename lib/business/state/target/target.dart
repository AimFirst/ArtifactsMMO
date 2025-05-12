import 'package:artifacts_mmo/business/state/character_log.dart';
import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'target.g.dart';

abstract class Target {
  final Target? parentTarget;
  final CharacterLog characterLog;

  Target({
    required this.parentTarget,
    required this.characterLog,
  });

  TargetProcessResult update({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  });

  String get name;
}

@CopyWith()
class TargetOption<T> with EquatableMixin {
  final String name;
  final T value;

  TargetOption({required this.name, required this.value});

  @override
  List<Object?> get props => [name, value];
}

class TargetProcessResult with EquatableMixin {
  final Progress progress;
  final Future<ActionResponse>? action;
  final String description;
  final String? imageUrl;

  TargetProcessResult({
    required this.progress,
    required this.action,
    required this.description,
    required this.imageUrl,
  });

  TargetProcessResult.empty()
      : progress = Progress.empty(),
        action = null,
        description = '',
        imageUrl = null;

  TargetProcessResult.noAction({this.description = 'No action', this.imageUrl})
      : progress = Progress.done(),
        action = null;

  @override
  List<Object?> get props => [
        progress,
        action,
      ];
}

class Progress {
  final double current;
  final double target;

  Progress({required this.current, required this.target});

  Progress.empty()
      : current = 0,
        target = 1;

  Progress.done()
      : current = 1,
        target = 1;

  bool get finished => current >= target;

  double get progress => current / target;
}
