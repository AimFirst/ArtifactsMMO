import 'dart:math';

import 'package:artifacts_mmo/business/state/state.dart';
import 'package:artifacts_mmo/business/state/target/target.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_rest.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_use_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/character/character.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/effect.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';

class HealTarget extends Target {
  @override
  String get name => 'Heal';

  @override
  TargetProcessResult update(
      {required Character character,
      required BoardState boardState,
      required ArtifactsClient artifactsClient}) {
    final progress = Progress(
        current: character.hp.toDouble(), target: character.maxHp.toDouble());

    if (progress.finished) {
      return TargetProcessResult(
          progress: progress,
          action: null,
          description: 'Fully healed',
          imageUrl: 'https://artifactsmmo.com/images/items/life_crystal.png');
    }

    // Look for an item that will heal us, but less than our missing health so we don't waste any.
    final missingHealth = character.maxHp - character.hp;
    final allHealingItems = boardState.items
        .itemsByEffectType(EffectType.heal)
        .where((i) => i.effects.first.value <= missingHealth);
    final allHealingItemsCodes = allHealingItems.map((h) => h.code);
    final myHealingItems = character.inventory.items
        .where((i) => i.quantity > 0 && allHealingItemsCodes.contains(i.code))
        .toList();
    myHealingItems.sort((a, b) =>
        allHealingItems
            .where((h) => h.code == b.code)
            .first
            .effects
            .first
            .value -
        allHealingItems
            .where((h) => h.code == a.code)
            .first
            .effects
            .first
            .value);
    if (myHealingItems.isNotEmpty) {
      final item = allHealingItems
          .where((h) => h.code == myHealingItems.first.code)
          .first;
      final healValue = item.effects.first.value;
      final count = (missingHealth / healValue).floor();
      final quantity = min(count, myHealingItems.first.quantity);
      return TargetProcessResult(
        progress: progress,
        action: artifactsClient.useItem(
            action: ActionUseItem(
                characterName: character.name,
                itemQuantity:
                    ItemQuantity(code: item.code, quantity: quantity))),
        description: 'Using ${item.name} x$quantity to heal.',
        imageUrl: item.imageUrl,
      );
    }

    return TargetProcessResult(
        progress: progress,
        action: artifactsClient.rest(
            action: ActionRest(characterName: character.name)),
        description: 'Resting to restore health.',
        imageUrl:
            'https://artifactsmmo.com/images/items/small_health_potion.png');
  }
}
