import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/skill/skill.dart';
import 'package:equatable/equatable.dart';

class Craft with EquatableMixin {
  final SkillType? skill;
  final int? level;
  final List<ItemQuantity> items;
  final int? quantity;

  Craft({
    required this.skill,
    required this.level,
    required this.items,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        skill,
        level,
        items,
        quantity,
      ];
}
