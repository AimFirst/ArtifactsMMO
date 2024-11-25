import 'package:artifacts_mmo/infrastructure/api/dto/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:equatable/equatable.dart';

class MapLocation with EquatableMixin {
  final Location location;
  final Content content;
  MapLocation({required this.location, required this.content});

  MapLocation.empty() : location = Location.empty(), content = Content.empty();

  @override
  List<Object?> get props => [location, content];

}