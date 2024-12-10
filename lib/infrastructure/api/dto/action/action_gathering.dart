import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';

class ActionGatheringResponse extends ActionResponse {
  final UseSkillResponse details;

  ActionGatheringResponse({
    required super.cooldown,
    required super.character,
    required this.details,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        details,
      ];
}

class ActionGathering extends Action {
  ActionGathering({required super.characterName});
}
