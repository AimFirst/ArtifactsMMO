import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/combat/fight.dart';

class ActionFightResponse extends ActionResponse {
  final Fight fight;

  ActionFightResponse({
    required super.cooldown,
    required super.character,
    required this.fight,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        fight,
      ];
}

class ActionFight extends Action {
  @override
  List<Object?> get props => super.props;
}
