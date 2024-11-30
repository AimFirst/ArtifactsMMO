import 'package:artifacts_mmo/infrastructure/api/dto/map/map_location.dart';
import 'package:equatable/equatable.dart';

class ActiveEvent with EquatableMixin {
  final String name;
  final String code;
  final MapLocation map;
  final String previousSkin;
  final int duration;
  final DateTime expiration;
  final DateTime createdAt;

  ActiveEvent({required this.name, required this.code, required this.map, required this.previousSkin, required this.duration, required this.expiration, required this.createdAt});

  @override
  List<Object?> get props => [name, code, map, previousSkin, duration, expiration, createdAt];
}