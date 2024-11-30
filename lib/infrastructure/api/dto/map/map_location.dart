import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:equatable/equatable.dart';

class MapLocation with EquatableMixin {
  final Location location;
  final Content? content;
  final String skin;
  MapLocation({required this.location, required this.content, required this.skin});

  MapLocation.empty() : location = Location.empty(), content = Content.empty(), skin = '';

  @override
  List<Object?> get props => [location, content];

}