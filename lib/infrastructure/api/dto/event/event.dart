import 'package:artifacts_mmo/infrastructure/api/dto/item/content.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/map/location.dart';
import 'package:equatable/equatable.dart';

class Event with EquatableMixin {
  final String name;
  final String code;
  final List<Location> maps;
  final String skin;
  final int duration;
  final int rate;
  final Content content;

  Event({
    required this.name,
    required this.code,
    required this.maps,
    required this.skin,
    required this.duration,
    required this.rate,
    required this.content,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        maps,
        skin,
        duration,
        rate,
        content,
      ];
}
