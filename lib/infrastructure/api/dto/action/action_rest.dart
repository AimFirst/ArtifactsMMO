import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:equatable/equatable.dart';

class ActionRestResponse extends ActionResponse {
  final int hpRestored;

  ActionRestResponse({
    required super.cooldown,
    required super.character,
    required this.hpRestored,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        hpRestored,
      ];
}

class ActionRest extends Action {
  ActionRest({required super.characterName});
}
