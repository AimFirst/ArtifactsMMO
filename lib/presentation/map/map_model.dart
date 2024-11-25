import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map_location.dart';
import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:equatable/equatable.dart';

sealed class MapModel implements BaseModel {}

class MapModelLoading with EquatableMixin implements MapModel {
  @override
  List<Object?> get props => [];

}

class MapModelError with EquatableMixin implements MapModel {
  final String error;

  MapModelError({required this.error});

  @override
  List<Object?> get props => [error];
}

class MapModelLoaded with EquatableMixin implements MapModel {
  final List<MapLocation> locations;
  final Location characterLocation;

  MapModelLoaded({required this.locations, required this.characterLocation});

  @override
  List<Object?> get props => [locations, characterLocation];
}
