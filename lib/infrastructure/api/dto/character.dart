import 'package:artifacts_mmo/infrastructure/api/dto/location.dart';
import 'package:equatable/equatable.dart';

class Character with EquatableMixin {
  final String name;
  final int level;
  final Location location;
  final DateTime cooldownEnd;

  Character({required this.name, required this.level, required this.location, required this.cooldownEnd});

  @override
  List<Object?> get props => [name, level, location, cooldownEnd];
}
