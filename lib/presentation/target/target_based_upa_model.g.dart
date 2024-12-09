// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_based_upa_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TargetBasedUpaModelLoadedCWProxy {
  TargetBasedUpaModelLoaded state(State state);

  TargetBasedUpaModelLoaded menuOptions(List<MenuOption> menuOptions);

  TargetBasedUpaModelLoaded selectedChar(String selectedChar);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TargetBasedUpaModelLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TargetBasedUpaModelLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TargetBasedUpaModelLoaded call({
    State state,
    List<MenuOption> menuOptions,
    String selectedChar,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTargetBasedUpaModelLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTargetBasedUpaModelLoaded.copyWith.fieldName(...)`
class _$TargetBasedUpaModelLoadedCWProxyImpl
    implements _$TargetBasedUpaModelLoadedCWProxy {
  const _$TargetBasedUpaModelLoadedCWProxyImpl(this._value);

  final TargetBasedUpaModelLoaded _value;

  @override
  TargetBasedUpaModelLoaded state(State state) => this(state: state);

  @override
  TargetBasedUpaModelLoaded menuOptions(List<MenuOption> menuOptions) =>
      this(menuOptions: menuOptions);

  @override
  TargetBasedUpaModelLoaded selectedChar(String selectedChar) =>
      this(selectedChar: selectedChar);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TargetBasedUpaModelLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TargetBasedUpaModelLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TargetBasedUpaModelLoaded call({
    Object? state = const $CopyWithPlaceholder(),
    Object? menuOptions = const $CopyWithPlaceholder(),
    Object? selectedChar = const $CopyWithPlaceholder(),
  }) {
    return TargetBasedUpaModelLoaded(
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as State,
      menuOptions: menuOptions == const $CopyWithPlaceholder()
          ? _value.menuOptions
          // ignore: cast_nullable_to_non_nullable
          : menuOptions as List<MenuOption>,
      selectedChar: selectedChar == const $CopyWithPlaceholder()
          ? _value.selectedChar
          // ignore: cast_nullable_to_non_nullable
          : selectedChar as String,
    );
  }
}

extension $TargetBasedUpaModelLoadedCopyWith on TargetBasedUpaModelLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfTargetBasedUpaModelLoaded.copyWith(...)` or like so:`instanceOfTargetBasedUpaModelLoaded.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TargetBasedUpaModelLoadedCWProxy get copyWith =>
      _$TargetBasedUpaModelLoadedCWProxyImpl(this);
}

abstract class _$MenuOptionCWProxy {
  MenuOption type(MenuItemType type);

  MenuOption url(String url);

  MenuOption name(String name);

  MenuOption selected(bool selected);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuOption(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuOption(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuOption call({
    MenuItemType type,
    String url,
    String name,
    bool selected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuOption.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuOption.copyWith.fieldName(...)`
class _$MenuOptionCWProxyImpl implements _$MenuOptionCWProxy {
  const _$MenuOptionCWProxyImpl(this._value);

  final MenuOption _value;

  @override
  MenuOption type(MenuItemType type) => this(type: type);

  @override
  MenuOption url(String url) => this(url: url);

  @override
  MenuOption name(String name) => this(name: name);

  @override
  MenuOption selected(bool selected) => this(selected: selected);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuOption(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuOption(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuOption call({
    Object? type = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? selected = const $CopyWithPlaceholder(),
  }) {
    return MenuOption(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as MenuItemType,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      selected: selected == const $CopyWithPlaceholder()
          ? _value.selected
          // ignore: cast_nullable_to_non_nullable
          : selected as bool,
    );
  }
}

extension $MenuOptionCopyWith on MenuOption {
  /// Returns a callable class that can be used as follows: `instanceOfMenuOption.copyWith(...)` or like so:`instanceOfMenuOption.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuOptionCWProxy get copyWith => _$MenuOptionCWProxyImpl(this);
}
