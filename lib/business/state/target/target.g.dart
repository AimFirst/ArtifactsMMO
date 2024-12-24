// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TargetOptionCWProxy<T> {
  TargetOption<T> name(String name);

  TargetOption<T> value(T value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TargetOption<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TargetOption<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  TargetOption<T> call({
    String name,
    T value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTargetOption.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTargetOption.copyWith.fieldName(...)`
class _$TargetOptionCWProxyImpl<T> implements _$TargetOptionCWProxy<T> {
  const _$TargetOptionCWProxyImpl(this._value);

  final TargetOption<T> _value;

  @override
  TargetOption<T> name(String name) => this(name: name);

  @override
  TargetOption<T> value(T value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TargetOption<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TargetOption<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  TargetOption<T> call({
    Object? name = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return TargetOption<T>(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as T,
    );
  }
}

extension $TargetOptionCopyWith<T> on TargetOption<T> {
  /// Returns a callable class that can be used as follows: `instanceOfTargetOption.copyWith(...)` or like so:`instanceOfTargetOption.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TargetOptionCWProxy<T> get copyWith => _$TargetOptionCWProxyImpl<T>(this);
}
