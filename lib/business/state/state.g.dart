// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StateCWProxy {
  State boardState(BoardState boardState);

  State character(Character character);

  State target(Target target);

  State processResult(TargetProcessResult processResult);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// State(...).copyWith(id: 12, name: "My name")
  /// ````
  State call({
    BoardState boardState,
    Character character,
    Target target,
    TargetProcessResult processResult,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfState.copyWith.fieldName(...)`
class _$StateCWProxyImpl implements _$StateCWProxy {
  const _$StateCWProxyImpl(this._value);

  final State _value;

  @override
  State boardState(BoardState boardState) => this(boardState: boardState);

  @override
  State character(Character character) => this(character: character);

  @override
  State target(Target target) => this(target: target);

  @override
  State processResult(TargetProcessResult processResult) =>
      this(processResult: processResult);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// State(...).copyWith(id: 12, name: "My name")
  /// ````
  State call({
    Object? boardState = const $CopyWithPlaceholder(),
    Object? character = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
    Object? processResult = const $CopyWithPlaceholder(),
  }) {
    return State(
      boardState: boardState == const $CopyWithPlaceholder()
          ? _value.boardState
          // ignore: cast_nullable_to_non_nullable
          : boardState as BoardState,
      character: character == const $CopyWithPlaceholder()
          ? _value.character
          // ignore: cast_nullable_to_non_nullable
          : character as Character,
      target: target == const $CopyWithPlaceholder()
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as Target,
      processResult: processResult == const $CopyWithPlaceholder()
          ? _value.processResult
          // ignore: cast_nullable_to_non_nullable
          : processResult as TargetProcessResult,
    );
  }
}

extension $StateCopyWith on State {
  /// Returns a callable class that can be used as follows: `instanceOfState.copyWith(...)` or like so:`instanceOfState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StateCWProxy get copyWith => _$StateCWProxyImpl(this);
}
