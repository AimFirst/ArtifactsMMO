import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/artifacts_exception.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_accept_new_task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_buy_bank_expansion.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_complete_task.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_crafting.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_delete_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_deposit_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_deposit_bank_gold.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_equip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_fight.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_gathering.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_ge_buy_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_ge_cancel_sell_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_ge_create_sell_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_move.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_recycling.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_rest.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_task_cancel.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_task_exchange.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_task_trade.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_unequip_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_use_item.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_withdraw_bank.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/action_withdraw_bank_gold.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/action/cooldown.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/combat/fight.dart' as ft;
import 'package:artifacts_mmo/infrastructure/api/dto/item/equipment_slot.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/order_transaction.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/task/task.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/character.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/item.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/map.dart';
import 'package:artifacts_mmo/infrastructure/api/impl/conversion/task.dart';

extension CooldownExtension on CooldownSchema {
  Cooldown convert() {
    return Cooldown(
      totalSeconds: totalSeconds,
      remainingSeconds: remainingSeconds,
      startedAt: startedAt,
      expiration: expiration,
      reason: reason,
    );
  }
}

extension ActionMoveToExtension on CharacterMovementResponseSchema {
  ActionMoveResponse convert() {
    return ActionMoveResponse(
      cooldown: CooldownExtension(data.cooldown).convert(),
      character: CharacterExtension(data.character).convert(),
      destination: MapConversion(data.destination).convert(),
    );
  }
}

extension DropSchemaExtension on DropSchema {
  ItemQuantity convert() {
    return ItemQuantity(
      code: code,
      quantity: quantity,
    );
  }
}

extension ActionGatherResponseConversion on SkillResponseSchema {
  ActionGatheringResponse convert() {
    return ActionGatheringResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        details: UseSkillResponse(
          xp: data.details.xp,
          items: data.details.items.map((i) => i.convert()).toList(),
        ));
  }
}

extension TaskResponseSchemaConversion on TaskResponseSchema {
  ActionAcceptNewTaskResponse convert() {
    return ActionAcceptNewTaskResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        task: data.task.convert());
  }
}

extension TaskSchemaConversion on TaskSchema {
  Task convert() {
    return Task(
      code: code,
      type: TaskTypeConversion(type).convert(),
      total: total,
      rewards: rewards.convert(),
    );
  }
}

extension ActionWithdrawBankGoldExtensions on ActionWithdrawBankGold {
  DepositWithdrawGoldSchema convert() {
    return (DepositWithdrawGoldSchemaBuilder()..quantity = quantity).build();
  }
}

extension ActionWithdrawBankExtensions on ActionWithdrawBank {
  SimpleItemSchema convert() {
    return (SimpleItemSchemaBuilder()
          ..code = itemQuantity.code
          ..quantity = itemQuantity.quantity)
        .build();
  }
}

extension UseItemResponseSchemaConversions on UseItemResponseSchema {
  ActionUseItemResponse convert() {
    return ActionUseItemResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        item: ItemConversion(data.item).convert());
  }
}

extension ActionUseItemConversions on ActionUseItem {
  SimpleItemSchema convert() {
    return (SimpleItemSchemaBuilder()
          ..quantity = itemQuantity.quantity
          ..code = itemQuantity.code)
        .build();
  }
}

extension ActionUnequipItemConversions on ActionUnequipItem {
  UnequipSchema convert() {
    return (UnequipSchemaBuilder()
          ..quantity = quantity
          ..slot = slot.convert())
        .build();
  }
}

extension TaskTradeResponseSchemaConversions on TaskTradeResponseSchema {
  ActionTaskTradeResponse convert() {
    return ActionTaskTradeResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        trade: data.trade.convert());
  }
}

extension TaskTradeSchemaConversions on TaskTradeSchema {
  ItemQuantity convert() {
    return ItemQuantity(code: code, quantity: quantity);
  }
}

extension ActionTaskTradeConversions on ActionTaskTrade {
  SimpleItemSchema convert() {
    return (SimpleItemSchemaBuilder()
          ..code = itemQuantity.code
          ..quantity = itemQuantity.quantity)
        .build();
  }
}

extension TaskCancelledResponseSchemaConversions
    on TaskCancelledResponseSchema {
  ActionTaskCancelResponse convert() {
    return ActionTaskCancelResponse(
        cooldown: data.cooldown.convert(), character: data.character.convert());
  }
}

extension CharacterRestResponseSchemaConversions
    on CharacterRestResponseSchema {
  ActionRestResponse convert() {
    return ActionRestResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        hpRestored: data.hpRestored);
  }
}

extension RecyclingResponseSchemaConversions on RecyclingResponseSchema {
  ActionRecyclingResponse convert() {
    return ActionRecyclingResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        returnedItems: data.details.items.map((i) => i.convert()).toList());
  }
}

extension ActionRecyclingConversions on ActionRecycling {
  RecyclingSchema convert() {
    return (RecyclingSchemaBuilder()
          ..quantity = itemQuantity.quantity
          ..code = itemQuantity.code)
        .build();
  }
}

extension GECreateOrderTransactionResponseSchemaConversions
    on GECreateOrderTransactionResponseSchema {
  ActionGECreateSellOrderResponse convert() {
    return ActionGECreateSellOrderResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        order: data.order.convert());
  }
}

extension GEOrderCreatedSchemaConversions on GEOrderCreatedSchema {
  OrderCreation convert() {
    return OrderCreation(
        id: id,
        createdAt: createdAt,
        itemQuantity: ItemQuantity(code: code, quantity: quantity),
        price: price,
        totalPrice: totalPrice,
        tax: tax);
  }
}

extension ActionGECreateSellOrderConversions on ActionGECreateSellOrder {
  GEOrderCreationrSchema convert() {
    return (GEOrderCreationrSchemaBuilder()
          ..code = itemQuantity.code
          ..quantity = itemQuantity.quantity
          ..price = price)
        .build();
  }
}

extension ActionGECancelSellOrderConversions on ActionGECancelSellOrder {
  GECancelOrderSchema convert() {
    return (GECancelOrderSchemaBuilder()..id = id).build();
  }
}

extension GETransactionResponseSchemaConversions
    on GETransactionResponseSchema {
  ActionGEBuyItemResponse convert() {
    return ActionGEBuyItemResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        order: data.order.convert());
  }

  ActionGECancelSellOrderResponse convertCancel() {
    return ActionGECancelSellOrderResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        order: data.order.convert());
  }
}

extension GETransactionSchemaConversions on GETransactionSchema {
  OrderTransaction convert() {
    return OrderTransaction(
      id: id,
      itemQuantity: ItemQuantity(code: code, quantity: quantity),
      price: price,
      totalPrice: totalPrice,
    );
  }
}

extension ActionGEBuyItemConversions on ActionGEBuyItem {
  GEBuyOrderSchema convert() {
    return (GEBuyOrderSchemaBuilder()
          ..quantity = itemQuantity.quantity
          ..id = itemQuantity.code)
        .build();
  }
}

extension CharacterFightResponseSchemaConversions
    on CharacterFightResponseSchema {
  ActionFightResponse convert() {
    return ActionFightResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        fight: data.fight.convert());
  }
}

extension FightSchemaConversions on FightSchema {
  ft.Fight convert() {
    return ft.Fight(
        xp: xp,
        gold: gold,
        drops: drops.map((d) => d.convert()).toList(),
        turns: turns,
        monsterBlockedHits: monsterBlockedHits.convert(),
        playerBlockedHits: playerBlockedHits.convert(),
        logs: logs.toList(),
        result: result.convert());
  }
}

extension BlockedHitsSchemaConversions on BlockedHitsSchema {
  ft.BlockedHits convert() {
    return ft.BlockedHits(
        fire: fire, earth: earth, water: water, air: air, total: total);
  }
}

extension FightResultConversions on FightResult {
  ft.FightResult convert() {
    switch (this) {
      case FightResult.loss:
        return ft.FightResult.loss;
      case FightResult.win:
        return ft.FightResult.win;
    }

    throw ArtifactsException(errorMessage: 'Failed conversion: $this');
  }
}

extension EquipmentResponseSchemaConversions on EquipmentResponseSchema {
  ActionEquipItemResponse convert() {
    return ActionEquipItemResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        slot: data.slot.convert(),
        item: data.item.convert());
  }

  ActionUnequipItemResponse convertUnequip() {
    return ActionUnequipItemResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        slot: data.slot.convert(),
        item: data.item.convert());
  }
}

extension ItemSlotConversions on ItemSlot {
  EquipmentSlot convert() {
    switch (this) {
      case ItemSlot.amulet:
        return EquipmentSlot.amulet;
      case ItemSlot.artifact1:
        return EquipmentSlot.artifact1;
      case ItemSlot.artifact2:
        return EquipmentSlot.artifact2;
      case ItemSlot.artifact3:
        return EquipmentSlot.artifact3;
      case ItemSlot.bodyArmor:
        return EquipmentSlot.bodyArmor;
      case ItemSlot.boots:
        return EquipmentSlot.boots;
      case ItemSlot.helmet:
        return EquipmentSlot.helmet;
      case ItemSlot.legArmor:
        return EquipmentSlot.legArmor;
      case ItemSlot.ring1:
        return EquipmentSlot.ring1;
      case ItemSlot.ring2:
        return EquipmentSlot.ring2;
      case ItemSlot.shield:
        return EquipmentSlot.shield;
      case ItemSlot.utility1:
        return EquipmentSlot.utility1;
      case ItemSlot.utility2:
        return EquipmentSlot.utility2;
      case ItemSlot.weapon:
        return EquipmentSlot.weapon;
    }

    throw ArtifactsException(errorMessage: 'Failed conversion: $this');
  }
}

extension ActionEquipItemConversions on ActionEquipItem {
  EquipSchema convert() {
    return (EquipSchemaBuilder()
          ..quantity = quantity
          ..code = code
          ..slot = slot.convert())
        .build();
  }
}

extension EquipmentSlotConversions on EquipmentSlot {
  ItemSlot convert() {
    switch (this) {
      case EquipmentSlot.amulet:
        return ItemSlot.amulet;
      case EquipmentSlot.artifact1:
        return ItemSlot.artifact1;
      case EquipmentSlot.artifact2:
        return ItemSlot.artifact2;
      case EquipmentSlot.artifact3:
        return ItemSlot.artifact3;
      case EquipmentSlot.bodyArmor:
        return ItemSlot.bodyArmor;
      case EquipmentSlot.boots:
        return ItemSlot.boots;
      case EquipmentSlot.helmet:
        return ItemSlot.helmet;
      case EquipmentSlot.legArmor:
        return ItemSlot.legArmor;
      case EquipmentSlot.ring1:
        return ItemSlot.ring1;
      case EquipmentSlot.ring2:
        return ItemSlot.ring2;
      case EquipmentSlot.shield:
        return ItemSlot.shield;
      case EquipmentSlot.utility1:
        return ItemSlot.utility1;
      case EquipmentSlot.utility2:
        return ItemSlot.utility2;
      case EquipmentSlot.weapon:
        return ItemSlot.weapon;
    }
  }
}

extension BankGoldTransactionResponseSchemaConversions
    on BankGoldTransactionResponseSchema {
  ActionDepositBankGoldResponse convert() {
    return ActionDepositBankGoldResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        bank: data.bank.quantity);
  }

  ActionWithdrawBankGoldResponse convertWithdraw() {
    return ActionWithdrawBankGoldResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        bank: data.bank.quantity);
  }
}

extension ActionDepositBankGoldConversions on ActionDepositBankGold {
  DepositWithdrawGoldSchema convert() {
    return (DepositWithdrawGoldSchemaBuilder()..quantity = bank).build();
  }
}

extension BankItemTransactionResponseSchemaConversions
    on BankItemTransactionResponseSchema {
  ActionDepositBankResponse convert() {
    return ActionDepositBankResponse(
      cooldown: CooldownExtension(data.cooldown).convert(),
      character: CharacterExtension(data.character).convert(),
      item: data.item.convert(),
      bank: data.bank.map((i) => i.convert()).toList(),
    );
  }

  ActionWithdrawBankResponse convertWithdraw() {
    return ActionWithdrawBankResponse(
      cooldown: CooldownExtension(data.cooldown).convert(),
      character: CharacterExtension(data.character).convert(),
      item: data.item.convert(),
      bank: data.bank.map((i) => i.convert()).toList(),
    );
  }
}

extension ActionDepositBankConversions on ActionDepositBank {
  SimpleItemSchema convert() {
    return (SimpleItemSchemaBuilder()
          ..code = itemQuantity.code
          ..quantity = itemQuantity.quantity)
        .build();
  }
}

extension DeleteItemResponseSchemaConversions on DeleteItemResponseSchema {
  ActionDeleteItemResponse convert() {
    return ActionDeleteItemResponse(
      cooldown: CooldownExtension(data.cooldown).convert(),
      character: CharacterExtension(data.character).convert(),
      itemQuantity:
          ItemQuantity(code: data.item.code, quantity: data.item.quantity),
    );
  }
}

extension ActionDeleteItemConversions on ActionDeleteItem {
  SimpleItemSchema convert() {
    return (SimpleItemSchemaBuilder()
          ..code = itemQuantity.code
          ..quantity = itemQuantity.quantity)
        .build();
  }
}

extension ActionCraftingConversions on ActionCrafting {
  CraftingSchema convert() {
    return (CraftingSchemaBuilder()
          ..quantity = itemQuantity.quantity
          ..code = itemQuantity.code)
        .build();
  }
}

extension SkillResponseSchemaConversions on SkillResponseSchema {
  ActionCraftingResponse convertToCraftingResponse() {
    return ActionCraftingResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        details: data.details.convert());
  }
}

extension SkillInfoSchemaConversions on SkillInfoSchema {
  UseSkillResponse convert() {
    return UseSkillResponse(
        xp: xp, items: items.map((i) => i.convert()).toList());
  }
}

extension TasksRewardDataResponseSchemaConversions
    on RewardDataResponseSchema {
  ActionCompleteTaskResponse convert() {
    return ActionCompleteTaskResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        reward: data.rewards.convert());
  }

  ActionTaskExchangeResponse convertExchange() {
    return ActionTaskExchangeResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        reward: data.rewards.convert());
  }
}

extension BankExtensionTransactionResponseSchemaConversions
    on BankExtensionTransactionResponseSchema {
  ActionBuyBankExpansionResponse convert() {
    return ActionBuyBankExpansionResponse(
        cooldown: CooldownExtension(data.cooldown).convert(),
        character: CharacterExtension(data.character).convert(),
        price: data.transaction.price);
  }
}
