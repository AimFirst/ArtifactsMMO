// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AccountAchievementSchema.serializer)
      ..add(AccountDetails.serializer)
      ..add(AccountDetailsSchema.serializer)
      ..add(AccountLeaderboardSchema.serializer)
      ..add(AccountLeaderboardType.serializer)
      ..add(AccountStatus.serializer)
      ..add(AchievementResponseSchema.serializer)
      ..add(AchievementRewardsSchema.serializer)
      ..add(AchievementSchema.serializer)
      ..add(AchievementType.serializer)
      ..add(ActionType.serializer)
      ..add(ActiveEventSchema.serializer)
      ..add(AddAccountSchema.serializer)
      ..add(AddCharacterSchema.serializer)
      ..add(AnnouncementSchema.serializer)
      ..add(BadgeConditionSchema.serializer)
      ..add(BadgeResponseSchema.serializer)
      ..add(BadgeSchema.serializer)
      ..add(BankExtensionSchema.serializer)
      ..add(BankExtensionTransactionResponseSchema.serializer)
      ..add(BankExtensionTransactionSchema.serializer)
      ..add(BankGoldTransactionResponseSchema.serializer)
      ..add(BankGoldTransactionSchema.serializer)
      ..add(BankItemTransactionResponseSchema.serializer)
      ..add(BankItemTransactionSchema.serializer)
      ..add(BankResponseSchema.serializer)
      ..add(BankSchema.serializer)
      ..add(BlockedHitsSchema.serializer)
      ..add(ChangePassword.serializer)
      ..add(CharacterFightDataSchema.serializer)
      ..add(CharacterFightResponseSchema.serializer)
      ..add(CharacterLeaderboardSchema.serializer)
      ..add(CharacterLeaderboardType.serializer)
      ..add(CharacterMovementDataSchema.serializer)
      ..add(CharacterMovementResponseSchema.serializer)
      ..add(CharacterResponseSchema.serializer)
      ..add(CharacterRestDataSchema.serializer)
      ..add(CharacterRestResponseSchema.serializer)
      ..add(CharacterSchema.serializer)
      ..add(CharacterSkin.serializer)
      ..add(CooldownSchema.serializer)
      ..add(CraftSchema.serializer)
      ..add(CraftSkill.serializer)
      ..add(CraftingSchema.serializer)
      ..add(DataPageAccountAchievementSchema.serializer)
      ..add(DataPageAccountLeaderboardSchema.serializer)
      ..add(DataPageAchievementSchema.serializer)
      ..add(DataPageActiveEventSchema.serializer)
      ..add(DataPageBadgeSchema.serializer)
      ..add(DataPageCharacterLeaderboardSchema.serializer)
      ..add(DataPageDropRateSchema.serializer)
      ..add(DataPageEventSchema.serializer)
      ..add(DataPageGEOrderSchema.serializer)
      ..add(DataPageGeOrderHistorySchema.serializer)
      ..add(DataPageItemSchema.serializer)
      ..add(DataPageLogSchema.serializer)
      ..add(DataPageMapSchema.serializer)
      ..add(DataPageMonsterSchema.serializer)
      ..add(DataPageResourceSchema.serializer)
      ..add(DataPageSimpleItemSchema.serializer)
      ..add(DataPageTaskFullSchema.serializer)
      ..add(DeleteCharacterSchema.serializer)
      ..add(DeleteItemResponseSchema.serializer)
      ..add(DeleteItemSchema.serializer)
      ..add(DepositWithdrawGoldSchema.serializer)
      ..add(DestinationSchema.serializer)
      ..add(DropRateSchema.serializer)
      ..add(DropSchema.serializer)
      ..add(EquipRequestSchema.serializer)
      ..add(EquipSchema.serializer)
      ..add(EquipmentResponseSchema.serializer)
      ..add(EventContentSchema.serializer)
      ..add(EventMapSchema.serializer)
      ..add(EventSchema.serializer)
      ..add(FightResult.serializer)
      ..add(FightSchema.serializer)
      ..add(GEBuyOrderSchema.serializer)
      ..add(GECancelOrderSchema.serializer)
      ..add(GECreateOrderTransactionResponseSchema.serializer)
      ..add(GEOrderCreatedSchema.serializer)
      ..add(GEOrderCreationrSchema.serializer)
      ..add(GEOrderReponseSchema.serializer)
      ..add(GEOrderSchema.serializer)
      ..add(GEOrderTransactionSchema.serializer)
      ..add(GETransactionListSchema.serializer)
      ..add(GETransactionResponseSchema.serializer)
      ..add(GETransactionSchema.serializer)
      ..add(GatheringSkill.serializer)
      ..add(GeOrderHistorySchema.serializer)
      ..add(GoldSchema.serializer)
      ..add(HTTPValidationError.serializer)
      ..add(InventorySlot.serializer)
      ..add(ItemEffectSchema.serializer)
      ..add(ItemResponseSchema.serializer)
      ..add(ItemSchema.serializer)
      ..add(ItemSlot.serializer)
      ..add(ItemType.serializer)
      ..add(LogSchema.serializer)
      ..add(LogType.serializer)
      ..add(MapContentSchema.serializer)
      ..add(MapContentType.serializer)
      ..add(MapResponseSchema.serializer)
      ..add(MapSchema.serializer)
      ..add(MonsterResponseSchema.serializer)
      ..add(MonsterSchema.serializer)
      ..add(MyAccountDetails.serializer)
      ..add(MyAccountDetailsSchema.serializer)
      ..add(MyCharactersListSchema.serializer)
      ..add(RecyclingDataSchema.serializer)
      ..add(RecyclingItemsSchema.serializer)
      ..add(RecyclingResponseSchema.serializer)
      ..add(RecyclingSchema.serializer)
      ..add(ResourceResponseSchema.serializer)
      ..add(ResourceSchema.serializer)
      ..add(ResponseSchema.serializer)
      ..add(RewardDataResponseSchema.serializer)
      ..add(RewardDataSchema.serializer)
      ..add(RewardResponseSchema.serializer)
      ..add(RewardsSchema.serializer)
      ..add(SimpleItemSchema.serializer)
      ..add(Skill.serializer)
      ..add(SkillDataSchema.serializer)
      ..add(SkillInfoSchema.serializer)
      ..add(SkillResponseSchema.serializer)
      ..add(StatusResponseSchema.serializer)
      ..add(StatusSchema.serializer)
      ..add(TaskCancelledResponseSchema.serializer)
      ..add(TaskCancelledSchema.serializer)
      ..add(TaskDataSchema.serializer)
      ..add(TaskFullResponseSchema.serializer)
      ..add(TaskFullSchema.serializer)
      ..add(TaskResponseSchema.serializer)
      ..add(TaskSchema.serializer)
      ..add(TaskTradeDataSchema.serializer)
      ..add(TaskTradeResponseSchema.serializer)
      ..add(TaskTradeSchema.serializer)
      ..add(TaskType.serializer)
      ..add(TokenResponseSchema.serializer)
      ..add(UnequipSchema.serializer)
      ..add(UseItemResponseSchema.serializer)
      ..add(UseItemSchema.serializer)
      ..add(ValidationError.serializer)
      ..add(ValidationErrorLocInner.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AccountAchievementSchema)]),
          () => new ListBuilder<AccountAchievementSchema>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AccountLeaderboardSchema)]),
          () => new ListBuilder<AccountLeaderboardSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AchievementSchema)]),
          () => new ListBuilder<AchievementSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ActiveEventSchema)]),
          () => new ListBuilder<ActiveEventSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnnouncementSchema)]),
          () => new ListBuilder<AnnouncementSchema>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(BadgeConditionSchema)]),
          () => new ListBuilder<BadgeConditionSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(BadgeSchema)]),
          () => new ListBuilder<BadgeSchema>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CharacterLeaderboardSchema)]),
          () => new ListBuilder<CharacterLeaderboardSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CharacterSchema)]),
          () => new ListBuilder<CharacterSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DropRateSchema)]),
          () => new ListBuilder<DropRateSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DropRateSchema)]),
          () => new ListBuilder<DropRateSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DropRateSchema)]),
          () => new ListBuilder<DropRateSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DropSchema)]),
          () => new ListBuilder<DropSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DropSchema)]),
          () => new ListBuilder<DropSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DropSchema)]),
          () => new ListBuilder<DropSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(EventMapSchema)]),
          () => new ListBuilder<EventMapSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(EventSchema)]),
          () => new ListBuilder<EventSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GEOrderSchema)]),
          () => new ListBuilder<GEOrderSchema>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GeOrderHistorySchema)]),
          () => new ListBuilder<GeOrderHistorySchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(InventorySlot)]),
          () => new ListBuilder<InventorySlot>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ItemEffectSchema)]),
          () => new ListBuilder<ItemEffectSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ItemSchema)]),
          () => new ListBuilder<ItemSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LogSchema)]),
          () => new ListBuilder<LogSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MapSchema)]),
          () => new ListBuilder<MapSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MonsterSchema)]),
          () => new ListBuilder<MonsterSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ResourceSchema)]),
          () => new ListBuilder<ResourceSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleItemSchema)]),
          () => new ListBuilder<SimpleItemSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleItemSchema)]),
          () => new ListBuilder<SimpleItemSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleItemSchema)]),
          () => new ListBuilder<SimpleItemSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SimpleItemSchema)]),
          () => new ListBuilder<SimpleItemSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TaskFullSchema)]),
          () => new ListBuilder<TaskFullSchema>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ValidationError)]),
          () => new ListBuilder<ValidationError>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ValidationErrorLocInner)]),
          () => new ListBuilder<ValidationErrorLocInner>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType.nullable(JsonObject)]),
          () => new ListBuilder<JsonObject?>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType.nullable(JsonObject)]),
          () => new ListBuilder<JsonObject?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
