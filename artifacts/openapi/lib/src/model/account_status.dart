//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_status.g.dart';

class AccountStatus extends EnumClass {
  @BuiltValueEnumConst(wireName: r'standard')
  static const AccountStatus standard = _$standard;
  @BuiltValueEnumConst(wireName: r'founder')
  static const AccountStatus founder = _$founder;
  @BuiltValueEnumConst(wireName: r'gold_founder')
  static const AccountStatus goldFounder = _$goldFounder;
  @BuiltValueEnumConst(wireName: r'vip_founder')
  static const AccountStatus vipFounder = _$vipFounder;

  static Serializer<AccountStatus> get serializer => _$accountStatusSerializer;

  const AccountStatus._(String name) : super(name);

  static BuiltSet<AccountStatus> get values => _$values;
  static AccountStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AccountStatusMixin = Object with _$AccountStatusMixin;
