import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class ActionCraftingResponse extends ActionResponse {
  final UseSkillResponse details;

  ActionCraftingResponse({
    required super.cooldown,
    required super.character,
    required this.details,
  });

  @override
  List<Object?> get props => [...super.props, details];
}

class ActionCrafting extends Action {
  final ItemQuantity itemQuantity;

  ActionCrafting({
    required this.itemQuantity, required super.characterName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        itemQuantity,
      ];
}
