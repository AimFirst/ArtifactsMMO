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
