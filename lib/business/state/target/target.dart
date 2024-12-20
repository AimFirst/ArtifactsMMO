import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:equatable/equatable.dart';

abstract class Target {
  TargetProcessResult update({
    required Character character,
    required BoardState boardState,
    required ArtifactsClient artifactsClient,
  });

  String get name;
}

class TargetProcessResult with EquatableMixin {
  final Progress progress;
  final Future<ActionResponse>? action;
  final String description;
  final String? imageUrl;

  TargetProcessResult(
      {required this.progress,
      required this.action,
      required this.description,
      required this.imageUrl});

  TargetProcessResult.empty()
      : progress = Progress.empty(),
        action = null,
        description = '',
        imageUrl = null;

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
