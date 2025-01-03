// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EquipmentLoadoutCWProxy {
  EquipmentLoadout weapon(EquipmentSlotItem weapon);

  EquipmentLoadout shield(EquipmentSlotItem shield);

  EquipmentLoadout helmet(EquipmentSlotItem helmet);

  EquipmentLoadout bodyArmor(EquipmentSlotItem bodyArmor);

  EquipmentLoadout legArmor(EquipmentSlotItem legArmor);

  EquipmentLoadout boots(EquipmentSlotItem boots);

  EquipmentLoadout rings(List<EquipmentSlotItem> rings);

  EquipmentLoadout amulet(EquipmentSlotItem amulet);

  EquipmentLoadout artifacts(List<EquipmentSlotItem> artifacts);

  EquipmentLoadout utilities(List<QuantityEquipmentSlot> utilities);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EquipmentLoadout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EquipmentLoadout(...).copyWith(id: 12, name: "My name")
  /// ````
  EquipmentLoadout call({
    EquipmentSlotItem weapon,
    EquipmentSlotItem shield,
    EquipmentSlotItem helmet,
    EquipmentSlotItem bodyArmor,
    EquipmentSlotItem legArmor,
    EquipmentSlotItem boots,
    List<EquipmentSlotItem> rings,
    EquipmentSlotItem amulet,
    List<EquipmentSlotItem> artifacts,
    List<QuantityEquipmentSlot> utilities,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEquipmentLoadout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEquipmentLoadout.copyWith.fieldName(...)`
class _$EquipmentLoadoutCWProxyImpl implements _$EquipmentLoadoutCWProxy {
  const _$EquipmentLoadoutCWProxyImpl(this._value);

  final EquipmentLoadout _value;

  @override
  EquipmentLoadout weapon(EquipmentSlotItem weapon) => this(weapon: weapon);

  @override
  EquipmentLoadout shield(EquipmentSlotItem shield) => this(shield: shield);

  @override
  EquipmentLoadout helmet(EquipmentSlotItem helmet) => this(helmet: helmet);

  @override
  EquipmentLoadout bodyArmor(EquipmentSlotItem bodyArmor) =>
      this(bodyArmor: bodyArmor);

  @override
  EquipmentLoadout legArmor(EquipmentSlotItem legArmor) =>
      this(legArmor: legArmor);

  @override
  EquipmentLoadout boots(EquipmentSlotItem boots) => this(boots: boots);

  @override
  EquipmentLoadout rings(List<EquipmentSlotItem> rings) => this(rings: rings);

  @override
  EquipmentLoadout amulet(EquipmentSlotItem amulet) => this(amulet: amulet);

  @override
  EquipmentLoadout artifacts(List<EquipmentSlotItem> artifacts) =>
      this(artifacts: artifacts);

  @override
  EquipmentLoadout utilities(List<QuantityEquipmentSlot> utilities) =>
      this(utilities: utilities);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EquipmentLoadout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EquipmentLoadout(...).copyWith(id: 12, name: "My name")
  /// ````
  EquipmentLoadout call({
    Object? weapon = const $CopyWithPlaceholder(),
    Object? shield = const $CopyWithPlaceholder(),
    Object? helmet = const $CopyWithPlaceholder(),
    Object? bodyArmor = const $CopyWithPlaceholder(),
    Object? legArmor = const $CopyWithPlaceholder(),
    Object? boots = const $CopyWithPlaceholder(),
    Object? rings = const $CopyWithPlaceholder(),
    Object? amulet = const $CopyWithPlaceholder(),
    Object? artifacts = const $CopyWithPlaceholder(),
    Object? utilities = const $CopyWithPlaceholder(),
  }) {
    return EquipmentLoadout(
      weapon: weapon == const $CopyWithPlaceholder()
          ? _value.weapon
          // ignore: cast_nullable_to_non_nullable
          : weapon as EquipmentSlotItem,
      shield: shield == const $CopyWithPlaceholder()
          ? _value.shield
          // ignore: cast_nullable_to_non_nullable
          : shield as EquipmentSlotItem,
      helmet: helmet == const $CopyWithPlaceholder()
          ? _value.helmet
          // ignore: cast_nullable_to_non_nullable
          : helmet as EquipmentSlotItem,
      bodyArmor: bodyArmor == const $CopyWithPlaceholder()
          ? _value.bodyArmor
          // ignore: cast_nullable_to_non_nullable
          : bodyArmor as EquipmentSlotItem,
      legArmor: legArmor == const $CopyWithPlaceholder()
          ? _value.legArmor
          // ignore: cast_nullable_to_non_nullable
          : legArmor as EquipmentSlotItem,
      boots: boots == const $CopyWithPlaceholder()
          ? _value.boots
          // ignore: cast_nullable_to_non_nullable
          : boots as EquipmentSlotItem,
      rings: rings == const $CopyWithPlaceholder()
          ? _value.rings
          // ignore: cast_nullable_to_non_nullable
          : rings as List<EquipmentSlotItem>,
      amulet: amulet == const $CopyWithPlaceholder()
          ? _value.amulet
          // ignore: cast_nullable_to_non_nullable
          : amulet as EquipmentSlotItem,
      artifacts: artifacts == const $CopyWithPlaceholder()
          ? _value.artifacts
          // ignore: cast_nullable_to_non_nullable
          : artifacts as List<EquipmentSlotItem>,
      utilities: utilities == const $CopyWithPlaceholder()
          ? _value.utilities
          // ignore: cast_nullable_to_non_nullable
          : utilities as List<QuantityEquipmentSlot>,
    );
  }
}

extension $EquipmentLoadoutCopyWith on EquipmentLoadout {
  /// Returns a callable class that can be used as follows: `instanceOfEquipmentLoadout.copyWith(...)` or like so:`instanceOfEquipmentLoadout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EquipmentLoadoutCWProxy get copyWith => _$EquipmentLoadoutCWProxyImpl(this);
}
