import 'package:artifacts_mmo/infrastructure/api/dto/craft/craft.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:equatable/equatable.dart';

class Item with EquatableMixin {
  final String name;
  final String code;
  final int level;
  final String type;
  final String subType;
  final String description;
  final List<Effect> effects;
  final Craft? craft;
  final bool tradeable;

  Item({
    required this.name,
    required this.code,
    required this.level,
    required this.type,
    required this.subType,
    required this.description,
    required this.effects,
    required this.craft,
    required this.tradeable,
  });

  @override
  List<Object?> get props => [
        name,
        code,
        level,
        type,
        subType,
        description,
        effects,
        craft,
        tradeable,
      ];
}
