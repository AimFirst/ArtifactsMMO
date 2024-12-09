// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CharacterStateCWProxy {
  CharacterState character(Character character);

  CharacterState target(Target target);

  CharacterState processResult(TargetProcessResult processResult);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterState(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterState call({
    Character character,
    Target target,
    TargetProcessResult processResult,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharacterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharacterState.copyWith.fieldName(...)`
class _$CharacterStateCWProxyImpl implements _$CharacterStateCWProxy {
  const _$CharacterStateCWProxyImpl(this._value);

  final CharacterState _value;

  @override
  CharacterState character(Character character) => this(character: character);

  @override
  CharacterState target(Target target) => this(target: target);

  @override
  CharacterState processResult(TargetProcessResult processResult) =>
      this(processResult: processResult);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CharacterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CharacterState(...).copyWith(id: 12, name: "My name")
  /// ````
  CharacterState call({
    Object? character = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
    Object? processResult = const $CopyWithPlaceholder(),
  }) {
    return CharacterState(
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

extension $CharacterStateCopyWith on CharacterState {
  /// Returns a callable class that can be used as follows: `instanceOfCharacterState.copyWith(...)` or like so:`instanceOfCharacterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CharacterStateCWProxy get copyWith => _$CharacterStateCWProxyImpl(this);
}
