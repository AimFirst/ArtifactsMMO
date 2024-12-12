// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StateCWProxy {
  State boardState(BoardState boardState);

  State characterStates(Map<String, CharacterState> characterStates);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// State(...).copyWith(id: 12, name: "My name")
  /// ````
  State call({
    BoardState boardState,
    Map<String, CharacterState> characterStates,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfState.copyWith.fieldName(...)`
class _$StateCWProxyImpl implements _$StateCWProxy {
  const _$StateCWProxyImpl(this._value);

  final State _value;

  @override
  State boardState(BoardState boardState) => this(boardState: boardState);

  @override
  State characterStates(Map<String, CharacterState> characterStates) =>
      this(characterStates: characterStates);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// State(...).copyWith(id: 12, name: "My name")
  /// ````
  State call({
    Object? boardState = const $CopyWithPlaceholder(),
    Object? characterStates = const $CopyWithPlaceholder(),
  }) {
    return State(
      boardState: boardState == const $CopyWithPlaceholder()
          ? _value.boardState
          // ignore: cast_nullable_to_non_nullable
          : boardState as BoardState,
      characterStates: characterStates == const $CopyWithPlaceholder()
          ? _value.characterStates
          // ignore: cast_nullable_to_non_nullable
          : characterStates as Map<String, CharacterState>,
    );
  }
}

extension $StateCopyWith on State {
  /// Returns a callable class that can be used as follows: `instanceOfState.copyWith(...)` or like so:`instanceOfState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StateCWProxy get copyWith => _$StateCWProxyImpl(this);
}

abstract class _$BoardStateCWProxy {
  BoardState map(Map<Location, MapLocation> map);

  BoardState resources(List<Resource> resources);

  BoardState contentLocations(Map<Content, List<Location>> contentLocations);

  BoardState dropsFromResources(
      Map<Content, List<Resource>> dropsFromResources);

  BoardState itemsByCraftType(Map<SkillType, List<Item>> itemsByCraftType);

  BoardState items(List<Item> items);

  BoardState monsters(List<Monster> monsters);

  BoardState dropsFromMonsters(Map<Content, List<Monster>> dropsFromMonsters);

  BoardState activeEvents(List<ActiveEvent> activeEvents);

  BoardState tasks(List<Task> tasks);

  BoardState achievements(List<Achievement> achievements);

  BoardState bankItems(List<ItemQuantity> bankItems);

  BoardState bankDetails(BankDetails bankDetails);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BoardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BoardState(...).copyWith(id: 12, name: "My name")
  /// ````
  BoardState call({
    Map<Location, MapLocation> map,
    List<Resource> resources,
    Map<Content, List<Location>> contentLocations,
    Map<Content, List<Resource>> dropsFromResources,
    Map<SkillType, List<Item>> itemsByCraftType,
    List<Item> items,
    List<Monster> monsters,
    Map<Content, List<Monster>> dropsFromMonsters,
    List<ActiveEvent> activeEvents,
    List<Task> tasks,
    List<Achievement> achievements,
    List<ItemQuantity> bankItems,
    BankDetails bankDetails,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBoardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBoardState.copyWith.fieldName(...)`
class _$BoardStateCWProxyImpl implements _$BoardStateCWProxy {
  const _$BoardStateCWProxyImpl(this._value);

  final BoardState _value;

  @override
  BoardState map(Map<Location, MapLocation> map) => this(map: map);

  @override
  BoardState resources(List<Resource> resources) => this(resources: resources);

  @override
  BoardState contentLocations(Map<Content, List<Location>> contentLocations) =>
      this(contentLocations: contentLocations);

  @override
  BoardState dropsFromResources(
          Map<Content, List<Resource>> dropsFromResources) =>
      this(dropsFromResources: dropsFromResources);

  @override
  BoardState itemsByCraftType(Map<SkillType, List<Item>> itemsByCraftType) =>
      this(itemsByCraftType: itemsByCraftType);

  @override
  BoardState items(List<Item> items) => this(items: items);

  @override
  BoardState monsters(List<Monster> monsters) => this(monsters: monsters);

  @override
  BoardState dropsFromMonsters(Map<Content, List<Monster>> dropsFromMonsters) =>
      this(dropsFromMonsters: dropsFromMonsters);

  @override
  BoardState activeEvents(List<ActiveEvent> activeEvents) =>
      this(activeEvents: activeEvents);

  @override
  BoardState tasks(List<Task> tasks) => this(tasks: tasks);

  @override
  BoardState achievements(List<Achievement> achievements) =>
      this(achievements: achievements);

  @override
  BoardState bankItems(List<ItemQuantity> bankItems) =>
      this(bankItems: bankItems);

  @override
  BoardState bankDetails(BankDetails bankDetails) =>
      this(bankDetails: bankDetails);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BoardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BoardState(...).copyWith(id: 12, name: "My name")
  /// ````
  BoardState call({
    Object? map = const $CopyWithPlaceholder(),
    Object? resources = const $CopyWithPlaceholder(),
    Object? contentLocations = const $CopyWithPlaceholder(),
    Object? dropsFromResources = const $CopyWithPlaceholder(),
    Object? itemsByCraftType = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? monsters = const $CopyWithPlaceholder(),
    Object? dropsFromMonsters = const $CopyWithPlaceholder(),
    Object? activeEvents = const $CopyWithPlaceholder(),
    Object? tasks = const $CopyWithPlaceholder(),
    Object? achievements = const $CopyWithPlaceholder(),
    Object? bankItems = const $CopyWithPlaceholder(),
    Object? bankDetails = const $CopyWithPlaceholder(),
  }) {
    return BoardState(
      map: map == const $CopyWithPlaceholder()
          ? _value.map
          // ignore: cast_nullable_to_non_nullable
          : map as Map<Location, MapLocation>,
      resources: resources == const $CopyWithPlaceholder()
          ? _value.resources
          // ignore: cast_nullable_to_non_nullable
          : resources as List<Resource>,
      contentLocations: contentLocations == const $CopyWithPlaceholder()
          ? _value.contentLocations
          // ignore: cast_nullable_to_non_nullable
          : contentLocations as Map<Content, List<Location>>,
      dropsFromResources: dropsFromResources == const $CopyWithPlaceholder()
          ? _value.dropsFromResources
          // ignore: cast_nullable_to_non_nullable
          : dropsFromResources as Map<Content, List<Resource>>,
      itemsByCraftType: itemsByCraftType == const $CopyWithPlaceholder()
          ? _value.itemsByCraftType
          // ignore: cast_nullable_to_non_nullable
          : itemsByCraftType as Map<SkillType, List<Item>>,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Item>,
      monsters: monsters == const $CopyWithPlaceholder()
          ? _value.monsters
          // ignore: cast_nullable_to_non_nullable
          : monsters as List<Monster>,
      dropsFromMonsters: dropsFromMonsters == const $CopyWithPlaceholder()
          ? _value.dropsFromMonsters
          // ignore: cast_nullable_to_non_nullable
          : dropsFromMonsters as Map<Content, List<Monster>>,
      activeEvents: activeEvents == const $CopyWithPlaceholder()
          ? _value.activeEvents
          // ignore: cast_nullable_to_non_nullable
          : activeEvents as List<ActiveEvent>,
      tasks: tasks == const $CopyWithPlaceholder()
          ? _value.tasks
          // ignore: cast_nullable_to_non_nullable
          : tasks as List<Task>,
      achievements: achievements == const $CopyWithPlaceholder()
          ? _value.achievements
          // ignore: cast_nullable_to_non_nullable
          : achievements as List<Achievement>,
      bankItems: bankItems == const $CopyWithPlaceholder()
          ? _value.bankItems
          // ignore: cast_nullable_to_non_nullable
          : bankItems as List<ItemQuantity>,
      bankDetails: bankDetails == const $CopyWithPlaceholder()
          ? _value.bankDetails
          // ignore: cast_nullable_to_non_nullable
          : bankDetails as BankDetails,
    );
  }
}

extension $BoardStateCopyWith on BoardState {
  /// Returns a callable class that can be used as follows: `instanceOfBoardState.copyWith(...)` or like so:`instanceOfBoardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BoardStateCWProxy get copyWith => _$BoardStateCWProxyImpl(this);
}
