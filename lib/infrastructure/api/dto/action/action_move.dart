import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';

class ActionMoveResponse extends ActionResponse {
  final MapLocation destination;

  ActionMoveResponse({
    required super.cooldown,
    required super.character,
    required this.destination,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        destination,
      ];
}

class ActionMove extends Action {
  final Location location;

  ActionMove({
    required this.location, required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        location,
      ];
}
