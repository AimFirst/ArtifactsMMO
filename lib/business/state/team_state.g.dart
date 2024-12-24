// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TeamStateCWProxy {
  TeamState playerSkillRolesMap(
      Map<String, List<RoleType>> playerSkillRolesMap);

  TeamState neededItems(PrioritizedList<UniqueItemQuantityRequest> neededItems);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeamState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeamState(...).copyWith(id: 12, name: "My name")
  /// ````
  TeamState call({
    Map<String, List<RoleType>> playerSkillRolesMap,
    PrioritizedList<UniqueItemQuantityRequest> neededItems,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTeamState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTeamState.copyWith.fieldName(...)`
class _$TeamStateCWProxyImpl implements _$TeamStateCWProxy {
  const _$TeamStateCWProxyImpl(this._value);

  final TeamState _value;

  @override
  TeamState playerSkillRolesMap(
          Map<String, List<RoleType>> playerSkillRolesMap) =>
      this(playerSkillRolesMap: playerSkillRolesMap);

  @override
  TeamState neededItems(
          PrioritizedList<UniqueItemQuantityRequest> neededItems) =>
      this(neededItems: neededItems);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeamState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeamState(...).copyWith(id: 12, name: "My name")
  /// ````
  TeamState call({
    Object? playerSkillRolesMap = const $CopyWithPlaceholder(),
    Object? neededItems = const $CopyWithPlaceholder(),
  }) {
    return TeamState(
      playerSkillRolesMap: playerSkillRolesMap == const $CopyWithPlaceholder()
          ? _value.playerSkillRolesMap
          // ignore: cast_nullable_to_non_nullable
          : playerSkillRolesMap as Map<String, List<RoleType>>,
      neededItems: neededItems == const $CopyWithPlaceholder()
          ? _value.neededItems
          // ignore: cast_nullable_to_non_nullable
          : neededItems as PrioritizedList<UniqueItemQuantityRequest>,
    );
  }
}

extension $TeamStateCopyWith on TeamState {
  /// Returns a callable class that can be used as follows: `instanceOfTeamState.copyWith(...)` or like so:`instanceOfTeamState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TeamStateCWProxy get copyWith => _$TeamStateCWProxyImpl(this);
}
