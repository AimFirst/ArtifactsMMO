import 'package:artifacts_mmo/infrastructure/api/dto/drop/drop.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:equatable/equatable.dart';

class Resource with EquatableMixin {
  final String name;
  final String code;
  final SkillType skillType;
  final int skillLevel;
  final List<DropRate> drops;

  Resource({
    required this.name,
    required this.code,
    required this.skillType,
    required this.skillLevel,
    required this.drops,
  });

  @override
  List<Object?> get props => [name, code, skillType, skillLevel, drops];

  String get imageUrl => 'https://artifactsmmo.com/images/resources/$code.png';
}
